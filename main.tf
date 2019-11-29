terraform {
  backend "s3" {
    bucket = "terraform-bucket-patryk"
    key    = "terraform.tfstate"
    region = "eu-west-3"
  }
}


provider "aws" {
  version = "~> 2.0"
  region     = "eu-west-3"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_access_key}"
}



resource "aws_instance" "WebServerInstance01" {
  ami           = var.ami
  instance_type = "t2.micro"
  key_name = "Mykey"
  user_data = file("${path.module}/Config/WebServer01.sh")
  depends_on = [aws_security_group.WebServer_linux]
  tags = {
           Name = "WebServerLinux01"
		   }
  vpc_security_group_ids = ["${aws_security_group.WebServer_linux.id}"]
  subnet_id = aws_subnet.main-public-1.id
}

resource "aws_instance" "WebServerInstance02" {
  ami           = var.ami
  instance_type = "t2.micro"
  key_name = "Mykey"
  user_data = file("${path.module}/Config/WebServer02.sh")
  depends_on = [aws_security_group.WebServer_linux]
  tags = {
           Name = "WebServerLinux02"
		   }
  vpc_security_group_ids = ["${aws_security_group.WebServer_linux.id}"]
  subnet_id = aws_subnet.main-public-2.id
}