resource "random_id" "randomId" {
  keepers = {
    # Generate a new ID only when a new resource group is defined
    resource_group = var.resource_group.name
  }

  byte_length = 10
}

locals {
  aks_name = "${var.prefix}-aks"

  fixed_tags = {
    id        = random_id.randomId.hex
    terraform = "true"
  }

  tags = merge(var.tags, local.fixed_tags)
}

resource "tls_private_key" "k8s_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}


# Deploys AKS
resource "azurerm_kubernetes_cluster" "aks" {
  name                       = local.aks_name
  location                   = var.resource_group.location
  resource_group_name        = var.resource_group.name
  dns_prefix                 = local.aks_name
  enable_pod_security_policy = true

  linux_profile {
    admin_username = var.aks_admin_username

    ssh_key {
      key_data = tls_private_key.k8s_key.public_key_openssh
    }
  }

  default_node_pool {
    name                = var.default_node_pool_name
    enable_auto_scaling = var.enable_auto_scaling
    node_count          = var.default_nodepool_node_count
    min_count           = var.enable_auto_scaling ? var.default_nodepool_node_count : null
    max_count           = var.enable_auto_scaling ? var.default_nodepool_nodes_max : null
    vm_size             = var.default_nodepool_node_size
    os_disk_size_gb     = var.default_node_pool_disk_size
    type                = "VirtualMachineScaleSets"
    vnet_subnet_id      = var.subnet_id
    node_taints         = var.default_node_pool_nodes_taints
    max_pods            = var.default_node_pool_nodes_max_pods
  }

  identity {
    type = "SystemAssigned"
  }

  addon_profile {
    oms_agent {
      enabled                    = true
      log_analytics_workspace_id = var.log_analytics_workspace_resource_id
    }

    kube_dashboard {
      enabled = false
    }
  }




  dynamic "network_profile" {
    for_each = lookup(var.network_profile, "network_plugin", null) == "azure" ? [1] : []
    content {
      network_plugin    = lookup(var.network_profile, "network_plugin", null)
      network_policy    = lookup(var.network_profile, "network_policy", null)
      load_balancer_sku = lookup(var.network_profile, "load_balancer_sku", null)
    }
  }
  dynamic "network_profile" {
    for_each = lookup(var.network_profile, "network_plugin", null) == "kubenet" ? [1] : []
    content {
      network_plugin     = lookup(var.network_profile, "network_plugin", null)
      network_policy     = lookup(var.network_profile, "network_policy", null)
      dns_service_ip     = lookup(var.network_profile, "dns_service_ip", null)
      docker_bridge_cidr = lookup(var.network_profile, "docker_bridge_cidr", null)
      service_cidr       = lookup(var.network_profile, "service_cidr", null)
      pod_cidr           = lookup(var.network_profile, "pod_cidr", null)
      load_balancer_sku  = lookup(var.network_profile, "load_balancer_sku", null)
    }
  }



  kubernetes_version = var.kubernetes_version

  role_based_access_control {
    enabled = var.kubernetes_rbac_enabled

    dynamic "azure_active_directory" {
      for_each = (var.kubernetes_rbac_aad_enabled) ? [var.kubernetes_rbac_cli_app_id] : []
      content {
        client_app_id     = var.kubernetes_rbac_cli_app_id
        server_app_id     = var.kubernetes_rbac_srv_app_id
        server_app_secret = var.kubernetes_rbac_srv_secret
      }
    }
  }

  // This is needed even though we do not have windows nodes. Else TF will recreate the whole cluster
  // if set to kubnet, having a windows profile will make the cluster failing
  dynamic "windows_profile" {
    for_each = lookup(var.network_profile, "network_plugin", null) == "azure" ? [1] : []
    content {
      admin_username = "azureuser"
      admin_password = "ThisIs4w3s0m3!"
    }
  }


  tags = local.tags



  lifecycle {
    ignore_changes = [
      default_node_pool.0.node_count,
      default_node_pool.0.min_count,
      default_node_pool.0.max_count
    ]
  }

}



resource "azurerm_monitor_diagnostic_setting" "diagnostics" {
  name               = azurerm_kubernetes_cluster.aks.name
  target_resource_id = azurerm_kubernetes_cluster.aks.id

  log_analytics_workspace_id = var.log_analytics_workspace_resource_id

  dynamic "log" {
    for_each = var.logs
    content {
      category = log.value
      enabled  = true

      retention_policy {
        enabled = false
        days    = 7
      }
    }
  }

  metric {
    category = lookup(var.metric, "category", null)
    enabled  = lookup(var.metric, "enabled", false)

    retention_policy {
      enabled = false
      days    = 7
    }
  }
}
