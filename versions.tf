terraform {
  required_providers {
    tailscale = {
      source  = "tailscale/tailscale"
      version = "0.13.6"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "5.4.0"
    }
  }
}
