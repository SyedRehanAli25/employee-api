resource "aws_autoscaling_policy" "notification_service_cpu" {
  name                   = local.cpu_policy_name
  autoscaling_group_name = data.terraform_remote_state.asg.outputs.asg_name
  policy_type            = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = var.target_cpu_value
  }
}
