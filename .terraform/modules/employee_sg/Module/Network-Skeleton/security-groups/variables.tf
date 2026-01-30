variable "name" {
  description = "Logical name of the security group"
  type        = string
}

variable "description" {
  description = "Description of the security group"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where security group will be created"
  type        = string
}

# -----------------------------
# Ingress rules - CIDR based
# -----------------------------
variable "ingress_cidr_rules" {
  description = "Ingress rules using CIDR blocks"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))
  default = []
}

# -----------------------------
# Ingress rules - SG based
# -----------------------------
variable "ingress_sg_rules" {
  description = "Ingress rules using source security groups"
  type = list(object({
    from_port                = number
    to_port                  = number
    protocol                 = string
    source_security_group_id = string
    description              = string
  }))
  default = []
}

# -----------------------------
# Egress rules
# -----------------------------
variable "egress_rules" {
  description = "Egress rules for the security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))
  default = []
}

# -----------------------------
# Tagging / Naming
# -----------------------------
variable "environment" {
  description = "Environment name (dev, qa, prod)"
  type        = string
}

variable "application" {
  description = "Application name"
  type        = string
}

variable "owner" {
  description = "Owner of the resources"
  type        = string
}
