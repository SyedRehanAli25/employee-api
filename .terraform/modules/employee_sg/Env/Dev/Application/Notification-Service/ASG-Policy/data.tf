data "terraform_remote_state" "asg" {
  backend = "s3"
  config = {
    bucket = "otms-terraform-state"
    key    = "env/dev/application/notification-service/asg/terraform.tfstate"
    region = var.aws_region
  }
}
