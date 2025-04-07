# Output: AKS kubeconfig (needed to connect)
output "kube_config" {
  description = "Kubeconfig file to authenticate with the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive   = true
}

# Output: ACR login server
output "acr_login_server" {
  description = "URL of the Azure Container Registry"
  value       = azurerm_container_registry.acr.login_server
}

# Output: Cluster Name
output "aks_cluster_name" {
  description = "AKS Cluster Name"
  value       = azurerm_kubernetes_cluster.aks.name
}

# Output: Resource Group Name
output "resource_group_name" {
  description = "Name of the Resource Group used"
  value       = azurerm_resource_group.main.name
}

# Output: Node Resource Group (auto-created by Azure)
output "aks_node_resource_group" {
  description = "Resource group used internally for AKS node resources"
  value       = azurerm_kubernetes_cluster.aks.node_resource_group
}