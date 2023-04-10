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


resource "aws_default_route_table" "public_route_table" {
    default_route_table_id = aws_vpc.main.default_route_table_id
    
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
      }
    
    tags = {
        project = var.project
        env = var.env
      }
}

resource "aws_eip" "nat_eip" {
  vpc = true
}

resource "aws_nat_gateway" "private_nat" {
    allocation_id = aws_eip.nat_eip.id
    subnet_id = var.public_subnet_id
}


resource "aws_route_table" "private_route_table" {
    vpc_id = aws_vpc.main.id

    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_nat_gateway.private_nat.id
    }

    tags = {
      project = var.project
      env = var.env
    }

}