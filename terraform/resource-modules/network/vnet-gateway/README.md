# **Resource Modules: Virtual Network Gateway**

## Description

This TF module can be used to create a Virtual Network Gateway that has an associated public Ip address and takes in a certificate for configuring a Point-to-Site connection.

## Example Variables
```javascript

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
| resource\_group | Resource Group that vNet Gateway will deploy into, must be same as the vNet's resource gorup | `any` | n/a | yes |
| vnet\_name | Name of the Vnet | `any` | n/a | yes |
| region | Geographic region resource will be deployed into | `any` | n/a | yes |
| gwip\_name | Name of the Gateway Public IP | `any` | n/a | yes |
| gw\_name | Name of the Gateway | `any` | n/a | yes |
| gateway\_subnet | The GateWay subnet id that the VPN gateway will use | `string` | `""` | no |
| ip\_allocation | Allocation method for Public IP Address; Can beStatic or Dynamic | `string` | `"Dynamic"` | no |
| gateway\_type | Virtual Network Gateway Type; Can be VPN or ExpressRoute | `string` | `"VPN"` | no |
| vpn\_type | The routing type of the Virtual Network Gateway; Can be RouteBased or PolicyBased. | `string` | `"RouteBased"` | no |
| sku | Configuration of the size and capacity of the virtual network gateway; Can be are Basic, Standard, HighPerformance, UltraPerformance, ErGw1AZ, ErGw2AZ, ErGw3AZ, VpnGw1, VpnGw2, VpnGw3, VpnGw1AZ, VpnGw2AZ, and VpnGw3AZ and depend on the type and vpn\_type arguments. A PolicyBased gateway only supports the Basic sku. Further, the UltraPerformance sku is only supported by an ExpressRoute gateway. | `string` | `"VpnGw1"` | no |
| client\_address\_spaces | The address space out of which ip addresses for vpn clients will be taken. You can provide more than one address space, e.g. in CIDR notation | `list` | n/a | yes |
| vpn\_client\_protocols | List of the protocols supported by the vpn client. The supported values are SSTP, IkeV2 and OpenVPN. | `list` | n/a | yes |
| certificate\_data | Certificate Information generated from Key Vault that the vNet gateway will use for the P2S connections | `string` | `""` | no |
| tags | Tags to be added to resource | `map` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| vnet\_gateway\_id | Virtual network gateway resource |

