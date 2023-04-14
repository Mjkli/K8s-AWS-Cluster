module "ipam_ecr" {
    source = "../modules/ecr"
    ecr_name = var.ipam_ecr_name
}