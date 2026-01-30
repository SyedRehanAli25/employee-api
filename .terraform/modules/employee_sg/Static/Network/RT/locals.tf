locals {
  common_tags = {
    Application = var.application
    Owner       = var.owner
    Environment = var.environment
  }

  public_rt_name  = "${var.environment}-${var.public_rt_name}"
  private_rt_name = "${var.environment}-${var.private_rt_name}"
}
