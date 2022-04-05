module "example" {
  source = "./modules/example"

  cluster_name = "example"
  cidr         = "172.100.0.0/16" // Module will separate it on two private parts
  zone         = var.AWS_REGION   // Cluster Zone
}

resource "helm_release" "example" {
  name       = "example"
  chart      = "./helm"
  namespace = "example"
  create_namespace = true
  timeout = 60
  force_update = true

  set {
    name = "DB_HOST"
    value = module.example.rds_address
  }

  set {
    name = "DB_NAME"
    value = "example"
  }

  set {
    name = "DB_PORT"
    value = "3306"
  }

  set {
    name = "DB_USER"
    value = module.example.rds_user
  }

  set {
    name = "DB_PASS"
    value = module.example.rds_pass
  }
}

output "endpoint" {
  value = module.example.aws_eks_cluster_endpoint
}

output "vpc" {
  value = module.example.vpc_id
}

output "eks-access" {
  value = base64encode(module.example.eks-access)
}

output "eks-secret" {
  value = base64encode(nonsensitive(module.example.eks-secret))
}
