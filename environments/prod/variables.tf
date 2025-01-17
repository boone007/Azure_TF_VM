variable "tenant_name" {
  default     = "tfProd"
  description = "Name of the tenant"
}

variable "my_subnet_name" {
  type        = string
  default     = "my-example-subnet"
  description = "Name of the subnet"
}

variable "resource_group_location" {
  default     = "eastus"
  description = "Location of the resource group."
}

#--------------------------------------
# Windows Server Varibles
#--------------------------------------

variable "virtual_machine_name_winprod" {
  type        = string
  default     = "WinProdServ"
  description = "Name of the Virtual Machine"
}

variable "virtual_machine_password_winprod" {
  type        = string
  default     = "Mavim2bad!"
  description = "Password of the Virtual Machine"
}

variable "win_virtual_machine_size" {
  type        = string
  default     = "Standard_B1s"
  description = "Size of the Virtual Machine"
}

variable "source_image_offer_winprod" {
  type        = string
  default     = "WindowsServer"
  description = "Size of the Virtual Machine"
}

variable "source_image_sku_winprod" {
  type        = string
  default     = "2022-datacenter-azure-edition"
  description = "Size of the Virtual Machine"
}



variable "network_interface_name_winprod" {
  type        = string
  default     = "nic-winprod"
  description = "Name of the NIC"
}


variable "public_ip_address_name_winprod" {
  type        = string
  default     = "pub-ip-winprod"
  description = "Name of the public ip address"
}

#--------------------------------------
# Linux Server Varibles
#--------------------------------------

variable "virtual_machine_name_linprod" {
  type        = string
  default     = "LinProdServ"
  description = "Name of the Virtual Machine"
}

variable "virtual_machine_password_linprod" {
  type        = string
  default     = "Mavim2bad!"
  description = "Password of the Virtual Machine"
}

variable "lin_virtual_machine_size" {
  type        = string
  default     = "Standard_F2"
  description = "Size of the Virtual Machine"
}

variable "source_image_offer_linprod" {
  type        = string
  default     = "0001-com-ubuntu-server-jammy"
  description = "Size of the Virtual Machine"
}

variable "source_image_sku_linprod" {
  type        = string
  default     = "22_04-lts"
  description = "Size of the Virtual Machine"
}



variable "network_interface_name_linprod" {
  type        = string
  default     = "nic-linprod"
  description = "Name of the NIC"
}


variable "public_ip_address_name_linprod" {
  type        = string
  default     = "pub-ip-linprod"
  description = "Name of the public ip address"
}
