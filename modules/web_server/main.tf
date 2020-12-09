locals {
  web_server_tags ={
    Name = "${var.environment}-web-server"
    Environment = "${var.environment}"
    propagate_at_launch = true
  }
}

data "aws_ami" "base_ami" {
  most_recent = true
  filter {
    name      = "image-id"
    values    = [ "ami-07ee42ba0209b6d77" ]
  }
  filter {
    name      = "virtualization-type"
    values    = ["hvm"]
  }
  owners      = ["099720109477"] # Canonical
}

resource "aws_launch_configuration" "web_server" {
  name_prefix     = "${var.environment}-web-server"
  image_id        = data.aws_ami.base_ami.image_id
  instance_type   = var.instance_type
  security_groups = [ aws_security_group.web_server.id ]
  key_name        = var.key_name
  user_data       = data.template_file.web_server_setup.rendered

  lifecycle {
    create_before_destroy = true
  }

  associate_public_ip_address = false

  root_block_device {
    volume_size = "8"
  }
}

resource "aws_autoscaling_group" "web_server" {
  name = "${var.environment}-web-server"
  vpc_zone_identifier = var.subnet_ids
  desired_capacity          = var.desired_capacity
  min_size                  = var.min_size
  max_size                  = var.max_size
  health_check_grace_period = 300
  health_check_type         = "ELB"
  force_delete              = true
  wait_for_capacity_timeout = 0
  launch_configuration      = aws_launch_configuration.web_server.name

  target_group_arns = [ var.alb_target_group_arn ]

  lifecycle {
    create_before_destroy = true
  }
  
  dynamic "tag" {
    for_each = local.web_server_tags

    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }

}