# **Resource Modules: VNet Peering**
This TF module creates virtual network peerings between a spoke network and the hub network..



## Example Variables
```javascript
  hub_vnet_name               = module.vnet-hub.vnet_name
  hub_vnet_rg                 = module.vnet-hub.vnet_rg_name
  spoke_vnets_name            = list(module.vnet-spoke.vnet_name)
  spoke_vnets_rg              = list(module.vnet-spoke.vnet_rg_name)
  allow_forwarded_traffic     = true
  hub_allow_gateway_transit   = true
  hub_use_remote_gateways     = false
  spoke_allow_gateway_transit = true
  spoke_use_remote_gateways   = false
```

