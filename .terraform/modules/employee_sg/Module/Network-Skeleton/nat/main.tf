resource "aws_eip" "this" {
  domain = "vpc"

  tags = merge(
    local.tags,
    {
      Name = "${local.name_prefix}-NAT-EIP"
    }
  )
}

resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.this.id
  subnet_id     = var.public_subnet_id

  tags = merge(
    local.tags,
    {
      Name = "${local.name_prefix}-NAT-GW"
    }
  )

  depends_on = [
    aws_eip.this
  ]
}

