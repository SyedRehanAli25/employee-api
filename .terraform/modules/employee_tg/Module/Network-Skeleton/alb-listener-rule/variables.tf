variable "listener_arn" {
  description = "HTTPS listener ARN of the ALB"
  type        = string
}

variable "target_group_arn" {
  description = "Target group ARN to forward traffic to"
  type        = string
}

variable "priority" {
  description = "Priority of the listener rule"
  type        = number
}

# ------------------------
# Routing Conditions
# ------------------------
variable "path_patterns" {
  description = "Path patterns for routing (e.g /, /api/*)"
  type        = list(string)
  default     = []
}

variable "host_headers" {
  description = "Host headers for routing (e.g app.example.com)"
  type        = list(string)
  default     = []
}
