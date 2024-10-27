variable "region" {
  default = "eu-west-1"
}
variable "az" {
  description = "List of Availability Zones"
  default     = ["eu-west-1a", "eu-west-1b"]
}
variable "cidr" {
  description = "VPC CIDR Block"
  default     = "172.25.0.0/16"
}
variable "private_subnet_cidr" {
  description = "Private Subnets CIDR"
  default     = ["172.25.52.0/24", "172.25.54.0/24"]
}
variable "public_subnet_cidr" {
  description = "Public Subnets CIDR"
  default     = ["172.25.62.0/24", "172.25.64.0/24"]
}
variable "environment" {
  description = "Name of the environment."
  type        = string
  default     = "network"
}
variable "project_name" {
  description = "Name of the project."
  type        = string
  default     = "cloudTalents"
}
variable "resource_tags" {
  description = "Tags to set for all resources"
  type        = map(string)
  default     = {}
}