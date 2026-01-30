variable "application" {}
variable "environment" {}
variable "owner" {}
variable "cost_center" {}

variable "port" {
  default = 5000
}

variable "protocol" {
  default = "HTTP"
}

variable "health_check_path" {
  default = "/"
}
