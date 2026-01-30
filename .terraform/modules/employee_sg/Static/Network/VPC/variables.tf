variable "vpc_cidr" {
  type = string
}
variable "environment" {
  description = "Deployment environment (dev, stage, prod)"
  type        = string
}

variable "vpc_name" {
  description = "Base name for the VPC"
  type        = string
}

variable "application" {
  description = "Application or project name"
  type        = string
}

variable "owner" {
  description = "Owner or team responsible for the resource"
  type        = string
}
