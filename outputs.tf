output "employee_target_group_arn" {
  value = module.employee_tg.target_group_arn
}

output "employee_security_group_id" {
  value = module.employee_sg.security_group_id
}
