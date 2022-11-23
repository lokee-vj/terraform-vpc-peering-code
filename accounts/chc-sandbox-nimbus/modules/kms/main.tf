resource "aws_kms_key" "testkey" {
  description             = var.description
  deletion_window_in_days = var.deletion_window
  key_usage = var.key_usage
  customer_master_key_spec = var.key_spec

}