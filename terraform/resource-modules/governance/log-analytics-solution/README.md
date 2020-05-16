# Log Analytic solution
Create a log solution



## Example

```javascript
  resource_group = module.main_rg
  log_analytics_workspace = module.log_wk.log_analytics_workspace

  solution_plan_map = {
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
```

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| solution\_plan\_map | List of solutions deployed | `map` | <pre>{<br>  "ADAssessment": {<br>    "product": "OMSGallery/ADAssessment",<br>    "publisher": "Microsoft"<br>  },<br>  "ADReplication": {<br>    "product": "OMSGallery/ADReplication",<br>    "publisher": "Microsoft"<br>  },<br>  "AgentHealthAssessment": {<br>    "product": "OMSGallery/AgentHealthAssessment",<br>    "publisher": "Microsoft"<br>  },<br>  "ContainerInsights": {<br>    "product": "OMSGallery/ContainerInsights",<br>    "publisher": "Microsoft"<br>  },<br>  "DnsAnalytics": {<br>    "product": "OMSGallery/DnsAnalytics",<br>    "publisher": "Microsoft"<br>  },<br>  "KeyVaultAnalytics": {<br>    "product": "OMSGallery/KeyVaultAnalytics",<br>    "publisher": "Microsoft"<br>  },<br>  "NetworkMonitoring": {<br>    "product": "OMSGallery/NetworkMonitoring",<br>    "publisher": "Microsoft"<br>  }<br>}</pre> | no |
| resource\_group | Resource group resource where the solution will be applied | `any` | n/a | yes |
| log\_analytics\_workspace | Log analytic workspace resource linked to the solution | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| la\_solution | The create log analytic solution |

