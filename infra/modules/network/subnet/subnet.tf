resource "aws_subnet" "subnet" {
    vpc_id = var.vpc_id
    cidr_block = var.subnet_cidr
    availability_zone = var.availability_zone

    tags = {
      project = var.project
      env = var.env
    }
}

resource "aws_route_table_association" "rt_assoc" {
  subnet_id = aws_subnet.subnet.id
  route_table_id = var.rt_id
}