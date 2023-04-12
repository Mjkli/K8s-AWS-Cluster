resource "aws_db_instance" "instance" {
    allocated_storage = var.db_storage
    db_name = var.db_name
    engine = var.engine
    engine_version = var.engine_version
    instance_class = var.db_class
    username = var.db_username
    password = var.db_password
    skip_final_snapshot = true
}
