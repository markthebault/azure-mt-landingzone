variable "rg_name" {
  description = "Name of the Resource Group"
  type        = string
}
variable "region" {
  description = "Geographic region resource will be deployed into"
  type        = string
}

variable "k8s_prefix" {
  description = "prefix of the kubernetes cluster"
  type        = string
}

variable "acr_name" {
  description = "Name of the container registry"
  type        = string
}

variable "kubernetes_version" {
  default     = "1.16.7"
  description = "Version of kubernetes used with aks"
}

variable "subnet_id" {
  type        = string
  description = "The subnet identifier AKS should join to"
}

variable "default_node_pool_nodes_taints" {
  default     = null
  description = "Node taint that will be applied to the nodes taints"
}

variable "default_node_pool_disk_size" {
  default     = 100
  description = "Size of the disk for the default nodepool"
}

variable "default_node_pool_nodes_max_pods" {
  default     = null
  description = "Max pods per node (one pod request 1 ip when azure network selected)"
}

variable "default_nodepool_node_size" {
  default = "Standard_DS1_v2"
  description = "Node size in default node pool for AKS, need to support Premium disk otherwize that causes issues in AKS"
}

variable "default_nodepool_nodes_max" {
  type        = number
  description = "The max number of nodes in default node pool for AKS"
  default     = 30
}

variable "default_nodepool_node_count" {
  default  = 3
  description = "The number of nodes in default node pool for AKS"
}

variable "default_nodepool_auto_scaling" {
  default     = true
  description = "Enable autoscaling of the default nodepool"
}

variable "network_profile" {
  default = {
    network_plugin     = "kubenet"
    dns_service_ip     = "192.168.1.10"
    docker_bridge_cidr = "192.168.32.10/20"
    service_cidr       = "192.168.0.0/20"
    pod_cidr           = "192.168.16.0/20"
    load_balancer_sku  = "standard"
  }
  description = "Network profile that will be used with AKS"
}

variable "k8s_rbac_aad_enabled" {
  type        = bool
  default     = true
  description = "Enable AKS to talk to AAD for user rbac autentication"
}

variable "k8s_rbac_aad_prefix" {
  type        = string
  default     = ""
  description = "If the module will create AAD SPs for AKS, the entered prefix a will be applied"
}
variable "k8s_rbac_cli_app_id" {
  type        = string
  description = "The Client ID of an Azure Active Directory Application for AKS RBAC"
  default = null
}

variable "k8s_rbac_srv_app_id" {
  type        = string
  description = "The Server ID of an Azure Active Directory Application for AKS RBAC"
  default = null

}

variable "k8s_rbac_srv_secret" {
  type        = string
  description = "The Server Secret of an Azure Active Directory Application for AKS RBAC"
  default = null

}

variable "admin_kubeconfig_file_path" {
  type        = string
  default     = "/tmp/kube-admin.conf"
  description = "Ouput file of the Admin Kubeconfig"
}

variable "user_kubeconfig_file_path" {
  type        = string
  default     = "/tmp/kube-user.conf"
  description = "Ouput file of the user Kubeconfig, when AAD integration enabled, you need to have your user attachaed to a kubernetes role"
}

variable "aks_masters_rbac_roles" {
  type        = list(map(string))
  default     = []
  description = "RBAC permissions assigned to the k8s masters"
}

variable "aks_kubelets_rbac_roles" {
  type        = list(map(string))
  default     = []
  description = "RBAC permissions assigned to the k8s kubelets"
}

variable "log_analytics_workspace_id" {
  description = "Log analytic workspace ID"
}

variable "tags" {
  description = "Tags to be added to resources"
  default = {}
}
