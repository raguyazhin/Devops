resource "aws_instance" "ec2-terraform" {
  ami           = "ami-002068ed284fb165b"
  instance_type = var.instancetype
  key_name = "devops-ragu-kp"
  security_groups = ["ragu-devops-sg"]
  tags = {
    Name = var.ec2_name
  }
}