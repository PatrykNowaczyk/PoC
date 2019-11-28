provider "aws" {
  region = "eu-west-3"
}

resource "aws_instance" "example" {
  ami           = "ami-01ed306a12b7d1c96"
  instance_type = "t2.micro"
}