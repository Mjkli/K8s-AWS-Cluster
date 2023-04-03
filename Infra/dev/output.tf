output "ansible-public-ip" {
  value       = module.ansible-eip.public_ip
  sensitive   = true
}

output "tls_key" {
  value = module.ansible_key.private_key
  sensitive = true
}
