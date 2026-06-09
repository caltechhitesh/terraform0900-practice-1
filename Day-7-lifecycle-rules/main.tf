resource "aws_instance" "name" {

  ami           = "ami-0152204c1a187337c"
  instance_type = "t2.micro"

  tags = {
    Name = "shahrukh-instance"
  }

  lifecycle {
    create_before_destroy = true
    prevent_destroy       = false
    ignore_changes        = [tags]
  }

}