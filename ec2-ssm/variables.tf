variable "aws_region" {
  type    = string
  default = "ap-southeast-1"
}

variable "ami_id" {
  type    = string
  default = "ami-0fd4144f52678fe37"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}


variable "existing_vpc" {
  type    = string
  default = "aaaaaaa"
}

variable "my_ip" {
  type = string
  default = "aaaaaaa"
}
