resource "aws_iam_policy" "policy" {
    name = var.policy_name
    path = "/policies/"
    description = var.policy_description
    policy = jsonencode(var.policy_json)
  
}