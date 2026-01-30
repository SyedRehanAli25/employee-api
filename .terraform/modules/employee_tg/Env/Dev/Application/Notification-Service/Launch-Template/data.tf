data "terraform_remote_state" "sg" {
  backend = "s3"
  config = {
    bucket = "otms-terraform-state"
    key    = "env/dev/application/notification-service/security-group/terraform.tfstate"
    region = var.aws_region
  }
}
