data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "otms-terraform-state"
    key    = "env/dev/network/vpc/terraform.tfstate"
    region = "us-east-1"
  }
}
