resource "aws_network_acl" "this" {
  vpc_id     = var.vpc_id
  subnet_ids = [var.subnet_id]

  # --------------------------------------------------
  # SSH from Bastion
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
  # SSM Endpoint → Database (HTTPS)
  # --------------------------------------------------
  ingress {
    rule_no    = 60
    protocol   = "tcp"
    from_port  = 443
    to_port    = 443
    cidr_block = var.vpc_cidr
    action     = "allow"
  }

  # --------------------------------------------------
  # PostgreSQL from Backend
  # --------------------------------------------------
  ingress {
    rule_no    = 100
    protocol   = "tcp"
    from_port  = 5432
    to_port    = 5432
    cidr_block = var.backend_cidr
    action     = "allow"
  }

  # --------------------------------------------------
  # ScyllaDB from Backend
  # --------------------------------------------------
  ingress {
    rule_no    = 110
    protocol   = "tcp"
    from_port  = 9042
    to_port    = 9042
    cidr_block = var.backend_cidr
    action     = "allow"
  }

  # --------------------------------------------------
  # Ephemeral inbound (responses)
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
  # Database → SSM Endpoint (HTTPS)
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
  # Database → SSM (ephemeral return)
  # --------------------------------------------------
  egress {
    rule_no    = 70
    protocol   = "tcp"
    from_port  = 1024
    to_port    = 65535
    cidr_block = var.vpc_cidr
    action     = "allow"
  }

  # --------------------------------------------------
  # Database → Backend responses
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
    Name = "${local.name_prefix}-database-nacl"
  })
}

