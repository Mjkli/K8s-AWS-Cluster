module "ansible-server" {
    source = "../modules/ec2"
    ami = var.ansible_ami
    instance_type = var.ansible_instance_type
    subnet = module.subnet-1.id
    private_ips = var.ansible_ip
    project = var.project
    env = var.env

}