variable "vpc_id" {}
variable "public_subnet_ids" { type = list(string) }
variable "ssh_allowed_cidr" {}
variable "environment" {}
variable "application" {}
variable "owner" {}

