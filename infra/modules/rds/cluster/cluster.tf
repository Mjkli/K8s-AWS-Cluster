resource "aws_rds_cluster" "cluster" {
    cluster_identifier = var.cluster_name
    engine = var.cluster_engine
    availability_zones = var.cluster_zones
    database_name = var.database_name
    master_username = var.username
    master_password = var.password
    backup_retention_period = var.backup_period
}

resource "aws_rds_cluster_instance" "instance" {
    cluster_identifier = aws_rds_cluster.cluster.id
    instance_class = var.instance_class
    engine = aws_rds_cluster.cluster.engine
    engine_version = aws_rds_cluster.cluster.engine_version
}
