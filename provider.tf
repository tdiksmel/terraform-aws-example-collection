##
# Amazon Web Services Access Key
variable "AWS_ACCESS_KEY_ID" {
  type        = string
  description = "AWS Access Key"
}

##
# Amazon Web Services Secret Key
variable "AWS_SECRET_ACCESS_KEY" {
  type        = string
  description = "AWS secret key"
}

##
# Amazon Web Services default region
variable "AWS_REGION" {
  type        = string
  description = "AWS default region"
}

##
# Configure cloud provider (AWS)
provider "aws" {
  region     = "us-west-1"
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
}

##
# Configure Terraform backend inside AWS S3 bucket 
# terraform {
#   backend "s3" {
#     bucket = "wayside.terraform.states"
#     key    = "terraform.eks.tfstate"
#     region = "us-west-2"
#   }
# }
