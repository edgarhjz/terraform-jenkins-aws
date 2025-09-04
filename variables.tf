variable "aws_region" {
  type = string
  description = "AWS region"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  type = string
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
  
}

variable "subnet_cidr" {
  type = string
  description = "CIDR block for the subnet"
  default     = "10.0.0.1/24"
}

variable "ami_id" {
  type = string
  description = "AMI ID for the instance"
  default     = "ami-0360c520857e3138f"
}

variable "instance_type" {
  type = string
  description = "Instance type"
  default     = "c7i-flex.large"
}
