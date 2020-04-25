resource "random_string" "random" {
  length  = 4
  special = false
  upper   = false
}

locals {
  name = "${var.name}-${random_string.random.result}-wk"

  fixed_tags = {
    id        = random_string.random.result
    terraform = "true"
  }

  tags = merge(var.tags, local.fixed_tags)
}

resource "azurerm_log_analytics_workspace" "main" {
  name                = local.name
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  sku                 = var.sku
  retention_in_days   = var.retention_period
}

resource "azurerm_log_analytics_solution" "main" {
  solution_name         = "ContainerInsights"
  location              = var.resource_group.location
  resource_group_name   = var.resource_group.name
  workspace_resource_id = azurerm_log_analytics_workspace.main.id
  workspace_name        = azurerm_log_analytics_workspace.main.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}
