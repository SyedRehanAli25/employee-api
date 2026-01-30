output "nat_gateway_id" {
  description = "NAT Gateway ID"
  value       = aws_nat_gateway.this.id
}

output "nat_gateway_eip" {
  description = "Elastic IP for NAT Gateway"
  value       = aws_eip.nat_eip.public_ip
}
