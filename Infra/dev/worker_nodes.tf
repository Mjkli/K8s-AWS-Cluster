module "worker_node_1" {
    source = "../modules/ec2/instance"
    ami = var.worker_node_ami
    instance_type = var.worker_node_instance_type
    subnet = module.subnet-1.id
    private_ip = var.worker_node_1_ip
    project = var.project
    env = var.env
    name = "worker-node-2-${var.project}-${var.env}"
    key_name = "${var.project}-${var.env}-${var.key_name}"
    security_groups = null
}

module "worker_node_2" {
    source = "../modules/ec2/instance"
    ami = var.worker_node_ami
    instance_type = var.worker_node_instance_type
    subnet = module.subnet-1.id
    private_ip = var.worker_node_2_ip
    project = var.project
    env = var.env
    name = "worker-node-2-${var.project}-${var.env}"
    key_name = "${var.project}-${var.env}-${var.key_name}"
    security_groups = null

}