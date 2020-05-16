#!/bin/bash
func_get_param_value(){
    if [ -z $1 ]; then
        echo "Value name must be given"
        exit 1
    fi

    val=$(cat $parameters_file | jq -r ".${1}")
    echo $val
}




set -e
BASEDIR=$(dirname "$0")

if [ $# -ne 2 ]; then
    echo "Usage: $0 account-name [pretf| init | plan | apply | destroy | show]"
    echo "account-name can be 'all' for all accounts of just the 'audit' for instance, this must match the tflz_<account-name>"
    exit 1
fi

#Get the account name
account_name=$1
shift 1


## Check env vars
if [[ -z "${TF_VAR_tf_sp_appid}" ]]; then
    echo "You must set TF_VAR_tf_sp_appid as env to be able to use terraform"
    exit 1
fi
if [[ -z "${TF_VAR_tf_sp_password}" ]]; then
    echo "You must set TF_VAR_tf_sp_appid as env to be able to use terraform"
    exit 1
fi

#Select folder is a specific value was given
folders=$(ls -d ${BASEDIR}/../tflz_*)
if [[ $account_name != "all" ]]; then
    folders="${BASEDIR}/../tflz_${account_name}"
fi

#Run what is needed for terraform
for dir in $folders; do
    cd "$dir";
    parameters_file="../../../parameters.json"
    #terraform validate --check-variables=false;

    #Get some variables
    tenant_id=$(cat ../../../accounts.json| jq -r ".tenant_id")
    subscription_id=$(cat terraform.tfvars| grep subscription_id | cut -d'=' -f2 | sed -e 's/^"//' -e 's/"$//')

    echo "*** Export Service principal variables to be able to fetch the backend"
    export ARM_CLIENT_ID=$TF_VAR_tf_sp_appid
    export ARM_CLIENT_SECRET=$TF_VAR_tf_sp_password
    export ARM_SUBSCRIPTION_ID=$subscription_id
    export ARM_TENANT_ID=$tenant_id

    case $1 in

    pretf)
        #Login with the service principal that terraform will run
        echo "Using tenant Id: $tenant_id"
        echo "Login with service principal, make sure it has 'Owner' rights on the subscriptions"
        az login --service-principal -u ${TF_VAR_tf_sp_appid} -p ${TF_VAR_tf_sp_password} -t $tenant_id
        
        
        #create storage account
        echo "******** Creating storage for backend"

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
        echo "*** Run terraform init"
        terraform init -backend-config=./backend.tfvars
        ;;

    plan)
        echo "*** Run terraform plan"
        terraform plan \
            -var-file=./terraform.tfvars \
            -var-file=../../globalvars.tfvars \
            -var-file=../../../accounts.json \
            -var-file=../../../parameters.json \
            -out terraform.out
        ;;

    apply)
        echo "*** Run terraform apply"
        terraform apply \
            -parallelism=15 \
            terraform.out
        ;;

    destroy)
        echo "*** Run terraform destroy"
        terraform destroy \
            -var-file=./terraform.tfvars \
            -var-file=../../globalvars.tfvars \
            -var-file=../../../accounts.json \
            -var-file=../../../parameters.json
        ;;

    show)
        echo "*** Run terraform show"
        terraform show -json
        ;;

    *)
        echo "Usage: $0 [pretf | init | plan | apply | destroy | show]"
        ;;
    esac

    cd -;
done