output "nic_id"{
    value = aws_network_interface.net_int.id
}

output "private_ip" {
    value = aws_network_interface.net_int.private_ip
}

output "id" {
    value = aws_instance.ec2_instance.id
}