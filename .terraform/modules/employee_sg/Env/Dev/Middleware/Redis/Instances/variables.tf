variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "ami_id" {
  description = "AMI ID for Redis"
  default     = "ami-0ecb62995f68bb549"
}

variable "instance_type" {
  default = "t3.medium"
}

variable "key_name" {
  default = "Dev-OTMS-Terraform"
}

variable "volume_size" {
  default = 20
}
