resource "aws_kms_key" "example" {
  description             = "KMS key 1"
  deletion_window_in_days = 10
}