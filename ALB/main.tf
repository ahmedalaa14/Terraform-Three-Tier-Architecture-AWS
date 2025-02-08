resource "aws_lb" "alb" {
  name                       = var.lb_name
  internal                   = false
  load_balancer_type         = var.lb_type
  security_groups            = [var.ALB_SG]
  subnets                    = [for public_subnet_id in var.public_subnets_id : public_subnet_id]
  enable_deletion_protection = true
  tags = {
    Environment = "dev"
  }
}

resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_target_group.arn
  }
}

