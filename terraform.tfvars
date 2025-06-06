resource_group_name         = "jenkins-rg"
location                    = "centralindia"
virtual_network_name        = "jenkins-vnet"
subnet_name                 = "jenkins-subnet"
vnet_address_space          = ["10.0.0.0/16"]
subnet_address_prefixes     = ["10.0.1.0/24"]
network_security_group_name = "jenkins-nsg"
virtal_machine_name         = "jenkins-vm"
vm_size                     = "Standard_D2s_v3"
admin_username              = "azureuser"
public_ip_name              = "jenkins-public-ip"
allocation_method           = "Dynamic"
nic_name                    = "jenkins-nic"
ssh_public_key_path         = "~/.ssh/id_rsa.pub"

