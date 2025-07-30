variable "aws_region" {
  default = "us-east-2"
}

variable "ami_id" {
  description = "Amazon Linux 2 AMI (HVM), SSD Volume Type"
  default     = "ami-04505e74c0741db8d" # Change if using another region
}

variable "public_key_path" {
  description = "Path to the public SSH key"
  default     = "~/.ssh/gitlabkey.pub"
}