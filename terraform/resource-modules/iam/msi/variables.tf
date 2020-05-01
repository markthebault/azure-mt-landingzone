variable "location" {
  description = "Location of where the user assigned managed identity will be deployed to"
  type        = string
}

variable "name" {
  description = "Name of the user assigned managed identity which will be used in the helm chart for referencing <a-idname>"
  type        = string
}

variable "resource_group" {
  type        = string
  description = "Name of the Resource Group where the user assigned Managed Identity should be deployed"
}

variable "roles" {
  description = "The information about which access the msi should get to which resources"
}



/* Only needed when you do not put the msi inside of the AKS Resources Resource Group (it starts with MC_)
variable "role_definition_name" {
  description = "Define the roles which the AKS SP should get assigned. A built-in Role name, like 'Reader' or 'Managed Identity Operator'" 
  type = list(string)
  default = [
    "Managed Identity Operator"
  ]
}

variable "service_principal_id" {
  description = "Service Principal ID of the object which needs the rights to manage the managed identity"
  type = string
}
*/
