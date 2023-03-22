output ansible-public-ip {
  value       = module.ansible.public_ip
  sensitive   = false
}
