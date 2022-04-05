resource "aws_vpc" "eks" {
  cidr_block           = var.cidr
  enable_dns_hostnames = true
  tags = {
    Name = "eks-${var.cluster_name}"
  }
}

output "vpc_id" {
    value = aws_vpc.eks.id
}
