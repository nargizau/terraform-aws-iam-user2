resource "aws_iam_user" "users" {
  for_each = var.users
  name     = each.key
  path     = "/"
}

variable "users" {
    type = list(string)
}

output "user_name" {
  value = [for user in aws_iam_user.users : user.name]
}