locals {

  tags = merge(var.tags, map("module", "security", "version", "0.0.1"))
}

module "resource_group" {
  source = "../../resource-modules/resource-group"
  name   = var.rg_name
  region = var.region

  tags = local.tags
}

module "log_analytics" {
  source           = "../../resource-modules/governance/log-analytics-workspace"
  resource_group   = module.resource_group.resource_group
  retention_period = var.retention_period
  name             = var.log_analytics_name

  tags = local.tags
}


data "azurerm_subscription" "current" {
}

module "security_center" {
  source  = "../../resource-modules/governance/security-center"
  
  enable_security_center  = true
  scope_id                = data.azurerm_subscription.current.id
  workspace_id            = module.log_analytics.azurerm_log_analytics_workspace.id
}

module "activity_logs" {
  source  = "../../resource-modules/governance/activity-logs"

  resource_group_name = module.resource_group.resource_group.name
  location            = var.region
  sa_name             = var.activity_logs_sa_name
  logs_rentention     = 31
  enable_event_hub    = true
  evthub_name         = var.activity_logs_eventhub_name

  tags                = local.tags
}


module "log_solution" {
  source  = "../../resource-modules/governance/log-analytics-solution"

  resource_group          = module.resource_group.resource_group
  log_analytics_workspace = module.log_analytics.azurerm_log_analytics_workspace
  solution_plan_map       = {
        NetworkMonitoring = {
            "publisher" = "Microsoft"
            "product"   = "OMSGallery/NetworkMonitoring"
        },
        ADAssessment = {
            "publisher" = "Microsoft"
            "product"   = "OMSGallery/ADAssessment"
        },
        ADReplication = {
            "publisher" = "Microsoft"
            "product"   = "OMSGallery/ADReplication"
        },
        AgentHealthAssessment = {
            "publisher" = "Microsoft"
            "product"   = "OMSGallery/AgentHealthAssessment"
        },
        DnsAnalytics = {
            "publisher" = "Microsoft"
            "product"   = "OMSGallery/DnsAnalytics"
        },
        ContainerInsights = {
            "publisher" = "Microsoft"
            "product"   = "OMSGallery/ContainerInsights"
        },
        KeyVaultAnalytics = {
            "publisher" = "Microsoft"
            "product"   = "OMSGallery/KeyVaultAnalytics"
        }
    }
}