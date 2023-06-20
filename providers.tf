provider "tailscale" {
  tailnet = var.tailnet
  scopes  = ["read:all"]
}

provider "aws" {
  region = "us-east-1"
}
