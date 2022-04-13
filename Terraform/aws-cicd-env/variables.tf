variable "aws_region" {
  description = "The AWS region to create resources"
  default     = "us-east-2"
}

variable "aws_profile" {
  description = "AWS Profile"
}

variable "stack" {
  description = "Stack Name"
  default     = "WorkShop"
}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default     = "172.17.0.0/16"
}

variable "az_count" {
  description = "No of AZs in given region"
  default     = "2"
}