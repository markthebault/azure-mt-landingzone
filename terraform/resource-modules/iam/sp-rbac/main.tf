##################### Variables
variable "name" {
  type        = string
  description = "Name of the application service principal that will be created"
}
variable "app_role_assignment_required" {
  default     = false
  description = "If users need to be assined to the SP to be able to use it"
}
variable "available_in_other_tenants" {
  default     = false
  description = "If the services principal can be available in a different tenant"
}

##################### Resources
resource "random_uuid" "secret" {}

resource "azuread_application" "main" {
  name                       = var.name
  homepage                   = "http://${var.name}"
  identifier_uris            = ["http://${var.name}"]
  reply_urls                 = ["http://${var.name}"]
  available_to_other_tenants = var.available_in_other_tenants
  oauth2_allow_implicit_flow = true
}

resource "azuread_service_principal" "main" {
  application_id               = azuread_application.main.application_id
  app_role_assignment_required = var.app_role_assignment_required

  tags = var.tags
}

resource "azuread_service_principal_password" "main" {
  service_principal_id = azuread_service_principal.main.id
  value                = random_uuid.secret.result
  end_date_relative = "8760h" #one year
}


##################### Outputs
output "app" {
  value       = azuread_application.main
  description = "Application created for the service principal"
}