# Global variables
variable "project" {}
variable "env" {}
variable "availability_zone" {}

# Network
    # VPC
        variable vpc_cidr_block {}
    
    # subnet-1
        variable subnet_1_cidr {}

# Ansible EC2
    variable ansible_ami {}
    variable ansible_instance_type {}
    variable ansible_ip {}
# SSH Key
    variable key_name {}
    
# Master Node EC2
    variable master_node_ami {}
    variable master_node_instance_type {}
    variable masterNode_ip {}

# Worker Node EC2
    variable worker_node_ami {}
    variable worker_node_instance_type {}

    # Worker Node 1
        variable worker_node_1_ip {}
    # Worker Node 2
        variable worker_node_2_ip {}
    # Worker Node 3
        #variable worker_node_3_ip {}

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


