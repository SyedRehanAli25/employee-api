locals {
  name = "${var.application}-${var.environment}"

  cpu_policy_name = "${local.name}-cpu-policy"
}
