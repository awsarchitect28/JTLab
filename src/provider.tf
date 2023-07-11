provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "tf-s3-use1"
    key    = "state/terraform.tfstate"
    region = "us-east-1"
  }
}
