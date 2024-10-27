provider "aws" {
    region = "eu-west-1"
}
resource "aws_vpc" "test" {
  cidr_block = "172.25.0.0/16"
}