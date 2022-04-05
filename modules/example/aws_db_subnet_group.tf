resource "aws_db_subnet_group" "example" {
  name       = "main"
  subnet_ids = [aws_subnet.eks-1.id, aws_subnet.eks-2.id]
}