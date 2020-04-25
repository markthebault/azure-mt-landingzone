# aks - Azure K8s Module

The module deploys AKS into the provided VNET, the cluster will be deployed with RBAC and AAD integration

## Example

```javascript
  resource_grou = azurerm_resource_group.main
  prefix = "aks-awesome"
  aks_subnet_id = module.subnet.id
  kubernetes_client_id = module.sp.principal_id
  kubernetes_client_secret = module.sp.secret

  kubernetes_rbac_cli_app_id = module.akscli.principal_id
  kubernetes_rbac_srv_app_id = module.akssrv.principal_id
  kubernetes_rbac_srv_secret = module.akssrv.secret

  tags = var.tags
}
