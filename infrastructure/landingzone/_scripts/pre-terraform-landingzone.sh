#!/bin/bash
set -e
BASEDIR=$(dirname "$0")

parameters_file="${BASEDIR}/../../../parameters.json"
func_get_param_value(){
    if [ -z $1 ]; then
        echo "Value name must be given"
        exit 1
    fi

    val=$(cat $parameters_file | jq -r ".${1}")
    echo $val
}


##Enable cli
az extension add --name subscription

#Global parameters

customer_name=$(func_get_param_value "customer_name")
division=$(func_get_param_value "division")
department=$(func_get_param_value "department")

#Billing details
owner_subscriptions_object_id=$(func_get_param_value "owner_subscriptions_object_id")
subscriptions_enrolment_account_object_id=$(func_get_param_value "subscriptions_enrolment_account_object_id")
subscriptions_offer_type=$(func_get_param_value "subscriptions_offer_type")


#define needed subscriptions
names="network audit"

#Create terraform services principal
echo "Creating service principal to run terraform"
tf_sp_name="${customer_name}-${division}-${department}-tf-sp"
tf_sp_json=$(az ad sp create-for-rbac --name $tf_sp_name)
tf_sp_objectid=$(az ad sp list --display-name $tf_sp_name --query '[0].objectId' -o tsv)
echo "ObjectID of terraform service principal: $tf_sp_objectid"

#create subscription
for subscription_name in $names; do
    display_name="${customer_name}-${division}-${department}-${subscription_name}"
    echo Creating subscription: $display_name
    # az account create \
    #     --offer-type $subscriptions_offer_type \
    #     --display-name $display_name \
    #     --enrollment-account-object-id $subscriptions_enrolment_account_object_id \
    #     --owner-object-id ${owner_subscriptions_object_id},$tf_sp_objectid
done

#Export subscriptions values
# az account list | jq -r '.[] | {name, id}' | jq --raw-output '"\(.name)=\"\(.id)\""' > ${BASEDIR}/../../accounts.tfvars
az account list | jq -r '.[] | {name, id}' > ${BASEDIR}/../../../accounts.json

# Export terraform credentials
tf_sp_appid=$(echo $tf_sp_json | jq -r '.appId')
tf_sp_password=$(echo $tf_sp_json | jq -r '.password')
echo  export TF_VAR_tf_sp_appid=\"$tf_sp_appid\" > ${BASEDIR}/../../tf-sp.env
echo  export TF_VAR_tf_sp_password=\"$tf_sp_password\" >> ${BASEDIR}/../../tf-sp.env