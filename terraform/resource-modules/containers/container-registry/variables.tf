variable "name" {
  type        = string
  description = "A name used for the container registry"
}

variable "resource_group" {
  description = "The resource group where the ACR will be created"
}

variable "sku" {
  default     = "Standard"
  description = "The SKU of the container registry"
}

variable "log_categories" {
  description = "(Optional) Log Categories to enable"
  type = list(object({
    name = string
    enabled = bool
    retention_days = number
  }))
  default = [{
    name = "ContainerRegistryLoginEvents" 
    enabled = true
    retention_days = 7
  }, {
    name = "ContainerRegistryRepositoryEvents"
    enabled = true
    retention_days = 7
  }]
}

variable "metric_categories" {
  description = "(Optional) Metric Categories to enable"
  type = list(object({
    name = string
    enabled = bool
    retention_days = number
  }))
  default = [{
    name = "AllMetrics" 
    enabled = true
    retention_days = 7
  }]
}

variable "log_analytics_workspace_id" {
  description = "The id of the log analytics workspace, where all the diagnostics data should get stored in"
  type = string
}