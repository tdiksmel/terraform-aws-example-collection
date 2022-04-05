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
    * You need to understand that you kubernetes cluster will be limited to IPs number.
* **AWS Subnets** for **AWS VPC**.
    * Whole **VPC** will be separated in two equal parts, like if you CIDR: `10.0.0.0/24`, subnets will be `10.0.0.0/25`, `10.0.0.128/25`.
    * All subnets will be private (no public adresses).
* **AWS Internet Gateway** will be created (for outgoing traffic in private subnets you should create such thing).
* **AWS Security Group** will be created for **VPC** (for this installation - everything is allowed).
* **AWS Route Table** will be created. All egress traffic will be routed to **AWS Internet Gateway**, traffic inside same network segment will be routed localy.
* **AWS Route Table Association** will be created for each **AWS Subnet**.
* **AWS IAM User** will be created for kubernetes administration.
    * Credetials will be created automaticaly.
    * **AWS IAM Role** will be created for *Kubernetes* autoscaling
* **AWS Kubernetes Cluster** will be created with public and private endpoint
* **AWS Kubernetes Cluster Node Group** will be created with two `t2.nano` nodes
* **AWS KMS Key** kms key for crypting
* **AWS RDS Subnet Group** linked to private subnets
* **AWS RDS Instance** database instance

### Connect to your cluster

```shell
» aws eks update-kubeconfig --name example --region ${TF_VAR_AWS_REGION}
```

### Tesing cluster works

```shell
» kubectl get pods -A
NAMESPACE     NAME                       READY   STATUS    RESTARTS   AGE
kube-system   aws-node-42nx9             1/1     Running   0          9m43s
kube-system   aws-node-h9nzt             1/1     Running   0          9m52s
kube-system   coredns-66cb55d4f4-ht6g4   1/1     Running   0          18m
kube-system   coredns-66cb55d4f4-nzlvf   1/1     Running   0          18m
kube-system   kube-proxy-pl6v4           1/1     Running   0          9m52s
kube-system   kube-proxy-whcsk           1/1     Running   0          9m43s
```


### Building application

```shell
docker push tdiksmel/terraform-aws-example-collection:tagname
```

### Problems, what needs attention

* Tags are not setted (Very bad to use this)
* Resource named `example`
* RDS database creating outside of **AWS RDS Cluster**
* No S3, Redis and etc. created