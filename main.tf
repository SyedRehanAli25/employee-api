############################################
# Employee API Target Group
############################################
module "employee_tg" {
  source = "git::ssh://git@github.com/Snaatak-Downtime-Rakshak/Terraform.git//Module/Network-Skeleton/target-group?ref=SCRUM-993-asma"

  name   = "employee-api"
  vpc_id = data.terraform_remote_state.network.outputs.vpc_id

  port        = 8080
  protocol    = "HTTP"
  target_type = "instance"

  health_check_path = "/health"

  environment = var.environment
  application = var.application
  owner       = var.owner
}

############################################
# ALB Listener Rule (PATH BASED)
# /employee/* --> employee-api
############################################
module "employee_listener_rule" {
  source = "git::ssh://git@github.com/Snaatak-Downtime-Rakshak/Terraform.git//Module/Network-Skeleton/alb-listener-rule?ref=SCRUM-993-asma"

  listener_arn     = data.terraform_remote_state.network.outputs.alb_https_listener_arn
  priority         = 20
  target_group_arn = module.employee_tg.target_group_arn

  path_patterns = [
    "/employee",
    "/employee/*"
  ]
}

############################################
# Employee API Security Group
############################################
module "employee_sg" {
  source = "git::ssh://git@github.com/Snaatak-Downtime-Rakshak/Terraform.git//Module/Network-Skeleton/security-groups?ref=SCRUM-993-asma"

  name        = "employee-api-sg"
  description = "Security group for employee api"

  vpc_id = data.terraform_remote_state.network.outputs.vpc_id

  ingress_sg_rules = [
    {
      from_port                = 8080
      to_port                  = 8080
      protocol                 = "tcp"
      source_security_group_id = data.terraform_remote_state.network.outputs.alb_security_group_id
      description              = "Allow traffic from ALB"
    }
  ]

  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow all outbound"
    }
  ]

  environment = var.environment
  application = var.application
  owner       = var.owner
}

############################################
# Employee API ASG
############################################
module "employee_asg" {
  source = "git::ssh://git@github.com/Snaatak-Downtime-Rakshak/Terraform.git//modules/asg-compute?ref=SCRUM-994-shanu"

  name = "${var.environment}-${var.application}-employee-api-asg"

  vpc_id     = data.terraform_remote_state.network.outputs.vpc_id
  subnet_ids = data.terraform_remote_state.network.outputs.backend_subnet_ids

  ami_id        = "ami-0d9057e59ccca920f"
  instance_type = "t3.micro"

  desired_capacity = 1
  min_size         = 1
  max_size         = 2

  enable_target_group_resource = true
  alb_target_group_arn         = module.employee_tg.target_group_arn

  enable_launch_template_resource    = true
  enable_asg_scaling_policy_resource = false
  enable_cloudwatch_alarm_resource   = false
  enable_iam_role_resource           = false

  security_group_ids = [
    module.employee_sg.security_group_id
  ]

  tags = {
    Name        = "${var.environment}-${var.application}-employee-api"
    Environment = var.environment
    Application = var.application
    Owner       = var.owner
  }
}
