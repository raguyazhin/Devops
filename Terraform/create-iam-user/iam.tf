resource "aws_instance" "ec2-terraform" {
  ami           = "ami-002068ed284fb165b"
  instance_type = "t2.micro"
  tags = {
    Name = "Terraform Instance"
  }
}

resource "aws_iam_user" "adminuser"{
    name = var.username
}

