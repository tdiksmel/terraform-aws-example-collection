resource "aws_eks_node_group" "eks" {
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = "eks"
  disk_size       = 80
  node_role_arn   = aws_iam_role.eks-node.arn
  subnet_ids      = [aws_subnet.eks-1.id, aws_subnet.eks-2.id]

  depends_on = [aws_eks_cluster.eks]
  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 2
  }

  instance_types = ["t3.medium"]

  update_config {
    max_unavailable = 1
  }

  tags_all = {
    "Name:" : "eks-${var.cluster_name}"
    "k8s.io/cluster-autoscaler/enabled" : "TRUE",
    "k8s.io/cluster-autoscaler/infra" : "owned"
  }

  tags = {
    "Name:" : "eks-${var.cluster_name}"
    "k8s.io/cluster-autoscaler/enabled" : "TRUE",
    "k8s.io/cluster-autoscaler/infra" : "owned"
  }
}
