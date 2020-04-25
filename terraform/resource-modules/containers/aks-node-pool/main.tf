resource "azurerm_kubernetes_cluster_node_pool" "nodepool" {
  name                  = var.name
  kubernetes_cluster_id = var.aks_cluster_id
  vm_size               = var.vm_size
  node_count            = var.node_count
  node_taints           = var.node_taints
  enable_auto_scaling   = var.enable_auto_scaling
  max_pods              = var.max_pods_per_node
  os_disk_size_gb       = var.os_disk_size_gb
}
