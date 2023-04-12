resource "aws_iam_role" "name" {
    name = var.role_name
    assume_role_policy = var.role_policy

    tags = {
        Name = var.tag
    }
  
}