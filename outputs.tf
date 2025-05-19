output "jenkins_url" {
  description = "URL to access Jenkins"
  value       = "http://${module.vm.public_ip}:8080"
}

output "ssh_command" {
  description = "SSH command to connect to the VM"
  value       = "ssh -i ~/.ssh/id_rsa ${var.admin_username}@${module.vm.public_ip}"
}