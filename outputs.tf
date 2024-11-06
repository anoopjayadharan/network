output "vpc" {
  value = aws_vpc.vpc_europe.id
}
output "private_subnet" {
  value = aws_subnet.private[*].id
}
output "public_subnet" {
  value = aws_subnet.public[*].id
}