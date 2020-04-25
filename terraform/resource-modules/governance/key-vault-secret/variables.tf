variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource"
  default     = {}
}

variable "content_type" {
  description = "(Optional) Specifies the content type for the Key Vault Secret."
  default     = "secret"
}

variable "config" {
  description = ""
  type = list(object({
    name         = string
    value        = string
    key_vault_id = string
  }))
}