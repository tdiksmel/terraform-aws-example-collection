resource "aws_eks_cluster" "eks" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks.arn

  vpc_config {
    subnet_ids              = [aws_subnet.eks-1.id, aws_subnet.eks-2.id]
    endpoint_private_access = true
    endpoint_public_access  = true
    security_group_ids      = [aws_security_group.eks.id]
  }
}

output "aws_eks_cluster_endpoint" {
  value = aws_eks_cluster.eks.endpoint
}
