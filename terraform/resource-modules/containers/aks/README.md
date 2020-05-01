# aks - Azure K8s Module

The module deploys AKS into the provided VNET, the cluster will be deployed with RBAC and AAD integration

## Example

```javascript
  resource_grou = azurerm_resource_group.main
  prefix = "aks-awesome"
  aks_subnet_id = module.subnet.id

  kubernetes_rbac_cli_app_id = module.akscli.principal_id
  kubernetes_rbac_srv_app_id = module.akssrv.principal_id
  kubernetes_rbac_srv_secret = module.akssrv.secret

  tags = var.tags
}
```

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| random | n/a |
| tls | n/a |
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| wait\_for\_it | trick to do depends\_on on mudules, currently not supported by terraform | `list` | `[]` | no |
| resource\_group | Resource group where AKS will be created | `any` | n/a | yes |
| prefix | A prefix used for all resources in this module | `string` | n/a | yes |
| subnet\_id | The subnet identifier AKS should join to | `string` | n/a | yes |
| enable\_auto\_scaling | Enable autoscaling of the default nodepool | `bool` | `false` | no |
| default\_node\_pool\_name | Name of the default nodepoll | `string` | `"default"` | no |
| default\_node\_pool\_disk\_size | Size of the disk for the default nodepool | `number` | `100` | no |
| default\_node\_pool\_nodes\_taints | Node taint that will be applied to the nodes taints | `any` | `null` | no |
| default\_node\_pool\_nodes\_max\_pods | Max pods per node (one pod request 1 ip) | `any` | `null` | no |
| default\_nodepool\_node\_count | The number of nodes in default node pool for AKS | `number` | `3` | no |
| default\_nodepool\_nodes\_max | The max number of nodes in default node pool for AKS | `number` | `30` | no |
| default\_nodepool\_node\_size | Node size in default node pool for AKS | `string` | n/a | yes |
| tags | A map of tags to set on every taggable resources. Default tag for resource identification are applied by default. | `map` | `{}` | no |
| network\_profile | Network profile that will be used with AKS | `map` | <pre>{<br>  "dns_service_ip": "192.168.1.10",<br>  "docker_bridge_cidr": "192.168.32.10/20",<br>  "load_balancer_sku": "standard",<br>  "network_plugin": "kubenet",<br>  "pod_cidr": "192.168.16.0/20",<br>  "service_cidr": "192.168.0.0/20"<br>}</pre> | no |
| kubernetes\_version | Version of kubernetes used with aks | `string` | `"1.16.7"` | no |
| aks\_admin\_username | User profile name to ssh the workers | `string` | `"k8s"` | no |
| kubernetes\_rbac\_enabled | Is Role Based Access Control for AKS Enabled? | `bool` | `true` | no |
| kubernetes\_rbac\_aad\_enabled | Is AKS Role Based Access Control integration with AAD Enabled? | `bool` | `true` | no |
| kubernetes\_rbac\_cli\_app\_id | The Client ID of an Azure Active Directory Application for AKS RBAC | `string` | n/a | yes |
| kubernetes\_rbac\_srv\_app\_id | The Server ID of an Azure Active Directory Application for AKS RBAC | `string` | n/a | yes |
| kubernetes\_rbac\_srv\_secret | The Server Secret of an Azure Active Directory Application for AKS RBAC | `string` | n/a | yes |
| log\_analytics\_workspace\_resource\_id | Resource id of the log analytics workspace | `string` | n/a | yes |
| logs | List of log categories to log. | `list(string)` | <pre>[<br>  "kube-apiserver",<br>  "kube-audit",<br>  "kube-controller-manager",<br>  "kube-scheduler",<br>  "cluster-autoscaler"<br>]</pre> | no |
| metric | Metric definition of the log workspace | `map` | <pre>{<br>  "category": "AllMetrics",<br>  "enabled": true<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| aks | Created cluster |
| aks\_identity | The system assigned identity created when aks is created |
| key\_k8s\_nodes | The key used to ssh the kubernetes nodes |

