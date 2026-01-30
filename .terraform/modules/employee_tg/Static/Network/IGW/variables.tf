variable "region" {
  description = "AWS region"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "application" {
  description = "Application name"
  type        = string
}

variable "owner" {
  description = "Resource owner"
  type        = string
}

variable "igw_name" {
  description = "Internet Gateway name"
  type        = string
}
