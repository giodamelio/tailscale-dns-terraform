terraform {
  backend "s3" {
    bucket = "terraform-state-gio-ninja"
    key    = "lambda-state"
    region = "us-west-2"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.4.0"
    }
  }
}
