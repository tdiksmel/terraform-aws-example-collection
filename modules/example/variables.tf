variable "cluster_name" {
    description = "EKS cluster name"
    type = string
}

variable "cidr" {
    description = "EKS nodes network"
    type = string
    default = "172.16.10.0/23"
}

variable "zone" {
    description = "EKS zone"
    type = string
    default = "eu-central-1"
}