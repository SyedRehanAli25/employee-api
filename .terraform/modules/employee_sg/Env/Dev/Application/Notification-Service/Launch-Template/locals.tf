locals {
  # Base name for all resources
  name = "${var.application}-${var.environment}"

  # Common tags for every AWS resource
  common_tags = {
    Application = var.application
    Owner       = var.owner
    Environment = var.environment
    CostCenter  = var.cost_center
  }

  # Launch Template specific naming
  launch_template_name_prefix = "${local.name}-lt-"
  instance_name               = local.name
}
