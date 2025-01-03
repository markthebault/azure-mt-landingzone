variable "wait_for_it" {
  description = "trick to do depends_on on mudules, currently not supported by terraform"
  default = []
}

variable "resource_group"{
  description = "Resource group where AKS will be created"
}

variable "prefix" {
  type        = string
  description = "A prefix used for all resources in this module"
}

variable "subnet_id" {
  type        = string
  description = "The subnet identifier AKS should join to"
}


variable "enable_auto_scaling" {
  default     = false
  description = "Enable autoscaling of the default nodepool"
}

variable "default_node_pool_name" {
  default     = "default"
  description = "Name of the default nodepoll"
}

variable "default_node_pool_disk_size" {
  default     = 100
  description = "Size of the disk for the default nodepool"
}

variable "default_node_pool_nodes_taints" {
  default     = null
  description = "Node taint that will be applied to the nodes taints"
}

variable "default_node_pool_nodes_max_pods" {
  default     = null
  description = "Max pods per node (one pod request 1 ip)"
}


variable "default_nodepool_node_count" {
  default  = 3
  description = "The number of nodes in default node pool for AKS"
}

variable "default_nodepool_nodes_max" {
  type        = number
  description = "The max number of nodes in default node pool for AKS"
  default     = 30
}

variable "default_nodepool_node_size" {
  type        = string
  description = "Node size in default node pool for AKS"
}

variable "tags" {
  description = "A map of tags to set on every taggable resources. Default tag for resource identification are applied by default."
  default     = {}
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

variable "kubernetes_version" {
  default     = "1.16.7"
  description = "Version of kubernetes used with aks"
}

variable "aks_admin_username" {
  default     = "k8s"
  description = "User profile name to ssh the workers"
}


variable "kubernetes_rbac_enabled" {
  type        = bool
  default     = true
  description = "Is Role Based Access Control for AKS Enabled?"
}

variable "kubernetes_rbac_aad_enabled" {
  type        = bool
  default     = true
  description = "Is AKS Role Based Access Control integration with AAD Enabled?"
}


variable "kubernetes_rbac_cli_app_id" {
  type        = string
  description = "The Client ID of an Azure Active Directory Application for AKS RBAC"
}

variable "kubernetes_rbac_srv_app_id" {
  type        = string
  description = "The Server ID of an Azure Active Directory Application for AKS RBAC"
}

variable "kubernetes_rbac_srv_secret" {
  type        = string
  description = "The Server Secret of an Azure Active Directory Application for AKS RBAC"
}

variable "log_analytics_workspace_resource_id" { 
  type = string
  description = "Resource id of the log analytics workspace"
}

variable "logs" {
  description = "List of log categories to log."
  type        = list(string)
  default     = ["kube-apiserver", "kube-audit", "kube-controller-manager", "kube-scheduler", "cluster-autoscaler"]
}

variable "metric" {
  default = {
    category = "AllMetrics"
    enabled  = true
  }

  description = "Metric definition of the log workspace"
}