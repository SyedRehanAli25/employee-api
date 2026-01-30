resource "aws_lb" "this" {
  name               = "${local.name_prefix}-${var.name}"
  internal           = var.internal
  load_balancer_type = "application"

  subnets         = var.subnet_ids
  security_groups = var.security_group_ids

  tags = merge(
    local.tags,
    {
      Name = "${local.name_prefix}-${var.name}"
    }
  )
}

# ---------------------------------
# HTTP → HTTPS Redirect
# ---------------------------------
resource "aws_lb_listener" "http" {
  count = var.enable_http ? 1 : 0

  load_balancer_arn = aws_lb.this.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

# ---------------------------------
# HTTPS Listener
# ---------------------------------
resource "aws_lb_listener" "https" {
  count = var.enable_https ? 1 : 0

  load_balancer_arn = aws_lb.this.arn
  port              = 443
  protocol          = "HTTPS"

  ssl_policy      = var.ssl_policy
  certificate_arn = var.certificate_arn

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "ALB HTTPS is running"
      status_code  = "200"
    }
  }
}
