provider "aws" {
  profile     = "root"
  max_retries = 10
  version     = "~> 1.0"
  region = "us-east-1"
}

terraform {
  backend "s3" {
    profile = "root"
    bucket  = "ciclic.tfstate"
    key     = "platform/terraform.tfstate"
    region  = "us-east-1"
  }
}