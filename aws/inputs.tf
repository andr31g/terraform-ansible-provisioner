variable "aws_dns_hosted_zone_id" {
  type = string
}

variable "dns_tld" {
  type = string
}

variable "aws_dns_apply_records" {
  description = "This flag determines whether or not the module named 'aws-dns' will execute."
  default = false
  type = bool
}
