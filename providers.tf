provider "tailscale" {
  tailnet = var.tailnet
}

provider "aws" {
  region = "us-east-1"
}
