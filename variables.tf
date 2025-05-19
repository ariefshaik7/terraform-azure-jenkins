variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "jenkins-resources"
}

variable "location" {
  description = "Azure region to deploy resources"
  type        = string
  default     = "East US"
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "adminuser"
}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "virtual_network_name" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "vnet_address_space" {
  type = list(string)
}

variable "subnet_address_prefixes" {
  type = list(string)
}

variable "network_security_group_name" {
  type = string
}

variable "virtal_machine_name" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "public_ip_name" {
  type = string
}

variable "allocation_method" {
  type = string
}

variable "nic_name" {
  type = string
}

