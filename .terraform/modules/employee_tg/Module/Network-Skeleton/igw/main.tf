resource "aws_internet_gateway" "this" {
  vpc_id = var.vpc_id

  tags = merge(
    local.tags,
    {
      Name = "${local.name_prefix}-IGW"
    }
  )
}

