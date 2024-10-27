provider "aws" {
  region = "eu-west-1"
}
locals {
  required_tags = {
    project     = var.project_name
    environment = var.environment
  }
  tags = merge(var.resource_tags, local.required_tags)
}
