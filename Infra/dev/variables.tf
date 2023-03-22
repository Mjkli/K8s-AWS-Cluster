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
    variable "need_public_ip" {}
    

