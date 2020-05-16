
#####################################################
## Global variables
#####################################################
variable subscription_id {
  description = "Subscription ID"
}
variable tenant_id {
  description = "Tenant ID of the customer"
}
variable tf_sp_appid {
  description = "Sevice principal app id to add to the provider"
}
variable tf_sp_password {
  description = "Sevice principal password to add to the provider"
}
variable region {
  description = "Main region where the resources will be created"
}
variable subscription_short_name {
  description = "Short name given to the subcription (max 5 chars)"
}
variable customer_name {
  description = "Short Name of the customer"
}
variable division {
  description = "Divison of the landing zone (2 chars)"
}
variable department {
  description = "Department of the customer (2 chars)"
}
variable tags {
  description = "Tags applied to the resources"
}


#####################################################
## Security variables
#####################################################
variable root_mgnt_group_name {
    description = "Name of the root management group"
}

variable governance_policies_matrix {
  description = "Matrix of the different policies to apply to the subscription"
}


