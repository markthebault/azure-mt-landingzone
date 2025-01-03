# Log Analytics

This module creates a Resource Group containing a Log Analytics Workspace.

## Resources Created

| Type     | resource module     |
|----------|------------|
| Resource Group | [resource-group](../../resource-modules/resource-group/README.md)|
| Log Analytics Workspace | [governance/log-analytics](../../resource-modules/governance/log-analytics/README.md)|

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| local | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| rg\_name | Name of the Resource Group | `string` | n/a | yes |
| region | Geographic region resource will be deployed into | `string` | n/a | yes |
| k8s\_prefix | prefix of the kubernetes cluster | `string` | n/a | yes |
| acr\_name | Name of the container registry | `string` | n/a | yes |
| kubernetes\_version | Version of kubernetes used with aks | `string` | `"1.16.7"` | no |
| subnet\_id | The subnet identifier AKS should join to | `string` | n/a | yes |
| default\_node\_pool\_nodes\_taints | Node taint that will be applied to the nodes taints | `any` | `null` | no |
| default\_node\_pool\_disk\_size | Size of the disk for the default nodepool | `number` | `100` | no |
| default\_node\_pool\_nodes\_max\_pods | Max pods per node (one pod request 1 ip when azure network selected) | `any` | `null` | no |
| default\_nodepool\_node\_size | Node size in default node pool for AKS, need to support Premium disk otherwize that causes issues in AKS | `string` | `"Standard_DS1_v2"` | no |
| default\_nodepool\_nodes\_max | The max number of nodes in default node pool for AKS | `number` | `30` | no |
| default\_nodepool\_node\_count | The number of nodes in default node pool for AKS | `number` | `3` | no |
| default\_nodepool\_auto\_scaling | Enable autoscaling of the default nodepool | `bool` | `true` | no |
| network\_profile | Network profile that will be used with AKS | `map` | <pre>{<br>  "dns_service_ip": "192.168.1.10",<br>  "docker_bridge_cidr": "192.168.32.10/20",<br>  "load_balancer_sku": "standard",<br>  "network_plugin": "kubenet",<br>  "pod_cidr": "192.168.16.0/20",<br>  "service_cidr": "192.168.0.0/20"<br>}</pre> | no |
| k8s\_rbac\_aad\_enabled | Enable AKS to talk to AAD for user rbac autentication | `bool` | `true` | no |
| k8s\_rbac\_aad\_prefix | If the module will create AAD SPs for AKS, the entered prefix a will be applied | `string` | `""` | no |
| k8s\_rbac\_cli\_app\_id | The Client ID of an Azure Active Directory Application for AKS RBAC | `string` | `null` | no |
| k8s\_rbac\_srv\_app\_id | The Server ID of an Azure Active Directory Application for AKS RBAC | `string` | `null` | no |
| k8s\_rbac\_srv\_secret | The Server Secret of an Azure Active Directory Application for AKS RBAC | `string` | `null` | no |
| admin\_kubeconfig\_file\_path | Ouput file of the Admin Kubeconfig | `string` | `"/tmp/kube-admin.conf"` | no |
| user\_kubeconfig\_file\_path | Ouput file of the user Kubeconfig, when AAD integration enabled, you need to have your user attachaed to a kubernetes role | `string` | `"/tmp/kube-user.conf"` | no |
| aks\_masters\_rbac\_roles | RBAC permissions assigned to the k8s masters | `list(map(string))` | `[]` | no |
| aks\_kubelets\_rbac\_roles | RBAC permissions assigned to the k8s kubelets | `list(map(string))` | `[]` | no |
| log\_analytics\_workspace\_id | Log analytic workspace ID | `any` | n/a | yes |
| tags | Tags to be added to resources | `map` | `{}` | no |

## Outputs

No output.

