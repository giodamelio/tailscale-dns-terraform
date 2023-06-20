terraform {
  backend "s3" {
    bucket = "terraform-state-gio-ninja"
    key    = "state"
    region = "us-west-2"
  }

  required_providers {
    tailscale = {
      source  = "tailscale/tailscale"
      version = "0.13.7"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "5.4.0"
    }
  }
}
