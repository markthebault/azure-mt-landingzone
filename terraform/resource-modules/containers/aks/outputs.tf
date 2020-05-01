output "aks" {
  value       = azurerm_kubernetes_cluster.aks
  description = "Created cluster"
}

output "aks_identity" {
  value       = azurerm_kubernetes_cluster.aks.kubelet_identity.user_assigned_identity_id
  description = "The system assigned identity created when aks is created"
}

output "key_k8s_nodes" {
  description = "The key used to ssh the kubernetes nodes"
  value       = tls_private_key.k8s_key
}