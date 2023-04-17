variable "dns_name" {
  description = "The 'DNS' name that will be registered under the top-level domain configured for this module."
  type = string
}

variable "dns_node" {
  description = "This could be e.g., a top-level domain, under which this module will register the provided 'DNS' name."
  type = string
}

variable "ipv4_address" {
  description = "The WAN-facing 'IPv4' address that will be used to create the 'A' record."
  type = string
}

variable "aws_vpc_id" {
  description = "The ID of the 'Virtual Private Cloud' where the hosted zone is located."
  type = string
}

variable "aws_dns_hosted_zone_id" {
  description = "The 'Route 53' hosted zone to which we are adding the 'A' record."
  type = string
}

variable "dns_tld" {
  description = ""
  type = string
}
