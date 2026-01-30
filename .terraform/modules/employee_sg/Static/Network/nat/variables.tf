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
  description = "Owner of resources"
  type        = string
}

variable "nat_name" {
  description = "NAT Gateway name"
  type        = string
}
