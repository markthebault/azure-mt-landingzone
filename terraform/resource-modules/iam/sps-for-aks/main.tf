data "azurerm_client_config" "current" {
}

locals {
  server_name =  "${var.name}-srv"
  client_name =  "${var.name}-cli"
  app_owners = concat(
        var.app_additional_owners, 
        list(data.azurerm_client_config.current.object_id)
    )

  tags = concat(var.tags, list("iac_aad_objects"))
}

resource "random_uuid" "secret" {}


### Server SP for AKS
resource "azuread_application" "server" {
  count = var.enabled ? 1 : 0

  name                       = local.server_name
  identifier_uris            = ["http://${local.server_name}"]
  available_to_other_tenants = false
  oauth2_allow_implicit_flow = true
  owners = local.app_owners
  
  required_resource_access {
    resource_app_id = "00000003-0000-0000-c000-000000000000"

    resource_access {
      id   = "7ab1d382-f21e-4acd-a863-ba3e13f7da61"
      type = "Role"
    }

    resource_access {
      id   = "e1fe6dd8-ba31-4d61-89e7-88639da4683d"
      type = "Scope"
    }

    resource_access {
      id   = "06da0dbc-49e2-44d2-8312-53f166ab848a"
      type = "Scope"
    }
  }

}

resource "azuread_service_principal" "server" {
  count = var.enabled ? 1 : 0

  application_id               = azuread_application.server.0.application_id
  app_role_assignment_required = false

  tags = local.tags
}

resource "azuread_application_password" "server" {
  count = var.enabled ? 1 : 0

  application_object_id = azuread_application.server.0.id
  value                = random_uuid.secret.result
  end_date_relative = "8760h" #one year
}

### Client SP for AKS
resource "azuread_application" "client" {
  count = var.enabled ? 1 : 0

  name                       = local.client_name
  reply_urls                 = ["http://${local.client_name}"]
  type                       = "native"
  available_to_other_tenants = false
  oauth2_allow_implicit_flow = true
  owners = local.app_owners

  required_resource_access {
    resource_app_id = azuread_service_principal.server.0.application_id

    resource_access {
      id   = azuread_service_principal.server.0.oauth2_permissions.0.id
      type = "Scope"
    }
  }

}

resource "azuread_service_principal" "client" {
  count = var.enabled ? 1 : 0

  application_id               = azuread_application.client.0.application_id
  app_role_assignment_required = false

  tags = local.tags
}

