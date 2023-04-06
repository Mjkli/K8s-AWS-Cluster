module "main-vpc"{
    source = "../modules/network/vpc"
    vpc_name = "${var.project}-${var.env}-vpc"
    vpc_cidr_block = var.vpc_cidr_block
    project = var.project
    env = var.env
    subnet_id = module.subnet-1.id
} 

module "subnet-1-public" {
    source = "../modules/network/subnet"
    vpc_id = module.main-vpc.id
    subnet_cidr = var.subnet_1_cidr
    availability_zone = var.availability_zone
    project = var.project
    env = var.env
    rt_id = module.main-vpc.public_rt_id
}

module "subnet-2-private" {
    source = "../modules/network/subnet"

    vpc_id = module.main-vpc.id
    subnet_cidr = var.subnet_2_cidr
    availability_zone = var.availability_zone
    project = var.project
    env = var.env
    rt_id = module.main-vpc.private_rt_id
  
}