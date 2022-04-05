resource "aws_iam_user" "eks" {
  name = "eks-${var.cluster_name}"
  path = "/"
}

resource "aws_iam_access_key" "eks" {
  user = aws_iam_user.eks.name
}

output "eks-secret" {
  sensitive = false
  value     = aws_iam_access_key.eks.secret
}

output "eks-access" {
  sensitive = false
  value     = aws_iam_access_key.eks.id
}