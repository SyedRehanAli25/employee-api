variable "public_subnet_id" {
  description = "Public subnet ID where NAT Gateway will be created"
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

