output "id" {
    value = aws_vpc.main.id
}

output "rt_id" {
    value = aws_route_table.private_route_table.id
}