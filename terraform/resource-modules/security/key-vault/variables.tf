variable "name" {
  description = "Specifies the name of the Key Vault. Changing this forces a new resource to be created"
}

variable "resource_group" {
  description = "The resource group resource in which to create the Key Vault. Changing this forces a new resource to be created"
}


variable "sku_name" {
  description = "The Name of the SKU used for this Key Vault. Possible values are standard and premium"
  default     = "standard"
}


variable "log_analytics_workspace_id" {
  description = "The id of the log analytics workspace, where the data should get pushed to"
}

variable "log_categories" {
  description = "Log Categories to enable"
  type = list(object({
    name           = string
    enabled        = bool
    retention_days = number
  }))
  default = [{
    name           = "AuditEvent"
    enabled        = true
    retention_days = 7
  }]
}


variable "metric_categories" {
  description = "Metric Categories to enable"
  type = list(object({
    name           = string
    enabled        = bool
    retention_days = number
  }))
  default = [{
    name           = "AllMetrics"
    enabled        = true
    retention_days = 7
  }]
}


variable "tags" {
  description = "A mapping of tags to assign to the resource"
  default     = {}
}