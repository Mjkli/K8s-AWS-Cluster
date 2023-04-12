resource "aws_iam_user" "name" {
    name = var.username
    path = "/users/"
    tags = {
        Name = var.tag
    }
}