variable "rg_name" {
  description = "Name of the Resource Group"
}

variable "region" {
  description = "Geographic region resource will be deployed into"
}

variable "stor_name" {
  description = "Name of the storage account to create."
}

variable "stor_kind" {
  description = "Type of storage to use, valid inputs include Storage, StorageV2, BlobStorage"
  default     = "StorageV2"
}

variable "stor_tier" {
  default     = "Standard"
  description = "Tier of storage to use, valid inputs include Standard, Premium"
}

variable "retention_policy_days" {
  description = "Time in days that the resource will be still available after deletion"
  default = 7
}


variable "log_analytics_workspace_id" {
  description = "Log analytic workspace ID"
}

variable "stor_replication" {
  description = "Replication type to use, valid inputs include LRS, GRS, RAGRS, ZRS"
  default     = "LRS"
}

variable "access_tier" {
  description = "Defines the access tier for BlobStorage and StorageV2 accounts. Valid options are Hot and Cool."
  default     = "Hot"
}

variable "file_shares" {
  description = "File shares that will be created with the account"
  default = []
}

variable "containers" {
  description = "Containers that will be created with the account"
  default = []
}

variable "tags" {
  description = "Tags to be added to resources"
  default = {}
}
