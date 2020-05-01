module "resource_group" {
  source = "../../resource-modules/resource-group"
  name   = var.rg_name
  region = var.region

  tags = var.tags
}



module "aks" {
  source      = "../../resource-modules/containers/aks"

  prefix                           = var.k8s_prefix
  resource_group                   = module.resource_group.resource_group
  kubernetes_version               = var.kubernetes_version
  subnet_id                        = var.subnet_id

  default_nodepool_node_count      = var.default_nodepool_node_count
  default_nodepool_nodes_max       = var.default_nodepool_nodes_max
  default_nodepool_node_size       = var.default_nodepool_node_size
  default_node_pool_nodes_max_pods = var.default_node_pool_nodes_max_pods
  default_node_pool_nodes_taints   = var.default_node_pool_nodes_taints
  default_node_pool_disk_size      = var.default_node_pool_disk_size
  enable_auto_scaling              = var.default_nodepool_auto_scaling

  kubernetes_rbac_enabled          = var.k8s_rbac_enabled
  kubernetes_rbac_cli_app_id       = var.k8s_rbac_cli_app_id
  kubernetes_rbac_srv_app_id       = var.k8s_rbac_srv_app_id
  kubernetes_rbac_srv_secret       = var.k8s_rbac_srv_secret

  network_profile                  = var.network_profile

  log_analytics_workspace_resource_id = var.log_analytics_workspace_id
}


module "container_registry" {
  source                     = "../../resource-modules/containers/container-registry"
  name                       = var.acr_name
  resource_group             = module.resource_group.resource_group

  log_analytics_workspace_id = var.log_analytics_workspace_id
}
