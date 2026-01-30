terraform {
  backend "s3" {
    bucket         = "dev-otms-terraform-state"
    key            = "dev/middleware/redis/sg/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "dev-otms-terraform-locks"
    encrypt        = true
  }
}
