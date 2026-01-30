terraform {
  backend "s3" {
    bucket  = "otms-terraform-state"
    key     = "wrapper/env/dev/application/employee-api/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
