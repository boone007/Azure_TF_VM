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

module "WindowsProdServer" {
  source = "../../modules/vm-windows"

  win_virtual_machine_name     = var.virtual_machine_name_winprod
  win_virtual_machine_password = var.virtual_machine_password_winprod
  win_virtual_machine_size     = var.win_virtual_machine_size
  location                     = var.resource_group_location
  resource_group_name          = azurerm_resource_group.rg.name
  azurerm_subnet_id            = module.network.azurerm_subnet_id
  source_image_offer           = var.source_image_offer_winprod
  source_image_sku             = var.source_image_sku_winprod
  network_interface_name       = var.network_interface_name_winprod
  public_ip_address_name       = var.public_ip_address_name_winprod
}

module "LinuxProdServer" {
  source = "../../modules/vm-linux"

  lin_virtual_machine_name     = var.virtual_machine_name_linprod
  lin_virtual_machine_password = var.virtual_machine_password_linprod
  lin_virtual_machine_size     = var.lin_virtual_machine_size
  location                     = var.resource_group_location
  resource_group_name          = azurerm_resource_group.rg.name
  azurerm_subnet_id            = module.network.azurerm_subnet_id
  source_image_offer           = var.source_image_offer_linprod
  source_image_sku             = var.source_image_sku_linprod
  network_interface_name       = var.network_interface_name_linprod
  public_ip_address_name       = var.public_ip_address_name_linprod
}
