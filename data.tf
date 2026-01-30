data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket = "otms-terraform-state"
    key    = "wrapper/env/dev/network/terraform.tfstate"
    region = "us-east-1"
  }
}
