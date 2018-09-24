terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "ciclic-terraform-remote-state"
    dynamodb_table = "ciclic-terraform-state-lock-dynamo"
    region         = "${ var.aws_region }"
    profile        = "${ var.aws_profile }"
    key            = "network/terraform.tfstate"
  }
}
