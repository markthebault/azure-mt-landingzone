# Azure Policies

Bunch of custom azure policies

## Description of the polcies
### Allowed locations
todo
### Allowed reources type
### Allow create public ips
### Enable azure monitor
### Enable network watcher


## Example

```javascript
  policies_matrix         = var.governance_settings.policy_matrix
  log_analytics           = var.log_analytics.name
  scope                   = data.azurerm_subscription.current.id
}
```

