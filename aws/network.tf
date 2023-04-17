module "aws-vpc" {
    source = "../modules/aws-vpc"

    aws_private_net = var.aws_private_net
    aws_private_subnet = var.aws_private_subnet
    aws_private_subnet_availability_zone = data.aws_availability_zones.this.names[0]
}
