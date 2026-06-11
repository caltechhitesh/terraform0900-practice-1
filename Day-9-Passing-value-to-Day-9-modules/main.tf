module "dev"{
   source = "../Day-9-Modules"
   instance_type = "t2.micro"
   ami_id = "ami-00e801948462f718a"
   name = "dev-instance"
  

}