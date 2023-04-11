# module "worker_node_1" {
#     source = "../modules/ec2/instance"
#     ami = var.worker_node_ami
#     instance_type = var.worker_node_instance_type
#     subnet = module.subnet-2-private.id
#     private_ip = var.worker_node_1_ip
#     project = var.project
#     env = var.env
#     name = "worker-node-2-${var.project}-${var.env}"
#     key_name = "${var.project}-${var.env}-${var.key_name}"
#     security_groups = [module.worker_sg.id]
#     user_data = var.worker_user_data
# }

# module "worker_node_2" {
#     source = "../modules/ec2/instance"
#     ami = var.worker_node_ami
#     instance_type = var.worker_node_instance_type
#     subnet = module.subnet-2-private.id
#     private_ip = var.worker_node_2_ip
#     project = var.project
#     env = var.env
#     name = "worker-node-2-${var.project}-${var.env}"
#     key_name = "${var.project}-${var.env}-${var.key_name}"
#     security_groups = [module.worker_sg.id]
#     user_data = var.worker_user_data

# }

# module "worker_sg" {
#     source = "../modules/network/security_groups"
#     vpc_id = module.main-vpc.id
#     ingress = var.worker_sg_ingress
#     egress = var.worker_sg_egress
#     project = var.project
#     env = var.env
# }