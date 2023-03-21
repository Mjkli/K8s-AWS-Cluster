resource "aws_vpc" "main" {
    cidr_block = var.vpc_cider_block

    tags = {
      "Name" = var.tag
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id

    tags = {
      "Name" = var.tag
    }
}

resource "aws_route_table" "Terr_Route_table" {
    vpc_id = aws_vpc.main.id

    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
      "Name" = var.tag
    }

}