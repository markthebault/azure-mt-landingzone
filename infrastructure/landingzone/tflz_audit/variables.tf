## For the terraform provider
variable "subscription_id" {}
variable "tenant_id" {}
variable "tf_sp_appid" {}
variable "tf_sp_password" {}
variable "region" {}
variable subscription_short_name {}



variable "subscriptions_name_id" {}
variable "subscription_ids" {}
variable "root_mgnt_group_name" {
    description = "Name of the root management group"
}

variable governance_policies_matrix {
  description = "Matrix of the different policies to apply to the subscription"
}

variable "customer_name" {}
variable "division" {}
variable "department" {}
variable "tags" {}
