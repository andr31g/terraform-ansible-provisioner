resource "aws_vpc" "this" {
    cidr_block = var.aws_private_net
    enable_dns_hostnames = var.aws_enable_dns_hostnames
}

resource "aws_subnet" "subnet0" {
    vpc_id = aws_vpc.this.id
    cidr_block = var.aws_private_subnet
    map_public_ip_on_launch = var.aws_map_public_ip_on_launch
    availability_zone = var.aws_private_subnet_availability_zone
}

resource "aws_internet_gateway" "this" {
    vpc_id = aws_vpc.this.id
}
