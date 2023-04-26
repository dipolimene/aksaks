resource "azurerm_public_ip" "pip" {
  name                = "${local.prefix}-pip"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  allocation_method   = "Static"
  sku                 = "Standard"

}