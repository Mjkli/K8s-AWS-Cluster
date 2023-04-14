output "public_dns" {
    value = aws_db_instance.instance.endpoint
}