# **Resource Modules: Firewall**

## Description

This TF module creates an Azure Firewall, along with the associated subnet, public ip, and firewall rules for spoke access.

## Resources Created

- Firewall
- Firewall Rules Collection
- Subnet
- Public IP

## Example Variables
```javascript

## Common variables
  firewall_name               = "HUB-SPOKE-FIREWALL"
  resource_group              = "NETWORK-HUB-EASTUS-TEST"
  virtual_network             = "NETWORK-HUB-EASTUS-TEST-HUB"
  subnet_address_range        = "10.0.250.0/24"
  firewall_public_ip_name     = "FIREWALL-IP"
  fw_ip_configuration_name    = "FIREWALL-IP-CONFIGURATION"


```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| resource\_group | The resource group where the firewall is added | string | n/a | yes |
| virtual\_network | The virtual network where the firewall subnet is added. The new subnet must be called `"AzureFirewallSubnet"` and is included in the terraform script | string | n/a | yes |
| firewall\_name | The name for the firwall | string | n/a | yes |
| subnet\_address\_range | The address range to use for the Azure Firewall | string | n/a | yes |
| firewall\_public\_ip\_name | Azure Firewall requires a public IP address.  This is the name for the Public IP resource | string | n/a | yes |
| fw\_ip\_configuration\_name| The name for the associated IP configuration block for the firewall | string | n/a | yes |
| ip\_allocation\_method| The public ip allocation method (static or dynamic). The Firewall requires a static allocation. | string | n/a | yes |
| ip\_sku| The public ip sku | string | n/a | yes |
| firewall\_rules\_nrc\_name| An NRC rule name for the firewall | string | n/a | yes |
| firewall\_rules\_nrc\_priority| NRC rule priority for the firewall | number | n/a | yes |
| firewall\_rules\_nrc\_action| NRC rule action for the firewall | string | n/a | yes |
| address\_prefix\_spoke1 | The CIDR address range that will be routed through the firewall for the first spoke | string | n/a | yes |
| address\_prefix\_spoke2 | The CIDR address range that will be routed through the firewall for the second spoke | string | n/a | yes |
| nrc\_rule\_spoke1to2\_name| NRC rule name for Spoke1 to Spoke2 | string | n/a | yes |
| nrc\_rule\_spoke1to2\_dest\_ports| NRC ports to forward for Spoke1 to Spoke2 | string | n/a | yes |
| nrc\_rule\_spoke1to2\_protocols| NRC protocols for Spoke 1 to Spoke 2 | string | n/a | yes |
| nrc\_rule\_spoke2to1\_name| NRC rule name for Spoke2 to Spoke1 | string | n/a | yes |
| nrc\_rule\_spoke2to1\_dest\_ports| NRC ports to forward for Spoke2 to Spoke1 | string | n/a | yes |
| nrc\_rule\_spoke2to1\_protocols| NRC protocols for Spoke 2 to Spoke 1 | string | n/a | yes |
| tags | Map of tags that will be applied to the VNet | map | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| firewall\_private\_ip | The private IP of the Azure Firewall |

