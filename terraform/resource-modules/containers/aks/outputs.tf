output "aks" {
  value       = azurerm_kubernetes_cluster.aks
  description = "Created cluster"
}

output "key_k8s_nodes" {
  description = "The key used to ssh the kubernetes nodes"
  value       = tls_private_key.k8s_key
}