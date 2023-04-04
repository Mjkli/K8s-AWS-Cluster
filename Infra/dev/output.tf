output "ansible-public-ip" {
  value       = module.ansible_eip.public_dns
  sensitive   = true
}

output "tls_key" {
  value = module.ansible_key.private_key
  sensitive = true
}
