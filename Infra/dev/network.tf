module "main-vpc"{
    source = "../modules/network/vpc"
    vpc_name = "${var.project}-${var.env}-vpc"
    vpc_cidr_block = var.vpc_cidr_block
    project = var.project
    env = var.env
}

module "subnet-1" {
    source = "../modules/network/subnet"
    vpc_id = module.main-vpc.id
    subnet_cidr = var.subnet_1_cidr
    availability_zone = var.availability_zone
    project = var.project
    env = var.env
}