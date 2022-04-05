
resource "aws_route_table_association" "eks-1" {
  subnet_id      = aws_subnet.eks-1.id
  route_table_id = aws_route_table.eks.id
}

resource "aws_route_table_association" "eks-2" {
  subnet_id      = aws_subnet.eks-2.id
  route_table_id = aws_route_table.eks.id
}
