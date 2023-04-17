module "aws-firweall" {
  source = "../modules/aws-firewall"

  aws_vpc_id = module.aws-vpc.aws_vpc_id
}
