resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

module "network" {
  source                  = "./modules/network"
  resource_group_name     = azurerm_resource_group.rg.name
  location                = azurerm_resource_group.rg.location
  virtual_network_name    = var.virtual_network_name
  subnet_name             = var.subnet_name
  vnet_address_space      = var.vnet_address_space
  subnet_address_prefixes = var.subnet_address_prefixes
  nsg_id                  = module.nsg.nsg_id
}


module "nsg" {
  source                      = "./modules/nsg"
  resource_group_name         = azurerm_resource_group.rg.name
  location                    = azurerm_resource_group.rg.location
  network_security_group_name = var.network_security_group_name
}

module "vm" {
  source              = "./modules/vm"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  virtal_machine_name = var.virtal_machine_name
  vm_size             = var.vm_size
  admin_username      = var.admin_username
  public_ip_name      = var.public_ip_name
  allocation_method   = var.allocation_method
  nic_name            = var.nic_name
  ssh_public_key_path = var.ssh_public_key_path
  subnet_id           = module.network.subnet_id
}
