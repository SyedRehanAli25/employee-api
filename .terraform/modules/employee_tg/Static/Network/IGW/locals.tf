locals {
  name_prefix = "${var.environment}-${var.igw_name}"

  common_tags = {
    Application = var.application
    Owner       = var.owner
    Environment = var.environment
  }
}
