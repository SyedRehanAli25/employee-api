ubuntu@ip-172-31-2-5:~/otms-infra-terraform/dev/middleware/redis/security-group$ cat data.tf 
data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/network/vpc/terraform.tfstate"
    region = "us-east-1"
  }
}
