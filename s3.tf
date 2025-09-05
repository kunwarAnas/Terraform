resource "aws_s3_bucket" "example" {
  bucket = "my-testing-tf-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

