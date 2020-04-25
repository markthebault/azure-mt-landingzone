#!/bin/bash
set -e
BASEDIR=$(dirname "$0")

if [ -z $1 ]; then
    echo "Usage: $0 [pretf| init | plan | apply | destroy | show]"
    exit 1
fi



func_get_param_value(){
    if [ -z $1 ]; then
        echo "Value name must be given"
        exit 1
    fi

    val=$(cat $parameters_file | jq -r ".${1}")
    echo $val
}



for dir in $(ls -d ${BASEDIR}/../tflz_*); do
    cd "$dir";
    parameters_file="../../../parameters.json"
    #terraform validate --check-variables=false;
    case $1 in

    pretf)
        #create storage account
        echo "******** Creating storage for backend"
        subscription_id=$(cat terraform.tfvars| grep subscription_id | cut -d'=' -f2 | sed -e 's/^"//' -e 's/"$//')

        echo "Subscription id: $subscription_id"
        az account set --subscription $subscription_id
        subscription_short_name=$(cat terraform.tfvars| grep subscription_short_name | cut -d'=' -f2 | sed -e 's/^"//' -e 's/"$//')

        echo "Create storage resource-group"
        customer_name=$(func_get_param_value "customer_name")
        division=$(func_get_param_value "division")
        department=$(func_get_param_value "department")
        location=$(func_get_param_value "location")
        rg_name="${customer_name}-${division}-${department}-${subscription_short_name}-tfbackend-rg"
        az group create --name $rg_name --location $location

        echo "Create storage account"
        account_name=$(echo ${customer_name}-${division}-${department}-${subscription_short_name}-tf | tr -cd '[:alnum:]')
        az storage account create \
            --name $account_name \
            --resource-group $rg_name \
            --location $location \
            --sku Standard_RAGRS \
            --kind BlobStorage \
            --access-tier Hot \
            --https-only true
        
        echo "enable soft delte"
        az storage blob service-properties delete-policy update \
            --days-retained 31 \
            --account-name $account_name \
            --enable true

        echo "Create the container for the tf backend"
        container_name="tfstates"
        az storage container create \
            --account-name $account_name \
            --name $container_name \
            --auth-mode login
        
        echo "store backend information into backend.tfvars"
        echo "resource_group_name=\"$rg_name\"" > backend.tfvars
        echo "storage_account_name=\"$account_name\"" >> backend.tfvars
        echo "container_name=\"$container_name\"" >> backend.tfvars
        echo "key=\"landingzone.terraform.tfstate\"" >> backend.tfvars


        ;;

    init)
        terraform init -backend-config=./backend.tfvars
        ;;

    plan)
        terraform plan \
            -var-file=./terraform.tfvars \
            -var-file=../../globalvars.tfvars \
            -var-file=../../../accounts.json \
            -out terraform.out
        ;;

    apply)
        terraform apply \
            -parallelism=15 \
            terraform.out
        ;;

    destroy)
        terraform destroy \
            -var-file=./terraform.tfvars \
            -var-file=../../globalvars.tfvars \
            -var-file=../../../accounts.json
        ;;

    show)
        terraform show -json
        ;;

    *)
        echo "Usage: $0 [pretf | init | plan | apply | destroy | show]"
        ;;
    esac

    cd -;
done