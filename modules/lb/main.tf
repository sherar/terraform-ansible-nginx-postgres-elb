resource "aws_lb" "lb" {
  name            = "${var.environment}-terraform-lb"
  internal        = false
  load_balancer_type = "application"
  subnets         = var.subnet_ids
  security_groups = ["${aws_security_group.lb.id}"]
  
  enable_cross_zone_load_balancing = true

  tags = {
    Name = "${var.environment}-terraform-lb"
  }
}

resource "aws_lb_target_group" "lb" {
  name     = "${var.environment}-lb"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    healthy_threshold = 5
    unhealthy_threshold = 5
    timeout = 60
    interval = 120
  }
}

resource "aws_lb_listener" "lb" {
  load_balancer_arn = aws_lb.lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.lb.arn
    type             = "forward"
  }
}