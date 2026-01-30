resource "aws_security_group" "this" {
  name        = "${local.name_prefix}-${var.name}"
  description = var.description
  vpc_id      = var.vpc_id

  tags = merge(
    local.tags,
    {
      Name = "${local.name_prefix}-${var.name}"
    }
  )
}

# ------------------------------------------------
# Ingress rules - CIDR based
# ------------------------------------------------
resource "aws_security_group_rule" "ingress_cidr" {
  for_each = { for idx, rule in var.ingress_cidr_rules : idx => rule }

  type              = "ingress"
  security_group_id = aws_security_group.this.id
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = each.value.cidr_blocks
  description       = each.value.description
}

# ------------------------------------------------
# Ingress rules - Security Group based
# ------------------------------------------------
resource "aws_security_group_rule" "ingress_sg" {
  for_each = { for idx, rule in var.ingress_sg_rules : idx => rule }

  type                     = "ingress"
  security_group_id        = aws_security_group.this.id
  from_port                = each.value.from_port
  to_port                  = each.value.to_port
  protocol                 = each.value.protocol
  source_security_group_id = each.value.source_security_group_id
  description              = each.value.description
}

# ------------------------------------------------
# Egress rules
# ------------------------------------------------
resource "aws_security_group_rule" "egress" {
  for_each = { for idx, rule in var.egress_rules : idx => rule }

  type              = "egress"
  security_group_id = aws_security_group.this.id
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = each.value.cidr_blocks
  description       = each.value.description
}
