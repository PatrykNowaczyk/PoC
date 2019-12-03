resource "aws_s3_bucket" "terraform-bucket" {
  bucket = "terraform-bucket-patryk"
  acl    = "private"
  region = "eu-west-3"
  tags = {
    Name = "Terraform state"
  }
}