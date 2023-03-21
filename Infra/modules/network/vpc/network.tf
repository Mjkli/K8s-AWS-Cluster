resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr_block

    tags = {
      "Name" = var.vpc_name
      project = var.project
      env = var.env
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id

    tags = {
      project = var.project
      env = var.env
    }
}

resource "aws_route_table" "main_route_table" {
    vpc_id = aws_vpc.main.id

    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
      project = var.project
      env = var.env
    }

}