variable "aws_access_key" {
}

variable "aws_secret_access_key" {
}

variable "ami" {
  default = "ami-0e9e6ba6d3d38faa8"
}
variable "path_to_private_key" {
  default = "Mykey"
}

variable "path_to_public_key" {
  default = "MyPubKey.pub"
}

variable "instance_username" {
  default = "ec2-user"
}
