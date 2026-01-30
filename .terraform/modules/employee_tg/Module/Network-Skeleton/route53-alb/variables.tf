variable "zone_id" {
  description = "Route53 Hosted Zone ID"
  type        = string
}

variable "record_name" {
  description = "DNS record name (root or subdomain)"
  type        = string
}

variable "alb_dns_name" {
  type = string
}

variable "alb_zone_id" {
  type = string
}
