# Description

This is example project for using AWS Kubernetes cluster, RDS, Redis, S3 and application with Helm chart. Based on only terraform module and transfer variable for Helm on shared file.

## How to create infrastacture 

You need to specify environment variables to run:

```shell
AWS_REGION - AWS region where you need to deploy your infrastructure
AWS_ACCESS_KEY_ID - AWS access key
AWS_SECRET_ACCESS_KEY - AWS secret key
```

## Requiriments 

```
Terraform v1.0.3
```

### Terraform deploy procedure

* **AWS VPC** (Virtual Private Cloud) wird CIDR specified by `cidr` module variable. 
    * You need to understand that you kubernetes cluster will be limited to IPs number
* **AWS Subnets** for **AWS VPC**
    * Whole **VPC** will be separated in two equal parts, like if you CIDR: `10.0.0.0/24`, subnets will be `10.0.0.0/25`, `10.0.0.128/25`
    * All subnets will be private (no public adresses)
* **AWS Internet Gateway** will be created (for outgoing traffic in private subnets you should create such thing)
* **AWS Security Group** will be created for **VPC** (for this installation - everything is allowed)
* **AWS Route Table** will be created. All egress traffic will be routed to **AWS Internet Gateway**, traffic inside same network segment will be routed localy.
* **AWS Route Table Association** will be created for each **AWS Subnet**