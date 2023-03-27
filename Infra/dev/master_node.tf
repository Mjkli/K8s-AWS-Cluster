module "master_node" {
    source = "../modules/ec2/instance"
    ami = var.master_node_ami
    instance_type = var.master_node_instance_type
    subnet = module.subnet-1.id
    private_ip = var.masterNode_ip
    project = var.project
    env = var.env
    name = "master-node-${var.project}-${var.env}"
    key_name = "${var.project}-${var.env}-${var.key_name}"

}

module "master-eip" {
    source = "../modules/network/eip"
    private_ip = var.masterNode_ip
    network_interface = module.master_node.nic_id
}