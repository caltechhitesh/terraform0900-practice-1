module "test" {
  source = "../Day-9-Modules"
  instance_type = "t2.micro"
  name = "test-instance"
    ami_id = "ami-00e801948462f718a"

}