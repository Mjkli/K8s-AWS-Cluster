module "ansible-server" {
    source = "../module/ec2"
    ami = var.ansible_ami
    instance_type = var.ansible_instance_type
    subnet = module.subnet-1.id
    private_ips = var.ansible_ip

}