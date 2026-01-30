provider "aws" {
  region = var.aws_region
}

resource "aws_launch_template" "notification_service" {
  name_prefix   = local.launch_template_name_prefix
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [
    data.terraform_remote_state.sg.outputs.security_group_id
  ]

  tag_specifications {
    resource_type = "instance"

    tags = merge(
      {
        Name = local.instance_name
      },
      local.common_tags
    )
  }
}
