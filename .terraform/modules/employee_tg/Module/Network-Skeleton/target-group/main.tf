resource "aws_lb_target_group" "this" {
  name        = "${local.name_prefix}-${var.name}-tg"
  port        = var.port
  protocol    = var.protocol
  vpc_id      = var.vpc_id
  target_type = var.target_type

  health_check {
    path                = var.health_check_path
    interval            = var.health_check_interval
    timeout             = var.health_check_timeout
    healthy_threshold   = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
    matcher             = var.matcher
  }

  tags = merge(
    local.tags,
    {
      Name = "${local.name_prefix}-${var.name}-tg"
    }
  )
}
