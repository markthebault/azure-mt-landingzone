
variable solution_plan_map {
  type        = map
  description = "List of solutions deployed"

  default = {
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

variable resource_group {
  description = "Resource group resource where the solution will be applied"
}

variable log_analytics_workspace {
  description = "Log analytic workspace resource linked to the solution"
}




locals {
  solution_list = keys(var.solution_plan_map)
}

resource "azurerm_log_analytics_solution" "sol" {
  count                 = length(local.solution_list)

  solution_name         = element(local.solution_list, count.index)
  location              = var.resource_group.location
  resource_group_name   = var.resource_group.name
  workspace_resource_id = var.log_analytics_workspace.id
  workspace_name        = var.log_analytics_workspace.name

  plan {
      product        = var.solution_plan_map[element(local.solution_list, count.index)].product
      publisher      = var.solution_plan_map[element(local.solution_list, count.index)].publisher
    }
}

output la_solution {
  value       = azurerm_log_analytics_solution.sol
  description = "The create log analytic solution"
}
