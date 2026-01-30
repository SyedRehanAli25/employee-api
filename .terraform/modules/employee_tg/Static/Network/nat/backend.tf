terraform {
  backend "s3" {
    bucket = "dev-ot-ms-terraform-state"
    key    = "network/nat/terraform.tfstate"
    region = "us-east-1"
  }
}
