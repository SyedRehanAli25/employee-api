output "listener_rule_id" {
  description = "Listener rule ID"
  value       = aws_lb_listener_rule.this.id
}

output "listener_rule_arn" {
  description = "Listener rule ARN"
  value       = aws_lb_listener_rule.this.arn
}
