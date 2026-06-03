resource "aws_instance" "name" {
    ami           = var.ami_id     
    instance_type = "t2.medium"

    tags = {
        Name = "my-ec2-instance"
    }
}

