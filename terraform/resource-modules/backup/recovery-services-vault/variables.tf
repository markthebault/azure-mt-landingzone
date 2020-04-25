variable "resource_group" {
  description = "The resource group where the resource will be created"
}

variable "rsv_name" {
  description = "The name of the Recovery Service Vault"
}

variable "sku" {
  description = "SKU for Recovery Services Vault"
  default     = "Standard"
}

variable "tags" {
  description = "Tags to be added to resource"
  type        = map
}
