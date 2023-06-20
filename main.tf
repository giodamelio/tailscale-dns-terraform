data "tailscale_devices" "all" {}

data "aws_route53_zone" "gio_ninja" {
  zone_id = var.route53_zone_id
}

locals {
  a_records = {
    for d in data.tailscale_devices.all.devices : trimsuffix(d.name, ".${var.tailnet_domain}") =>
    [
      for a in d.addresses : a
      if length(regexall("^(?:[0-9]{1,3}\\.){3}[0-9]{1,3}$", a)) > 0
    ]
  }
  aaaa_records = {
    for d in data.tailscale_devices.all.devices : trimsuffix(d.name, ".${var.tailnet_domain}") =>
    [
      for a in d.addresses : a
      if length(regexall("^([a-f0-9:]+:+)+[a-f0-9]+$", a)) > 0
    ]
  }
}

resource "aws_route53_record" "a_record" {
  for_each = local.a_records

  zone_id = var.route53_zone_id
  name    = "${each.key}.${data.aws_route53_zone.gio_ninja.name}"
  type    = "A"
  ttl     = 60
  records = each.value
}

resource "aws_route53_record" "aaaa_record" {
  for_each = local.aaaa_records

  zone_id = var.route53_zone_id
  name    = "${each.key}.${data.aws_route53_zone.gio_ninja.name}"
  type    = "AAAA"
  ttl     = 60
  records = each.value
}
