provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      Environment = "Dev"
      ManagedBy   = "Terraform"
      Service     = "middleware"
    }
  }
}
