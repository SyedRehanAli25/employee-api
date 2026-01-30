terraform {
  backend "s3" {
    bucket = "dev-ot-ms-terraform-state"
    key    = "network/igw/terraform.tfstate"
    region = "us-east-1"
  }
}
