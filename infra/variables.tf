# Resource Group Name
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "simple-aks-rg"
}

# Region where resources will be deployed
variable "location" {
  description = "The Azure region to deploy resources"
  type        = string
  default     = "eastus"
}

# AKS Cluster Name
variable "aks_cluster_name" {
  description = "Name of the AKS cluster"
  type        = string
  default     = "simple-aks-cluster"
}

# Node Pool Settings
variable "node_count" {
  description = "Number of nodes in the default node pool"
  type        = number
  default     = 1
}

variable "node_vm_size" {
  description = "VM size for AKS nodes"
  type        = string
  default     = "Standard_DS2_v2"
}

# Azure Container Registry Name (must be globally unique)
variable "acr_name" {
  description = "Name of the Azure Container Registry"
  type        = string
  default     = "simpleaksacr12345" # Suggest dynamic later
}