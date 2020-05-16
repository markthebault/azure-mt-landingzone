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
echo "##### Creating service principal to run terraform"
tf_sp_name="${customer_name}-${division}-${department}-tf-sp"
tf_sp_json=$(az ad sp create-for-rbac --name $tf_sp_name)
tf_sp_objectid=$(az ad sp list --display-name $tf_sp_name --query '[0].objectId' -o tsv)
tf_sp_appid=$(az ad sp list --display-name $tf_sp_name --query '[0].appId' -o tsv)

#######################
#Assign AD permissions, this block require admin concent
API_Microsoft_Graph="00000003-0000-0000-c000-000000000000"
PERMISSION_MG_Application_ReadWrite_OwnedBy="18a4783c-866b-4cc7-a460-3d5e5662c884"
API_Windows_Azure_Active_Directory="00000002-0000-0000-c000-000000000000"
PERMISSION_AAD_Application_ReadWrite_OwnedBy="824c81eb-e3f8-4ee6-8f6d-de7f50d565b7"

# Request Microsoft Graph API Application.ReadWrite.OwnedBy Permissions
az ad app permission add --id $tf_sp_appid --api $API_Microsoft_Graph --api-permissions $PERMISSION_MG_Application_ReadWrite_OwnedBy=Role
az ad app permission grant --id $tf_sp_appid --api $API_Microsoft_Graph --scope $PERMISSION_MG_Application_ReadWrite_OwnedBy

# Request Azure Active Directory Graph API Application.ReadWrite.OwnedBy Permissions
az ad app permission add --id $tf_sp_appid --api $API_Windows_Azure_Active_Directory --api-permissions $PERMISSION_AAD_Application_ReadWrite_OwnedBy=Role
az ad app permission grant --id $tf_sp_appid --api $API_Windows_Azure_Active_Directory --scope $PERMISSION_AAD_Application_ReadWrite_OwnedBy

# Grant Application & Delegated permissions through admin-consent
az ad app permission admin-consent --id $tf_sp_appid
#################### End of permissions
echo "##### ObjectID of terraform service principal: $tf_sp_objectid"

echo "##### create subscription"
for subscription_name in $names; do
    display_name="${customer_name}-${division}-${department}-${subscription_name}"
    echo Creating subscription: $display_name
    #TODO: uncomment to create subscriptions, this as not been tested
    # az account create \
    #     --offer-type $subscriptions_offer_type \
    #     --display-name $display_name \
    #     --enrollment-account-object-id $subscriptions_enrolment_account_object_id \
    #     --owner-object-id ${owner_subscriptions_object_id},$tf_sp_objectid
done

#Subscription permissions
echo "##### Grant SP permissions on the create subscriptions"
for sub_id in $(az account list --query "[].id" -o tsv); do
    az role assignment create --role Owner --assignee-object-id $tf_sp_objectid --scope "/subscriptions/$sub_id"
done

#Management group
echo "##### Give the right on management group"
tenant_id=$(az account show --query "tenantId" -o tsv)
mgnt_grp_id=$(az account management-group list --query '[0].id' -o tsv)
az role assignment create --role Owner --assignee-object-id $tf_sp_objectid --scope $mgnt_grp_id


#Export subscriptions values
echo "##### Exporting variables in accounts.json"
file_accounts="${BASEDIR}/../../../accounts.json"
echo '{' > $file_accounts


echo "\"tenant_id\":\"$tenant_id\"," >> $file_accounts

echo "\"subscription_ids\":" >> $file_accounts
az account list --query "[].id" >> $file_accounts
echo '}' >> $file_accounts


# Export terraform credentials
tf_sp_appid=$(echo $tf_sp_json | jq -r '.appId')
tf_sp_password=$(echo $tf_sp_json | jq -r '.password')
echo  export TF_VAR_tf_sp_appid=\"$tf_sp_appid\" > ${BASEDIR}/../../tf-sp.env
echo  export TF_VAR_tf_sp_password=\"$tf_sp_password\" >> ${BASEDIR}/../../tf-sp.env