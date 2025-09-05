resource "aws_key_pair" "deployer" {
  key_name   = "tf-key"
  public_key = file("./key-pair/id_rsa.pub")
}

resource "aws_instance" "my-ec2" {
  ami                         = var.ami
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.my_subnet.id
  key_name                    = aws_key_pair.deployer.key_name
  vpc_security_group_ids      = [aws_security_group.ssh_access.id]
  associate_public_ip_address = true
  depends_on                  = [aws_security_group.ssh_access]
  tags = {
    Name        = "TF EC2"
    Environment = "Dev"
  }
}