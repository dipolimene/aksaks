resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${local.prefix}-aks"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  dns_prefix          = "${local.prefix}-aks"

  default_node_pool {
    name                = "default"
    node_count          = 2
    vm_size             = "Standard_D2_v2"
    type                = "VirtualMachineScaleSets"
    zones               = ["1", "2"]
    enable_auto_scaling = true
    min_count           = 2
    max_count           = 4
    vnet_subnet_id      = azurerm_subnet.subnet_aks.id
  }

  identity {
    type = "SystemAssigned"
  }

  oms_agent {
    log_analytics_workspace_id = azurerm_log_analytics_workspace.oms.id
  }

  http_application_routing_enabled = false

  network_profile {
    network_plugin = "azure"
    dns_service_ip = var.aks_dns_service_ip
    service_cidr   = var.aks_service_cidr
  }

  depends_on = [azurerm_virtual_network.vnet, azurerm_application_gateway.agw]
}