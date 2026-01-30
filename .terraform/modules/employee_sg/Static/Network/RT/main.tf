#Public Route Table (IGW)
resource "aws_route_table" "public_rt" {
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = data.terraform_remote_state.igw.outputs.igw_id
  }

  tags = merge(local.common_tags, {
    Name = local.public_rt_name
  })
}

#Public Subnet Associations
resource "aws_route_table_association" "public_subnet_1" {
  subnet_id      = data.terraform_remote_state.subnets.outputs.public_subnet_1_id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_subnet_2" {
  subnet_id      = data.terraform_remote_state.subnets.outputs.public_subnet_2_id
  route_table_id = aws_route_table.public_rt.id
}

#Private Route Table (NAT)
resource "aws_route_table" "private_rt" {
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = data.terraform_remote_state.nat.outputs.nat_gateway_id
  }

  tags = merge(local.common_tags, {
    Name = local.private_rt_name
  })
}

#Private Subnet Associations
resource "aws_route_table_association" "frontend_subnet" {
  subnet_id      = data.terraform_remote_state.subnets.outputs.frontend_subnet_id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "backend_subnet" {
  subnet_id      = data.terraform_remote_state.subnets.outputs.backend_subnet_id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "database_subnet" {
  subnet_id      = data.terraform_remote_state.subnets.outputs.database_subnet_id
  route_table_id = aws_route_table.private_rt.id
}
