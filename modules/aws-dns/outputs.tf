output "instance_fqdn" {
  value = aws_route53_record.A.fqdn
}

output "nameservers" {
  value = data.aws_route53_zone.this.name_servers
}
