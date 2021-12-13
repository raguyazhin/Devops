resource "aws_instance" "ec2-terraform" {
  ami           = "ami-002068ed284fb165b"
  instance_type = var.instancetype
  tags = {
    Name = var.ec2_name
  }
}