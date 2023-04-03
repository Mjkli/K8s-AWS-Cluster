output "nic_id"{
    value = aws_network_interface.net_int.id
}

output "public_dns" {
    value = aws_eip.elastic-ip.public_dns
}