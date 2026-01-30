resource "aws_instance" "redis" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.redis_key_name

  subnet_id              = data.terraform_remote_state.network.outputs.database_subnet
  vpc_security_group_ids = [aws_security_group.redis_sg.id]

  associate_public_ip_address = false

  root_block_device {
    volume_size = var.volume_size
    volume_type = "gp3"
  }

  tags = {
    Name        = var.app_name
    Application = var.app_name
    Environment = var.environment
    CostCenter  = "OTMS-Platform"
    Owner       = "DevOps-Team"
  }
}
