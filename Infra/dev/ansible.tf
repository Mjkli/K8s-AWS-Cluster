module "ansible_server" {
    source = "../modules/ec2/instance"
    ami = var.ansible_ami
    instance_type = var.ansible_instance_type
    subnet = module.subnet-1-public.id
    private_ip = var.ansible_ip
    key_name = "${var.project}-${var.env}-${var.key_name}"
    security_groups = [module.ansible_sg.id]
    user_data = <<-EOL
    #! /bin/bash
    apt update
    apt upgrade -y
    apt install ansible jq -y

    cd /home/ubuntu
    mkdir actions-runner && cd actions-runner
    curl -o actions-runner-linux-x64-2.303.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.303.0/actions-runner-linux-x64-2.303.0.tar.gz
    tar xzf ./actions-runner-linux-x64-2.303.0.tar.gz

    chown -R ubuntu /home/ubuntu


    echo "$(curl -L -X POST -H "Accept: application/vnd.github+json" -H "Authorization: Bearer ${var.api_token}" -H "X-GitHub-Api-Version: 2022-11-28" https://api.github.com/repos/mjkli/iac_full/actions/runners/registration-token | jq -r '.token')" > token.txt
    echo "export RUNNER_TOKEN=$(cat token.txt)" >> /etc/environment
    rm token.txt
    
    sudo -H -u ubuntu bash -c 'source /etc/environment && ./config.sh --url https://github.com/Mjkli/IAC_full --token $RUNNER_TOKEN --name ansible --labels ansible --unattended --runasservice'
    sudo -H -u ubuntu bash -c './run.sh &'

    EOL

    project = var.project
    env = var.env
    name = "ansible-${var.project}-${var.env}"

}

module "ansible_eip" {
    source = "../modules/network/eip"
    nic = module.ansible_server.nic_id
    private_ip = module.ansible_server.private_ip
    instance_id = module.ansible_server.id
}

module "ansible_key" {
    source = "../modules/ec2/key_pair"
    key_name = "${var.project}-${var.env}-${var.key_name}"
}

module "ansible_sg" {
    source = "../modules/network/security_groups"
    vpc_id = module.main-vpc.id
    ingress = var.ansible_sg_ingress
    egress = var.ansible_sg_egress
    project = var.project
    env = var.env
    
}