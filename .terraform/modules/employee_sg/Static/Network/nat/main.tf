# Elastic IP for NAT Gateway
resource "aws_eip" "nat_eip" {
  domain = "vpc"

  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-eip"
  })
}

# NAT Gateway
resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = data.terraform_remote_state.subnets.outputs.public_subnet_1_id

  tags = merge(local.common_tags, {
    Name = local.name_prefix
  })

  depends_on = [aws_eip.nat_eip]
}
