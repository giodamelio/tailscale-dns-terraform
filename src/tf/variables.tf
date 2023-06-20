variable "tailnet" {
  type        = string
  description = "Tailnet name"
}

variable "tailnet_domain" {
  type        = string
  description = "The domain of your tailnet"
}

variable "route53_zone_id" {
  type        = string
  description = "The Zone ID of the zone that will be updated"
}
