variable "resource_group" {
  description = "The resource group"
}

variable "name" {
  type        = string
  description = "A prefix used for all resources in this module"
}

variable "retention_period" {
  description = "Retention period for logs and metrics"
  default = 7
}

variable "sku" {
  type = string
  description = "SKU for the log analtyics workspace"
  default = "PerGB2018"
}

variable "tags" {
  description = "A map of tags to set on every taggable resources. Default tag for resource identification are applied by default."
  default     = {}
}


