resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "private_a" {
  vpc_id               = aws_vpc.main.id
  availability_zone_id = local.workspaces_az_ids[0]
  cidr_block           = "10.0.1.0/24"
}

resource "aws_subnet" "private_b" {
  vpc_id               = aws_vpc.main.id
  availability_zone_id = local.workspaces_az_ids[1]
  cidr_block           = "10.0.2.0/24"
}
