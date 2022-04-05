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

output "rds_address" {
  sensitive = false
  value     = module.example.rds_address
}