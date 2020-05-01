

module "resource_group" {
  source = "../../resource-modules/resource-group"
  name   = var.rg_name
  region = var.region

  tags = var.tags
}

locals {
  create_sps = var.k8s_rbac_aad_enabled && (var.k8s_rbac_cli_app_id == null)
}
module "sp_aad" {
  source      = "../../resource-modules/iam/sps-for-aks"
  enabled = local.create_sps
  name = var.k8s_rbac_aad_prefix

  tags = concat(values(var.tags), keys(var.tags))
}

locals {
  aks_sp_srv_app_id       = local.create_sps ? module.sp_aad.server_sp.application_id : var.k8s_rbac_srv_app_id
  aks_sp_srv_app_secret   = local.create_sps ? module.sp_aad.server_app_secret : var.k8s_rbac_srv_secret
  aks_sp_cli_app_id       = local.create_sps ? module.sp_aad.client_sp.application_id : var.k8s_rbac_cli_app_id
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

  kubernetes_rbac_aad_enabled      = var.k8s_rbac_aad_enabled
  kubernetes_rbac_cli_app_id       = local.aks_sp_cli_app_id
  kubernetes_rbac_srv_app_id       = local.aks_sp_srv_app_id
  kubernetes_rbac_srv_secret       = local.aks_sp_srv_app_secret

  network_profile                  = var.network_profile

  log_analytics_workspace_resource_id = var.log_analytics_workspace_id
}

module "k8s_master_roles" {
  source      = "../../resource-modules/iam/resources_role_assignment"
  principal_id = module.aks.aks_masters_identity
  roles = var.aks_masters_rbac_roles
}

module "k8s_kubelet_roles" {
  source      = "../../resource-modules/iam/resources_role_assignment"
  principal_id = module.aks.aks_kubelets_identity
  roles = var.aks_kubelets_rbac_roles
}


module "container_registry" {
  source                     = "../../resource-modules/containers/container-registry"
  name                       = var.acr_name
  resource_group             = module.resource_group.resource_group

  log_analytics_workspace_id = var.log_analytics_workspace_id
}

resource "local_file" "kubectl_admin" {
  content  = module.aks.aks.kube_admin_config_raw
  filename = var.admin_kubeconfig_file_path
}


resource "local_file" "kubectl_user" {
  content  = module.aks.aks.kube_config_raw
  filename = var.user_kubeconfig_file_path
}

