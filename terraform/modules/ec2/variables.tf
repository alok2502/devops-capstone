variable "app_name" {
  description = "Application name prefix"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID to deploy into"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID to deploy into"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2"
  type        = string
  default     = "ami-00de3875b03809ec5"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}
