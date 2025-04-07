# ------------------------------
# Resource Group
# ------------------------------
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

# ------------------------------
# Azure Container Registry (ACR)
# ------------------------------
resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  sku                 = "Basic"
  admin_enabled       = true # For simple testing
}

# ------------------------------
# AKS Cluster
# ------------------------------
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  dns_prefix          = "simple-aks"

  # Default node pool definition
  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = var.node_vm_size
  }

  # Enables system-assigned managed identity
  identity {
    type = "SystemAssigned"
  }
}

# ------------------------------
# Allow AKS to pull images from ACR
# ------------------------------
resource "azurerm_role_assignment" "aks_acr_pull" {
  scope                = azurerm_container_registry.acr.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}