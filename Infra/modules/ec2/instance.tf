resource "aws_instance" "ec2_instance"{
    ami = var.ami
    instance_type = var.instance_type

    network_interface {
        network_interface_id = aws_network_interface.net_int.id
        device_index = 0 
    }
    
    tags = {
        "Name" = var.tag
    }
}

resource "aws_network_interface" "net_int" {
    subnet_id = var.subnet
    private_ips = var.private_ips
    tags = {
        "Name" = var.tag
    }
}