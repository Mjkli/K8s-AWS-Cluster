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