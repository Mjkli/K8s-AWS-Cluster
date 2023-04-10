# Global variables
variable "project" {}
variable "env" {}
variable "availability_zone" {}

# Network
    # VPC
        variable vpc_cidr_block {}
    
    # subnet-1
        variable subnet_1_cidr {}
    # subnet-2
        variable subnet_2_cidr {}    

# Ansible EC2
    variable ansible_ami {}
    variable ansible_instance_type {}
    variable ansible_ip {}
    variable ansible_user_data {}
# SSH Key
    variable key_name {}

# Ansible security group
    variable ansible_sg_ingress {}
    variable ansible_sg_egress {}
    
    
# Master Node EC2
    variable master_node_ami {}
    variable master_node_instance_type {}
    variable masterNode_ip {}

# Worker Node EC2
    variable worker_node_ami {}
    variable worker_node_instance_type {}
    variable "worker_user_data" {}

    # Worker Node 1
        variable worker_node_1_ip {}
    # Worker Node 2
        variable worker_node_2_ip {}
    # Worker Node 3
        #variable worker_node_3_ip {}
    variable worker_sg_ingress {}
    variable worker_sg_egress {}

# RDS Instance
variable db_storage {}
variable db_name {}
variable db_engine {}
variable db_version {}
variable db_class {}
variable db_username {
    sensitive = true
}
variable db_password {
    sensitive = true
}


