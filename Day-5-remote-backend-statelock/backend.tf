terraform {
  backend "s3" {
    bucket = "statefilemax"
    key    = "terraform.tfstate"
    use_lockfile =true  #s3 native locking to prevent concurrent state modifications
    region = "us-east-1"
  }
}

# Terraform acquires a state lock to protect the state from being written by multiple users at the same time. Please resolve the issue above and try again. For most commands, 
#you can disable locking with the "-lock=false" flag, but this is not recommended.