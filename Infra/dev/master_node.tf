module "master_node" {
    source = "../modules/ec2/instance"
    ami = var.master_node_ami
    instance_type = var.master_node_instance_type
    subnet = module.subnet-1-public.id
    private_ip = var.masterNode_ip
    project = var.project
    env = var.env
    name = "master-node-${var.project}-${var.env}"
    key_name = "${var.project}-${var.env}-${var.key_name}"
    security_groups = [module.ansible_sg.id]

}