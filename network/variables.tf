variable "vpc_name" {
  type = string
}

variable "vpc_ip" {
  type = string
}

variable "AZ" {
  type    = list(string)
  default = ["value"]
}

variable "public_subnet" {
  type = list(string)
}

variable "private_subnet" {
  type = list(string)
}