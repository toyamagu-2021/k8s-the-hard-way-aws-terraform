module "jumpbox" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "jumpbox"

  instance_type          = "t4g.micro"
  key_name               = module.ssh_key.key_pair_name
  monitoring             = true
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  subnet_id              = module.vpc.public_subnets[0]
  user_data              = file("./scripts/script.sh")
  ami                    = var.ami_id

  associate_public_ip_address = true
}

module "server" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "server"

  instance_type               = "t4g.micro"
  ami                         = var.ami_id
  key_name                    = module.ssh_key.key_pair_name
  monitoring                  = true
  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]
  subnet_id                   = module.vpc.private_subnets[0]
  user_data                   = file("./scripts/script.sh")
  user_data_replace_on_change = true

  # Very important to access between nodes
  source_dest_check           = false
}

module "node_0" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "node-0"
  ami  = var.ami_id

  instance_type               = "t4g.micro"
  key_name                    = module.ssh_key.key_pair_name
  monitoring                  = true
  source_dest_check           = false
  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]
  subnet_id                   = module.vpc.private_subnets[0]
  user_data                   = file("./scripts/script.sh")
  user_data_replace_on_change = true
}

module "node_1" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "node-1"
  ami  = var.ami_id

  instance_type               = "t4g.micro"
  key_name                    = module.ssh_key.key_pair_name
  monitoring                  = true
  source_dest_check           = false
  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]
  subnet_id                   = module.vpc.private_subnets[0]
  user_data                   = file("./scripts/script.sh")
  user_data_replace_on_change = true
}
