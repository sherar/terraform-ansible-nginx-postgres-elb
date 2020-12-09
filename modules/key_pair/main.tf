resource "tls_private_key" "this" {
  algorithm = "RSA"
}

resource "aws_key_pair" "this" {
  key_name        = var.key_name
  public_key      = tls_private_key.this.public_key_openssh
  tags = var.tags
}