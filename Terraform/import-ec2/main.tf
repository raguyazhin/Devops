resource "aws_instance" "jenkins-server" {
    ami = "ami-002068ed284fb165b"
    instance_type = "t2.small"
    vpc_security_group_ids = ["sg-052dfc436a83e40d4","sg-1e3cac56"]
    key_name = "devops-ragu-kp"
    subnet_id = "subnet-ea6da997"

    tags = {
        "Name" = "Jenkins Server"
    }
}