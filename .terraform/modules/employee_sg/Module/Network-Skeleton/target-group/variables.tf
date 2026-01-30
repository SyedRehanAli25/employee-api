variable "name" {
  description = "Logical name of the target group (e.g frontend, auth, orders)"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where target group will be created"
  type        = string
}

variable "port" {
  description = "Target group port"
  type        = number
  default     = 80
}

variable "protocol" {
  description = "Target group protocol"
  type        = string
  default     = "HTTP"
}

variable "target_type" {
  description = "Target type (instance, ip, lambda)"
  type        = string
  default     = "instance"
}

# ------------------------
# Health Check
# ------------------------
variable "health_check_path" {
  description = "Health check path"
  type        = string
  default     = "/"
}

variable "health_check_interval" {
  type    = number
  default = 30
}

variable "health_check_timeout" {
  type    = number
  default = 5
}

variable "healthy_threshold" {
  type    = number
  default = 2
}

variable "unhealthy_threshold" {
  type    = number
  default = 2
}

variable "matcher" {
  description = "HTTP success codes"
  type        = string
  default     = "200"
}

# ------------------------
# Tags
# ------------------------
variable "environment" {
  type = string
}

variable "application" {
  type = string
}

variable "owner" {
  type = string
}
