output "ansible-public-ip" {
  value       = module.ansible_eip.public_dns
  sensitive   = true
}

output "tls_key" {
  value = module.ansible_key.private_key
  sensitive = true
}

output "rds_public_dns" {
  value = module.ipam_db.public_dns
}

output "ipam_ecr" {
  value = module.ipam_ecr.url
}
