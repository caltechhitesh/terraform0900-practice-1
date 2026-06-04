terraform {
  backend "s3" {
    bucket = "statefilemax"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
