module "ansible_server" {
    source = "../modules/ec2/instance"
    ami = var.ansible_ami
    instance_type = var.ansible_instance_type
    subnet = module.subnet-1-public.id
    private_ip = var.ansible_ip
    project = var.project
    env = var.env
    name = "ansible-${var.project}-${var.env}"
    key_name = "${var.project}-${var.env}-${var.key_name}"
    security_groups = [module.ansible_sg.id]

}

module "ansible_eip" {
    source = "../modules/network/eip"
    nic = module.ansible_server.nic_id
    private_ip = module.ansible_server.private_ip
    instance_id = module.ansible_server.id
}

module "ansible_key" {
    source = "../modules/ec2/key_pair"
    key_name = "${var.project}-${var.env}-${var.key_name}"
}

module "ansible_sg" {
    source = "../modules/network/security_groups"
    vpc_id = module.main-vpc.id
    ingress = var.ansible_sg_ingress
    egress = var.ansible_sg_egress
    project = var.project
    env = var.env
    
}