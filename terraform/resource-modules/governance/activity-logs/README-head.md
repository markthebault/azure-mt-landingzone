# aks - Azure K8s Module

The module deploys AKS into the provided VNET, the cluster will be deployed with RBAC and AAD integration

## Example

```javascript
  resource_group_name   = "activity-rg"
  sa_name               = "activitysa"
  location              = "westeurpe"
  logs_retention        = var.retention

  tags = var.tags
}
```

