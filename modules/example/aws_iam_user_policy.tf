resource "aws_iam_user_policy" "eks" {
  name = "eks-${var.cluster_name}"
  #   path        = "/"
  #   description = "Eks autoscaller"
  user = aws_iam_user.eks.name

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "autoscaling:DescribeAutoScalingGroups",
                "autoscaling:DescribeAutoScalingInstances",
                "autoscaling:DescribeLaunchConfigurations",
                "autoscaling:DescribeTags",
                "autoscaling:SetDesiredCapacity",
                "autoscaling:TerminateInstanceInAutoScalingGroup",
                "ec2:DescribeLaunchTemplateVersions",
                "autoscaling:DescribeTags"
            ],
            "Resource": "*",
            "Effect": "Allow"
        }
    ]
}
EOF


}
