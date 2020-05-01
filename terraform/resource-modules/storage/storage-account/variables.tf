variable "storage_location" {
  type        = string
  description = "storage location name"
}

variable "storage_account_name" {
  type        = string
  description = "storage account name"
}

variable "storage_resource_group_name" {
  type        = string
  description = "resource group name"
}

variable "storage_account_tier" {
  type        = string
  description = "account tier"
  default     = "Standard"
}

variable "storage_account_replication_type" {
  type        = string
  description = "account replication type"
  default     = "LRS"
}

variable "storage_enable_https_traffic_only" {
  type        = bool
  description = "Should storage endpoints be https only"
  default     = true
}


variable  "is_hns_enabled" {
  type = bool
  description = "Use Hierarchical namespaces (DataLake instead of Blob)"
  default = true
}

variable "network_rules_default_action" {
  description = "Firewall default action for the storage account"
  default = "Allow"
}
variable "storage_virtual_network_subnet_ids" {
  type        = list(string)
  description = "The list of vnet ids have access to storage"
  default = []
}

variable "shares" {
  description = "File shares which are needed to be created"
  type = list(object({
    file_share_name = string
    data_share_quota = number
  }))
  default = []
}

variable "kind" {
  description = "Type the storage account that will be created"
  default = "StorageV2"
}

variable "storage_network_cidrs_allowed" {
  type        = list(string)
  description = "The list of cidrs that have access to storage"
  default = []
}

variable "containers" {
  description = "List of containers to create and their access levels."
  type        = list(object({ name = string, access_type = string }))
  default     = []
}

variable "log_analytics_workspace_id" {
  description = "(Required) The id of the log analytics workspace, where the data should get pushed to"
}

variable "log_categories" {
  description = "(Optional) Log Categories to enable"
  type = list(object({
    name = string
    enabled = bool
    retention_days = number
  }))
  default = []
}
variable "metric_categories" {
  description = "(Optional) Metric Categories to enable"
  type = list(object({
    name = string
    enabled = bool
    retention_days = number
  }))
  default = [{
    name = "Capacity" 
    enabled = true
    retention_days = 7
  },{
    name = "Transaction" 
    enabled = true
    retention_days = 7
  }]
}


variable "retention_policy_days" {
  description = "Time in days that the resource will be still available after deletion, only supported for kind=BlobStorage"
  default = 7
}

variable "tags" {
  description = "Tags applied to the resources"
  default = {}
}