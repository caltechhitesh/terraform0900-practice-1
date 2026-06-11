
resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/16"
tags = {
    Name = "hitesh-vpc"
  }
}

resource "aws_instance" "name" {
  ami = "ami-0152204c1a187337c"
  instance_type = "t2.medium"
  vpc_security_group_ids = [aws_security_group.name.id]
}

resource "aws_security_group" "name" {
  name = "test-security-group"
  description = "Security group for test instance"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}

}

resource "aws_subnet" "name" {
  vpc_id = aws_vpc.name.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "hitesh-subnet"
  }
}
