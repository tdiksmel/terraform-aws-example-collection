
# ======================================================================================================= #
# eks subnets                                                                                             #
# ======================================================================================================= #
resource "aws_subnet" "eks-1" {
  vpc_id                  = aws_vpc.eks.id
  cidr_block              = cidrsubnet(var.cidr, 1, 0)
  availability_zone       = "${var.zone}a"
  map_public_ip_on_launch = true
  tags = {
    Name = "eks-1"
  }
}

resource "aws_subnet" "eks-2" {
  vpc_id                  = aws_vpc.eks.id
  cidr_block              = cidrsubnet(var.cidr, 1, 1)
  availability_zone       = "${var.zone}b"
  map_public_ip_on_launch = true
  tags = {
    Name = "eks-2"
  }
}
