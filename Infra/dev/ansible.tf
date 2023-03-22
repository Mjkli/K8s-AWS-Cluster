module "ansible-server" {
    source = "../modules/ec2"
    ami = var.ansible_ami
    instance_type = var.ansible_instance_type
    subnet = module.subnet-1.id
    private_ip = var.ansible_ip
    project = var.project
    env = var.env
    name = "ansible-${var.project}-${var.env}"

}

module "ansible-eip" {
    source = "../modules/network/eip"
    private_ip = var.ansible_ip
    network_interface = module.ansible-server.nic_id
}