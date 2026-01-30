output "security_group_id" {
  description = "Security Group ID"
  value       = aws_security_group.this.id
}

output "security_group_name" {
  description = "Security Group Name"
  value       = aws_security_group.this.name
}
