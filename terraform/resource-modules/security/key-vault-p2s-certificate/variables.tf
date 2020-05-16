variable "key_vault_id" {
  description = "ID for the Key Vault that the certificate will be generated in"
}

variable "certificate_contents" {
  description = "The base64-encoded certificate contents. Changing this forces a new resource to be created."
}

variable "certificate_password" {
  description = "The password associated with the certificate. Changing this forces a new resource to be created."
}
