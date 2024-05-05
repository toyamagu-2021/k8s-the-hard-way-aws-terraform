resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

module "ssh_key" {
  source     = "terraform-aws-modules/key-pair/aws"
  key_name   = "ssh"
  public_key = tls_private_key.key.public_key_openssh
}
