variable "aws_access_key" {
  description = "AWS access key"
  type = string
  sensitive = true
}

variable "aws_secret_key" {
  description = "AWS secret access key"
  type = string
  sensitive = true
}

variable "aws_token" {
  description = "AWS session token"
  type = string
  sensitive = true
}