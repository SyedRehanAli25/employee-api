resource "aws_network_acl" "this" {
  vpc_id     = var.vpc_id
  subnet_ids = [var.subnet_id]

  # --------------------------------------------------
  # SSH from Bastion (break-glass)
  # --------------------------------------------------
  ingress {
    rule_no    = 50
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    cidr_block = var.bastion_cidr
    action     = "allow"
  }

  # --------------------------------------------------
  # Backend → Redis
  # --------------------------------------------------
  ingress {
    rule_no    = 100
    protocol   = "tcp"
    from_port  = 6379
    to_port    = 6379
    cidr_block = var.backend_cidr
    action     = "allow"
  }

  # --------------------------------------------------
  # Ephemeral inbound (SSM + responses)
  # --------------------------------------------------
  ingress {
    rule_no    = 200
    protocol   = "tcp"
    from_port  = 1024
    to_port    = 65535
    cidr_block = var.vpc_cidr
    action     = "allow"
  }

  # --------------------------------------------------
  # Middleware → SSM Endpoint (HTTPS)
  # --------------------------------------------------
  egress {
    rule_no    = 60
    protocol   = "tcp"
    from_port  = 443
    to_port    = 443
    cidr_block = var.vpc_cidr
    action     = "allow"
  }

  # --------------------------------------------------
  # Middleware → Backend responses
  # --------------------------------------------------
  egress {
    rule_no    = 100
    protocol   = "-1"
    from_port  = 0
    to_port    = 0
    cidr_block = var.backend_cidr
    action     = "allow"
  }

  # --------------------------------------------------
  # SSH response back to Bastion
  # --------------------------------------------------
  egress {
    rule_no    = 200
    protocol   = "tcp"
    from_port  = 1024
    to_port    = 65535
    cidr_block = var.bastion_cidr
    action     = "allow"
  }

  tags = merge(local.tags, {
    Name = "${local.name_prefix}-middleware-nacl"
  })
}

