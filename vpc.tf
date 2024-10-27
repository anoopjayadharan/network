# Creates vpc in the eu-west-1 region
resource "aws_vpc" "vpc_europe" {
  cidr_block = var.cidr
  tags       = local.tags
}

# Creates two Public Subnets
resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.vpc_europe.id
  count             = length(var.az)
  availability_zone = var.az[count.index]
  cidr_block        = element(var.public_subnet_cidr, count.index)

  tags = local.tags
}

# Creates two Private Subnets
resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.vpc_europe.id
  count             = length(var.az)
  availability_zone = var.az[count.index]
  cidr_block        = element(var.private_subnet_cidr, count.index)

  tags = local.tags
}

# Creates Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_europe.id

  tags = local.tags
}

# Creates route tables for public subnets
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc_europe.id
  count  = length(var.az)

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = local.tags
}

# Creates route tables for private subnets
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc_europe.id
  count  = length(var.az)

  tags = local.tags
}

# Route table association for public subnets
resource "aws_route_table_association" "public" {
  count = length(var.public_subnet_cidr)

  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = element(aws_route_table.public_rt.*.id, count.index)
}
# Route table association for private subnets
resource "aws_route_table_association" "private" {
  count = length(var.private_subnet_cidr)

  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = element(aws_route_table.private_rt.*.id, count.index)
}
