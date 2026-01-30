locals {
  name_prefix = "${var.environment}-${var.application}"

  tags = {
    Application = var.application
    Environment = var.environment
    Owner       = var.owner
  }
}

