# Postgres Server
module "ec2" {
  source                      = "terraform-aws-modules/ec2-instance/aws"
  version                     = "~> 2.0"
  name                        = "${var.environment}-postgres"
  ami                         = data.aws_ami.base_ami.id
  key_name                    = var.key_name
  instance_type               = var.instance_type
  subnet_id                   = tolist(var.subnet_ids)[0]
  vpc_security_group_ids      = [aws_security_group.postgres.id]
  associate_public_ip_address = false
  user_data                   = data.template_file.web_server_setup.rendered
}

# EBS setup
resource "aws_volume_attachment" "postgres" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.postgres.id
  instance_id = module.ec2.id[0]
}

resource "aws_ebs_volume" "postgres" {
  availability_zone = module.ec2.availability_zone[0]
  size              = var.volume_size
}