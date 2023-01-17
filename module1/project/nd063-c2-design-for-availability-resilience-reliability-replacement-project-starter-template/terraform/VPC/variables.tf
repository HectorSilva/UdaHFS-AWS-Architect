variable "vpc_cidr" {
  description = "The VPC CIDR block"
  type = string
  default = "10.1.0.0/16"
  sensitive = false
  nullable = false
}

variable "public_subnet1_cidr" {
  description = "The public subnet 2 CIDR block"
  type = string
  default = "10.1.10.0/24"
  sensitive = false
  nullable = false
}

variable "public_subnet2_cidr" {
  description = "The public subnet 2 CIDR block"
  type = string
  default = "10.1.11.0/24"
  sensitive = false
  nullable = false
}

variable "private_subnet1_cidr" {
  description = "The private subnet 1 CIDR block"
  type = string
  default = "10.1.20.0/24"
  sensitive = false
  nullable = false
}

variable "private_subnet2_cidr" {
  description = "The private subnet 2 CIDR block"
  type = string
  default = "10.1.21.0/24"
  sensitive = false
  nullable = false
}


