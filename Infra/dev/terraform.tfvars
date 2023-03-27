# Global Variables
project = "iac"
env = "dev"
availability_zone = "us-west-1a"

# Network
    # VPC
        vpc_cidr_block = "10.0.0.0/16"

    # Subnet 1
        subnet_1_cidr = "10.0.0.0/24"

# Ansible EC2
    ansible_ami = "ami-06604eb73be76c003"
    ansible_instance_type = "t2.micro"
    ansible_ip = "10.0.0.10"
# SSH Key
    key_name = "ansible_key"

# Master Node EC2
    master_node_ami = "ami-06604eb73be76c003"
    master_node_instance_type = "t2.micro"
    masterNode_ip = "10.0.0.11"

# Worker Node EC2
    worker_node_ami = "ami-06604eb73be76c003"
    worker_node_instance_type = "t2.micro"

    # Worker Node 1
        worker_node_1_ip = "10.0.0.20"
    # Worker Node 1
        worker_node_2_ip = "10.0.0.21"
    # Worker Node 1
        #worker_node_3_ip = "10.0.0.22"

# RDS Instance
db_storage = 10
db_name = "ipamdb"
db_engine = "mysql"
db_version = "8.0.32"
db_class = "db.t2.micro"