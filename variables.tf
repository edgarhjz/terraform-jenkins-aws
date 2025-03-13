variable "aws_region" {
  type = string
  description = "AWS region"
  default     = "us-east-1"
}

variable "ami_id" {
  type = string
  description = "AMI ID for the instance"
  default     = "ami-05b10e08d247fb927"
}

variable "instance_type" {
  type = string
  description = "Instance type"
  default     = "t2.medium"
}
