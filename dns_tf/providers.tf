provider "tailscale" {
  tailnet = var.tailnet
  scopes  = ["read:devices"]
}

provider "aws" {
  region = "us-east-1"
}
