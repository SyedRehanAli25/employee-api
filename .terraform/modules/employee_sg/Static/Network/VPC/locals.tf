locals {
  name_prefix = "${var.environment}-${var.vpc_name}"

  common_tags = {
    Application = var.application
    Owner       = var.owner
    Environment = var.environment
  }
}
