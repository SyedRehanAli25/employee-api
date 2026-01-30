terraform {
  backend "s3" {
    bucket         = "otms-terraform-state"
    key            = "env/dev/application/notification-service/asg-policy/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "otms-terraform-locks"
    encrypt        = true
  }
}
