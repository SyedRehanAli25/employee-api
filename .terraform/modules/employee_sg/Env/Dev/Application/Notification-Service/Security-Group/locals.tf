locals {
  name = "${var.application}-${var.environment}"

  ingress_rules = [
    {
      description = "Notification API"
      port        = 5000
      cidr        = "10.0.0.0/16"
    },
    {
      description = "Elasticsearch"
      port        = 9200
      cidr        = "10.0.0.0/16"
    },
    {
      description = "SMTP SSL"
      port        = 465
      cidr        = "0.0.0.0/0"
    },
    {
      description = "SMTP"
      port        = 25
      cidr        = "0.0.0.0/0"
    },
    {
      description = "HTTP"
      port        = 80
      cidr        = "0.0.0.0/0"
    },
    {
      description = "HTTPS"
      port        = 443
      cidr        = "0.0.0.0/0"
    }
  ]

  common_tags = {
    Name        = "${local.name}-sg"
    Application = var.application
    Environment = var.environment
    Owner       = var.owner
    CostCenter  = var.cost_center
  }
}
