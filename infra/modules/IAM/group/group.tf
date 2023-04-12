resource "aws_iam_group" "group" {
    name = var.groupname
    path = "/groups/"
  
}