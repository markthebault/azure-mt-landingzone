#!/bin/bash
set -e
BASEDIR=$(dirname "$0")

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

parameters_file="${BASEDIR}/../../../parameters.json"
customer_name=$(func_get_param_value "customer_name")
division=$(func_get_param_value "division")
department=$(func_get_param_value "department")

#Billing details
owner_subscriptions_object_id=$(func_get_param_value "owner_subscriptions_object_id")
subscriptions_enrolment_account_object_id=$(func_get_param_value "subscriptions_enrolment_account_object_id")
subscriptions_offer_type=$(func_get_param_value "subscriptions_offer_type")


#define needed subscriptions
names="network audit"

#create subscription
for subscription_name in $names; do
    display_name="${customer_name}-${division}-${department}-${subscription_name}"
    echo $display_name
    # az account create \
    #     --offer-type $subscriptions_offer_type \
    #     --display-name $display_name \
    #     --enrollment-account-object-id $subscriptions_enrolment_account_object_id \
    #     --owner-object-id ${owner_subscriptions_object_id}
done