output "aks" {
  value       = azurerm_kubernetes_cluster.aks
  description = "Created cluster"
}

output "aks_kubelets_identity" {
  value       = azurerm_kubernetes_cluster.aks.kubelet_identity.0.object_id
  description = "The system assigned identity to kubelets created when aks is created"
}

output "aks_masters_identity" {
  value       = azurerm_kubernetes_cluster.aks.identity.0.principal_id
  description = "The system assigned identity to masters created when aks is created"
}

output "key_k8s_nodes" {
  description = "The key used to ssh the kubernetes nodes"
  value       = tls_private_key.k8s_key
}