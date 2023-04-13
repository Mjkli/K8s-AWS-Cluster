# Global Variables
project = "iac"
env = "dev"
availability_zone = "us-west-1a"

# Network
    # VPC
        vpc_cidr_block = "10.0.0.0/16"

    # Subnet 1
        subnet_1_cidr = "10.0.0.0/24"
    # Subnet 2
        subnet_2_cidr = "10.0.1.0/24"

# Ansible EC2
    ansible_ami = "ami-014d05e6b24240371"
    ansible_instance_type = "t2.micro"
    ansible_ip = "10.0.0.10"

# SSH Key
    key_name = "ansible_key"

    # Ansible Security Group
    ansible_sg_ingress = [{
      from_port = 22
      to_port = 22
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"] # Never allow everyone to access ssh like this. This server will only be up when i am working on it so this should be fine 
    }]
    ansible_sg_egress = [{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }]

# Master Node EC2
    master_node_ami = "ami-014d05e6b24240371"
    master_node_instance_type = "t3.medium"
    masterNode_ip = "10.0.0.11"

    # Ansible Security Group
    masternode_sg_ingress = [{
      # SSH service
      from_port = 22
      to_port = 22
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"] # Never allow everyone to access ssh like this. This server will only be up when i am working on it so this should be fine 
    },
    {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["10.0.0.0/16"] 
    }]
    masternode_sg_egress = [{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }]
 
# Worker Node EC2
    worker_node_ami = "ami-014d05e6b24240371"
    worker_node_instance_type = "t3.medium"
    worker_user_data = <<-EOL
    #! /bin/bash -xe
    apt update
    apt upgrade -y
    EOL

    # Worker Node 1
        worker_node_1_ip = "10.0.1.20"
    # Worker Node 1
        worker_node_2_ip = "10.0.1.21"
    # Worker Node 1
        #worker_node_3_ip = "10.0.0.22"

    # worker Node Security Group
    worker_sg_ingress = [{
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["10.0.0.0/16"] 
    }]
    worker_sg_egress = [{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }]

# RDS Instance
db_storage = 10
db_name = "ipamdb"
db_engine = "mysql"
db_version = "8.0.32"
db_class = "db.t2.micro"