resource "aws_s3_bucket" "terraform-bucket" {
  bucket = "terraform-bucket-patryk"
  acl    = "private"
  
  tags = {
    Name = "Terraform state"
  }
}