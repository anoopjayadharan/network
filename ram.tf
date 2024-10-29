# Creates a Resource Access Manager (RAM) Resource Share
resource "aws_ram_resource_share" "subnet_share" {
  name = var.ram_name
  tags = local.tags
}
# Associates Private Subnets to RAM
resource "aws_ram_resource_association" "private_subnets" {
  count              = length(var.private_subnet_cidr)
  resource_arn       = aws_subnet.private[count.index].arn
  resource_share_arn = aws_ram_resource_share.subnet_share.arn
}

# Associates Public Subnets to RAM
resource "aws_ram_resource_association" "public_subnets" {
  count              = length(var.public_subnet_cidr)
  resource_arn       = aws_subnet.public[count.index].arn
  resource_share_arn = aws_ram_resource_share.subnet_share.arn
}

# Share resources to Sandbox OU
resource "aws_ram_principal_association" "ram_principal_association" {
  principal          = var.ou_arn
  resource_share_arn = aws_ram_resource_share.subnet_share.arn
}
