resource "aws_db_instance" "example" {
  allocated_storage    = 10
  engine               = "mysql"
  db_name = "example"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  apply_immediately = true
  storage_encrypted = true
  vpc_security_group_ids  = [aws_security_group.eks.id]
  kms_key_id = aws_kms_key.example.arn
  db_subnet_group_name = aws_db_subnet_group.example.name
}

output "rds_address" {
  sensitive = false
  value     = aws_db_instance.example.address
}

output "rds_user" {
  sensitive = false
  value     = aws_db_instance.example.username
}

output "rds_pass" {
  sensitive = false
  value     = aws_db_instance.example.password
}