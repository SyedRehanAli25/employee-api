resource "aws_internet_gateway" "this" {
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  tags = merge(local.common_tags, {
    Name = local.name_prefix
  })
}
