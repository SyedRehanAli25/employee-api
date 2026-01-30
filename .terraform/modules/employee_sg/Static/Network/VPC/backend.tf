terraform {
  backend "s3" {
    bucket         = "dev-ot-ms-terraform-state"
    key            = "network/vpc/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "dev-ot-ms-terraform-locks"
    encrypt        = true
  }
}
