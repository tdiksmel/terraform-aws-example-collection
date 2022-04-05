resource "aws_security_group" "eks" {
  name        = "eks"
  description = "Allow Everything"
  vpc_id      = aws_vpc.eks.id

  ingress {
    cidr_blocks = [
      "0.0.0.0/0",
    ]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    self             = false
    to_port          = 0
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "eks"
  }
}



