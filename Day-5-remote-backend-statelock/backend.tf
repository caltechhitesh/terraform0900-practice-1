terraform {
  backend "s3" {
    bucket = "statefilemax"
    key    = "terraform.tfstate"
    use_lockfile =true  #s3 native locking to prevent concurrent state modifications
    region = "us-east-1"
  }
}
