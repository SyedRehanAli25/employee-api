# Public Subnet 1
resource "aws_subnet" "public_1" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.public_subnet_1_cidr
  availability_zone       = var.public_subnet_1_az
  map_public_ip_on_launch = true

  tags = merge(local.tags, {
    Name = "${local.name_prefix}-Public-Subnet-01"
  })
}

# Public Subnet 2
resource "aws_subnet" "public_2" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.public_subnet_2_cidr
  availability_zone       = var.public_subnet_2_az
  map_public_ip_on_launch = true

  tags = merge(local.tags, {
    Name = "${local.name_prefix}-Public-Subnet-02"
  })
}

# Frontend Subnet
resource "aws_subnet" "frontend" {
  vpc_id            = var.vpc_id
  cidr_block        = var.frontend_subnet_cidr
  availability_zone = var.frontend_subnet_az

  tags = merge(local.tags, {
    Name = "${local.name_prefix}-Frontend-Subnet"
  })
}

# Backend Subnet
resource "aws_subnet" "backend" {
  vpc_id            = var.vpc_id
  cidr_block        = var.backend_subnet_cidr
  availability_zone = var.backend_subnet_az

  tags = merge(local.tags, {
    Name = "${local.name_prefix}-Backend-Subnet"
  })
}

# Database Subnet
resource "aws_subnet" "database" {
  vpc_id            = var.vpc_id
  cidr_block        = var.database_subnet_cidr
  availability_zone = var.database_subnet_az

  tags = merge(local.tags, {
    Name = "${local.name_prefix}-Database-Subnet"
  })
}

# Middleware Subnet
resource "aws_subnet" "middleware" {
  vpc_id            = var.vpc_id
  cidr_block        = var.middleware_subnet_cidr
  availability_zone = var.middleware_subnet_az

  tags = merge(local.tags, {
    Name = "${local.name_prefix}-Middleware-Subnet"
  })
}

