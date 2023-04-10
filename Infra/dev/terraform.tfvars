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
    ansible_user_data = <<-EOL
    #! /bin/bash -xe
    apt update
    apt upgrade -y
    apt install ansible -y

    mkdir actions-runner && cd actions-runner
    curl -o actions-runner-linux-x64-2.303.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.303.0/actions-runner-linux-x64-2.303.0.tar.gz
    tar xzf ./actions-runner-linux-x64-2.303.0.tar.gz

    ./config.sh --url https://github.com/Mjkli/IAC_full --token "${ var.RUNNER_TOKEN }"

    EOL

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
    master_node_instance_type = "t2.micro"
    masterNode_ip = "10.0.0.11"

# Worker Node EC2
    worker_node_ami = "ami-014d05e6b24240371"
    worker_node_instance_type = "t2.micro"
    worker_user_data = <<-EOL
    #! /bin/bash -xe
    apt update
    apt upgrade -y
    apt install ansible -y
    EOL

    # Worker Node 1
        worker_node_1_ip = "10.0.1.20"
    # Worker Node 1
        worker_node_2_ip = "10.0.1.21"
    # Worker Node 1
        #worker_node_3_ip = "10.0.0.22"

    # worker Node Security Group
    worker_sg_ingress = [{
      from_port = 22
      to_port = 22
      protocol = "TCP"
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