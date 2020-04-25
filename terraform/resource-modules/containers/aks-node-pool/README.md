# aks-node-pool

Attached a Node Pool to an existing Kubernetes Cluster

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | Name of the node pool (max of 6 characters) | `string` | n/a | yes |
| aks\_cluster\_id | The aks cluster id where the node pool join to | `string` | n/a | yes |
| vm\_size | VM size in node pool for AKS | `string` | n/a | yes |
| node\_count | The number of nodes in node pool for AKS | `number` | n/a | yes |
| node\_taints | A map of taints for the nodes | `list(string)` | `[]` | no |
| enable\_auto\_scaling | Enable autoscaling in this node pool | `bool` | `false` | no |
| max\_pods\_per\_node | Maximal number of pods per node | `number` | `30` | no |
| os\_disk\_size\_gb | Disk size of the nodepool | `number` | `100` | no |

## Outputs

No output.

