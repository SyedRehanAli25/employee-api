data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "dev-ot-ms-terraform-state"
    key    = "network/vpc/terraform.tfstate"
    region = "us-east-1"
  }
}
