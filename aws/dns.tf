#
# We only execute the 'aws-dns' module if the variable 'aws_dns_apply_records'
# is set to 'true'. It is set to 'false' by default.
#
# The module 'aws-dns' is instantiated conditionally, predicated both, on
# the existence of elements in the map 'local.dns_records', as well as the
# variable 'aws_dns_apply_records' being 'true'. The latter exists as a
# simple means to disable 'DNS' operations, without having to empty out
# the map 'local.dns_records'.
#
# In summary, the module 'aws-dns' executes and creates 'DNS' records, if
# the the following expression holds during the module instantiation:
#
#   length(local.dns_records) > 0 && var.aws_dns_apply_records != false
#
module "aws-dns" {
  source = "../modules/aws-dns"

  for_each = var.aws_dns_apply_records ? local.dns_records : {}

  aws_dns_hosted_zone_id = var.aws_dns_hosted_zone_id
  aws_vpc_id = module.aws-vpc.aws_vpc_id

  ipv4_address = each.value.ipv4_address
  dns_node = each.value.dns_node
  dns_name = each.value.dns_name
  dns_tld = var.dns_tld
}
