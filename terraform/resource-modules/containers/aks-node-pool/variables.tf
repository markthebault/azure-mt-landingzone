variable "name" {
  type        = string
  description = "Name of the node pool (max of 6 characters)"
}

variable "aks_cluster_id" {
  type        = string
  description = "The aks cluster id where the node pool join to"
}

variable "vm_size" {
  type        = string
  description = "VM size in node pool for AKS"
}

variable "node_count" {
  type        = number
  description = "The number of nodes in node pool for AKS"
}

variable "node_taints" {
  type        = list(string)
  description = "A map of taints for the nodes"
  default     = []
}

variable "enable_auto_scaling" {
  type        = bool
  description = "Enable autoscaling in this node pool"
  default     = false
}

variable "max_pods_per_node" {
  type        = number
  description = "Maximal number of pods per node"
  default     = 30
}

variable "os_disk_size_gb" {
  description = "Disk size of the nodepool"
  default = 100
}