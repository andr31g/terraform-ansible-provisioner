data "aws_route53_zone" "this" {
  zone_id = var.aws_dns_hosted_zone_id
  vpc_id = var.aws_vpc_id
}

resource "aws_route53_record" "A" {
  zone_id = data.aws_route53_zone.this.zone_id
  records = [var.ipv4_address]
  name = join(".", [var.dns_name], [data.aws_route53_zone.this.name])
  type = "A"
  ttl = 300
}
