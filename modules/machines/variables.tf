variable "ami_id" {
  type        = string
  description = "AMI ID for the instance"
}

variable "instance_type" {
  type        = string
  description = "Instance type"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID where the instance will be deployed"
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of security group IDs"
}

variable "key_name" {
  type        = string
  description = "Key pair name for SSH access"
}

variable "user_data" {
  type        = string
  description = "User data script for the instance"
}
