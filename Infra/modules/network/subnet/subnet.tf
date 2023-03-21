resource "aws_subnet" "subnet" {
    vpc_id = var.vpc_id
    cidr_block = var.subnet_cidr
    availablitiy_zone = var.availability_zone

    tags = {
        "Name" = var.tag
    }
}