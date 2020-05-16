variable "resource_group_name" {
  description = "(Required) Name of the resource group to deploy the activity logs."
}

variable "location" {
  description = "(Required) Define the region where the resources will be created."
}

variable "sa_name" {
  type        = string
  description = "Name of the storage account used to store the event logs"
}


variable "logs_rentention" {
  description = "(Required) Number of days to keep the logs for long term retention"
}

variable "enable_event_hub" {
  description = "(Optional) Determine to deploy Event Hub for the configuration"
  default = true
}

variable "evthub_name" {
  type        = string
  description = "The name of the created event hub"
  default = ""
}


variable "tags" {
  description = "(Required) Tags for the logs repositories to be created "
  default = {}
}