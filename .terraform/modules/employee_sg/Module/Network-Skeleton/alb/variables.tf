variable "name" {
  description = "Name of the ALB"
  type        = string
}

variable "internal" {
  description = "Whether ALB is internal"
  type        = bool
  default     = false
}

variable "subnet_ids" {
  description = "Subnets where ALB will be deployed"
  type        = list(string)
}

variable "security_group_ids" {
  description = "Security groups attached to ALB"
  type        = list(string)
}

variable "enable_http" {
  description = "Enable HTTP listener"
  type        = bool
  default     = true
}

variable "enable_https" {
  description = "Enable HTTPS listener"
  type        = bool
  default     = true
}

variable "certificate_arn" {
  description = "ACM certificate ARN for HTTPS"
  type        = string
  default     = null
}

variable "ssl_policy" {
  description = "SSL policy for HTTPS listener"
  type        = string
  default     = "ELBSecurityPolicy-TLS13-1-2-2021-06"
}

variable "environment" {
  type = string
}

variable "application" {
  type = string
}

variable "owner" {
  type = string
}
