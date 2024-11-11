variable "eks-private-subnet" {
  type    = list(string)
  default = ["10.0.0.0/19", "10.0.32.0/19", "10.0.64.0/24"]
}

variable "eks-public-subnet" {
  type    = list(string)
  default = ["10.0.96.0/19", "10.0.128.0/19", "10.0.160.0/24"]
}

variable "ap-southeast-1-azs" {
  description = "availability_zone"
  type        = list(string)
  default     = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
}