locals {
  name_prefix = "${var.environment}-${var.nat_name}"

  common_tags = {
    Application = var.application
    Owner       = var.owner
    Environment = var.environment
  }
}
