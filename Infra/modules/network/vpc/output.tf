output "id" {
    value = aws_vpc.main.id
}

output "public_rt_id" {
    value = aws_vpc.main.default_route_table_id
}

output "private_rt_id" {
    value = aws_route_table.private_route_table.id
}