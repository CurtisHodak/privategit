variable "aws_region" {
  default = "us-east-2"
}

variable "ami_id" {
  description = "Amazon Linux 2 AMI (HVM), SSD Volume Type"
  default     = "ami-08ca1d1e465fbfe0c" # Change if using another region
}

variable "public_key" {
  description = "Path to the public SSH key"
  default     = ""
}