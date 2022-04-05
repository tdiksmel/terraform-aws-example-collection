resource "aws_iam_role" "eks-node" {
  assume_role_policy = jsonencode(
    {
      Statement = [
        {
          Action = "sts:AssumeRole"
          Effect = "Allow"
          Principal = {
            Service = "ec2.amazonaws.com"
          }
        },
      ]
      Version = "2012-10-17"
    }
  )

  description           = "Allows access to other AWS service resources that are required to operate clusters managed by EKS."
  force_detach_policies = false
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
    "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
    "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  ]
  max_session_duration = 3600
  name                 = "EKS-NODE"
  path                 = "/"
  tags = {
    "Name" = "EKS-NODE"
  }
  tags_all = {
    "Name" = "EKS-NODE"
  }

}

resource "aws_iam_role" "eks" {
  assume_role_policy = jsonencode(
    {
      Statement = [
        {
          Action = "sts:AssumeRole"
          Effect = "Allow"
          Principal = {
            Service = "eks.amazonaws.com"
          }
        },
      ]
      Version = "2012-10-17"
    }
  )

  description           = "Allows access to other AWS service resources that are required to operate clusters managed by EKS."
  force_detach_policies = false
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
    "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
    "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  ]

  max_session_duration = 3600
  name                 = "EKS"
  path                 = "/"
  tags = {
    "Name" = "EKS"
  }
  tags_all = {
    "Name" = "EKS"
  }

}
