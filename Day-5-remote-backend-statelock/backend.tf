terraform {
  backend "s3" {
    bucket = "statefilemax"
    key    = "terraform.tfstate"
    dynamodb_table = "veera"
    encrypt = true
    #use_lockfile =true  #s3 native locking to prevent concurrent state modifications
    region = "us-east-1"
  }
}

#supports latest versin >=1.10
#<1.10 we can use dynamo for state locking as well, but s3 native locking is simpler to set up and manage, as it does not require an additional DynamoDB table. It also provides better performance and reliability, as it is built into the S3 service and does not rely on an external service for locking. However, if you need more advanced locking features or want to use a different backend that does not support native locking, then using DynamoDB for state locking may be a better option.
#state lockfile : Terraform acquire a state lock by creating a lock file in the S3 bucket. The lock file contains information about the lock, such as the ID of the lock holder and the time when the lock was acquired. When a user tries to acquire a lock, Terraform checks for the existence of the lock file and its contents to determine if the lock is available or if it is already held by another user. If the lock is available, Terraform creates the lock file and acquires the lock. If the lock is already held by another user, Terraform will wait until the lock is released before acquiring it.