
data "aws_subnet" "example" {
  filter {
    name   = "tag:Name"
    values = ["hitesh-subnet"]
  }
}

data "aws_security_group" "sg" {
  filter {
    name   = "group-name"
    values = ["test-security-group"]
  }

  filter {
    name   = "vpc-id"
    values = ["vpc-012afb1cbe9b026da"]
  }
}


resource "aws_instance" "name" {
    ami           = "ami-0152204c1a187337c"     
    instance_type = "t2.medium"
    subnet_id = data.aws_subnet.example.id #use the id of the fetched subnet
    vpc_security_group_ids = [data.aws_security_group.sg.id] #use the id of the created security group
    tags = {
        Name = "kajol-instance"
    }

}