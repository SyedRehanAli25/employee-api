provider "aws" {
  region = "us-east-1"
}

resource "aws_lb_target_group" "notification_worker" {
  name     = "${var.application}-${var.environment}-tg"
  port     = var.port
  protocol = var.protocol
  vpc_id  = data.terraform_remote_state.vpc.outputs.vpc_id

  target_type = "instance"

  health_check {
    path                = var.health_check_path
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200"
  }

  tags = {
    Name        = "${var.application}-${var.environment}-tg"
    Application = var.application
    Owner       = var.owner
    Environment = var.environment
    CostCenter  = var.cost_center
  }
}
