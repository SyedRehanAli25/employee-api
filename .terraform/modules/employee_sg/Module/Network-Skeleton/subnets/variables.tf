variable "vpc_id" {
  description = "VPC ID"
  type        = string
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

# Public subnets
variable "public_subnet_1_cidr" {
  type = string
}

variable "public_subnet_1_az" {
  type = string
}

variable "public_subnet_2_cidr" {
  type = string
}

variable "public_subnet_2_az" {
  type = string
}

# Frontend
variable "frontend_subnet_cidr" {
  type = string
}

variable "frontend_subnet_az" {
  type = string
}

# Backend
variable "backend_subnet_cidr" {
  type = string
}

variable "backend_subnet_az" {
  type = string
}

# Database
variable "database_subnet_cidr" {
  type = string
}

variable "database_subnet_az" {
  type = string
}

# Middleware
variable "middleware_subnet_cidr" {
  type = string
}

variable "middleware_subnet_az" {
  type = string
}

