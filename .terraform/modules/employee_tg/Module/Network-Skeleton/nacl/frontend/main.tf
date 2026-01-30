resource "aws_network_acl" "this" {
  vpc_id     = var.vpc_id
  subnet_ids = [var.subnet_id]

  ingress {
    rule_no    = 50
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    cidr_block = var.bastion_cidr
    action     = "allow"
  }

  ingress {
    rule_no    = 100
    protocol   = "tcp"
    from_port  = 80
    to_port    = 80
    cidr_block = var.alb_cidr
    action     = "allow"
  }

  ingress {
    rule_no    = 110
    protocol   = "tcp"
    from_port  = 443
    to_port    = 443
    cidr_block = var.alb_cidr
    action     = "allow"
  }

  ingress {
    rule_no    = 200
    protocol   = "tcp"
    from_port  = 1024
    to_port    = 65535
    cidr_block = var.alb_cidr
    action     = "allow"
  }

  egress {
    rule_no    = 100
    protocol   = "-1"
    from_port  = 0
    to_port    = 0
    cidr_block = var.backend_cidr
    action     = "allow"
  }

  tags = merge(local.tags, {
    Name = "${local.name_prefix}-frontend-nacl"
  })
}

