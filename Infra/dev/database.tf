# module "ipam_db" {
#     source = "../modules/rds/instance"
#     db_storage = var.db_storage
#     db_name = var.db_name
#     engine = var.db_engine
#     engine_version = var.db_version
#     db_class = var.db_class
#     db_username = var.db_username
#     db_password = var.db_password
# }