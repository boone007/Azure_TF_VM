resource "azurerm_resource_group" "rg" {
  name     = "${var.tenant_name}-rg"
  location = var.resource_group_location
}

module "network" {
  source = "../../modules/network"

  tenant_name             = var.tenant_name
  subnet_name             = var.my_subnet_name
  resource_group_location = var.resource_group_location
  resource_group_name     = azurerm_resource_group.rg.name
}

module "WindowsDevServer" {
  source = "../../modules/vm-windows"

  win_virtual_machine_name     = var.virtual_machine_name_windev
  win_virtual_machine_password = var.virtual_machine_password_windev
  win_virtual_machine_size     = var.win_virtual_machine_size
  location                     = var.resource_group_location
  resource_group_name          = azurerm_resource_group.rg.name
  azurerm_subnet_id            = module.network.azurerm_subnet_id
  source_image_offer           = var.source_image_offer_windev
  source_image_sku             = var.source_image_sku_windev
  network_interface_name       = var.network_interface_name_windev
  public_ip_address_name       = var.public_ip_address_name_windev
}

module "LinuxDevServer" {
  source = "../../modules/vm-linux"

  lin_virtual_machine_name     = var.virtual_machine_name_lindev
  lin_virtual_machine_password = var.virtual_machine_password_lindev
  lin_virtual_machine_size     = var.lin_virtual_machine_size
  location                     = var.resource_group_location
  resource_group_name          = azurerm_resource_group.rg.name
  azurerm_subnet_id            = module.network.azurerm_subnet_id
  source_image_offer           = var.source_image_offer_lindev
  source_image_sku             = var.source_image_sku_lindev
  network_interface_name       = var.network_interface_name_lindev
  public_ip_address_name       = var.public_ip_address_name_lindev
}
