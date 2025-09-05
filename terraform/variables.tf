variable "aws_region" {
  description = "AWS region"
  default     = "eu-north-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t3.micro"
}


variable "key_name" {
  description = "Name of the AWS key pair to use for SSH access"
}
