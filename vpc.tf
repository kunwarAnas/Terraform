resource "aws_default_vpc" "default_vpc" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_default_vpc.default_vpc.id
  cidr_block        = "172.31.16.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "tf-example"
  }
}