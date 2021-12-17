resource "aws_instance" "myinstance" {
  ami           = "ami-002068ed284fb165b"
  instance_type = "t2.micro"
  tags = {
    Name = "myinstance"
  }
}

resource "aws_eip" "myeip" {
  vpc = true
}

resource "aws_eip_association" "myeip_association" {
  instance_id   = aws_instance.myinstance.id
  allocation_id = aws_eip.myeip.id
}

resource "aws_security_group" "allow_eip" {
  name = "ragu_terra_sg"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.myeip.public_ip}/32"]
  }
  lifecycle {
    #create_before_destroy = true
    prevent_destroy = false
  }
}