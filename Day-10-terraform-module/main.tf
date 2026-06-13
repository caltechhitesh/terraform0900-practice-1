resource "aws_instance" "name" {
    ami = "ami-0152204c1a187337c"
    instance_type = "t3.micro"
    tags = {
        Name = "ec2"
    }
}
resource "aws_s3_bucket" "name" {
    bucket = "hbbguskow"

}

resource "aws_s3_bucket_versioning" "name" {
  bucket = aws_s3_bucket.name.id
  versioning_configuration {
    status = "Suspended"
  }
}
