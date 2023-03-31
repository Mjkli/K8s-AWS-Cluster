module "ansible-server" {
    source = "../modules/ec2/instance_public"
    ami = var.ansible_ami
    instance_type = var.ansible_instance_type
    subnet = module.subnet-1.id
    private_ip = var.ansible_ip
    project = var.project
    env = var.env
    name = "ansible-${var.project}-${var.env}"
    key_name = "${var.project}-${var.env}-${var.key_name}"
    security_groups = [module.ansible_sg.id]

}

# Attaching elastic IP here because it will control what ec2 instances gets a public IP
module "ansible-eip" {
    source = "../modules/network/eip"
    private_ip = var.ansible_ip
    network_interface = module.ansible-server.nic_id
}

module "ansible_key" {
    source = "../modules/ec2/key_pair"
    key_name = "${var.project}-${var.env}-${var.key_name}"
}