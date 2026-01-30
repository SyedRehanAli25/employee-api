output "security_group_id" {
  description = "Security group ID for notification-service"
  value       = aws_security_group.notification_service_sg.id
}

output "security_group_name" {
  value = aws_security_group.notification_service_sg.name
}
