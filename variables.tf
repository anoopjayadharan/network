variable "region" {}
variable "az" {
  description = "List of Availability Zones"
}
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