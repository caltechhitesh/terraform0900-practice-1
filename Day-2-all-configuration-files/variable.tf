variable "ami_id" {
   type = string
   description = "The AMI ID to use for Ec2 Instance"
   default = "ami-00e801948462f718a"

}

variable "instance_type" {
    type = string
    description = "The type of instance to create"
    default     = "t2.medium"
}


variable "name" {
    type = string
    description = "The name of the resource"
    default     = "my-ec2-instance"
}
