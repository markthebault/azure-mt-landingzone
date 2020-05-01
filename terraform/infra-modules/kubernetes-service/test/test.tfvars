rg_name = "spk-rg"
region  = "westeurope"
k8s_prefix = "k8s"
acr_name = "defaultmthacr"
subnet_id = "/subscriptions/eecb1c38-f485-488a-ae6d-041ca1eef750/resourceGroups/mth-static-stuff/providers/Microsoft.Network/virtualNetworks/default-vnet/subnets/public"
k8s_rbac_aad_enabled = true
k8s_rbac_aad_prefix = "aks-sp"

aks_masters_rbac_roles = [
  {
    scope_id = "/subscriptions/eecb1c38-f485-488a-ae6d-041ca1eef750",
    role_definition = "Contributor"
  }
]

aks_kubelets_rbac_roles = [
  {
    scope_id = "/subscriptions/eecb1c38-f485-488a-ae6d-041ca1eef750",
    role_definition = "Contributor"
  }
]

log_analytics_workspace_id = "/subscriptions/eecb1c38-f485-488a-ae6d-041ca1eef750/resourcegroups/mth-static-stuff/providers/microsoft.operationalinsights/workspaces/mth-default-log"

tags = {
  test = true
}