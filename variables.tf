variable "region" {}
variable "az" {
  description = "List of Availability Zones"
}
variable "vpc_name" {}
variable "private_subnet_name" {}
variable "public_subnet_name" {}
variable "igw_name" {}
variable "private_rt_name" {}
variable "public_rt_name" {}
variable "cidr" {
  description = "VPC CIDR Block"
}
variable "private_subnet_cidr" {
  description = "Private Subnets CIDR"
}
variable "public_subnet_cidr" {
  description = "Public Subnets CIDR"
}
variable "environment" {
  description = "Name of the environment."
  type        = string
}
variable "project_name" {
  description = "Name of the project."
  type        = string
}
variable "resource_tags" {
  description = "Tags to set for all resources"
  type        = map(string)
  default     = {}
}
variable "ram_name" {
  description = "Name of the RAM Share"
}
variable "ou_arn" {
  description = "ARN for Sandbox OU"
}
