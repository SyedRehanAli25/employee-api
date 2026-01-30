output "nat_gateway_id" {
  description = "NAT Gateway ID"
  value       = aws_nat_gateway.this.id
}

output "nat_eip_id" {
  description = "Elastic IP ID for NAT Gateway"
  value       = aws_eip.this.id
}

output "nat_public_ip" {
  description = "Public IP address of NAT Gateway"
  value       = aws_eip.this.public_ip
}

