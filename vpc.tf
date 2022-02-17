resource "aws_vpc" "main" {
  count      = var.create_vpc ? 1 : 0
  cidr_block = var.create_vpc_cidr
}

resource "aws_subnet" "private_a" {
  count                = var.create_vpc ? 1 : 0
  vpc_id               = aws_vpc.main[0].id
  availability_zone_id = local.workspaces_az_ids[0]
  cidr_block           = var.create_vpc_subnet_a
}

resource "aws_subnet" "private_b" {
  count                = var.create_vpc ? 1 : 0
  vpc_id               = aws_vpc.main[0].id
  availability_zone_id = local.workspaces_az_ids[1]
  cidr_block           = var.create_vpc_subnet_b
}
