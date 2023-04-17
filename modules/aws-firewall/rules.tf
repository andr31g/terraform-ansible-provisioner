resource "aws_security_group" "this" {
    vpc_id = var.aws_vpc_id

    name = "netfilter-ruleset0"
    description = "egress: ALL, ingress: SSH, HTTPS"

    egress = [
        {
            description = "Full egress allowed"
            cidr_blocks = [var.cidr_shortest_match]
            protocol = -1
            from_port = 0
            to_port = 0
            prefix_list_ids = null
            ipv6_cidr_blocks = null
            security_groups = null
            self = false
        }
    ]

    ingress = [
        {
            description = "SSH"
            cidr_blocks = [var.allowed_host]
            protocol = "tcp"
            from_port = 22
            to_port = 22
            prefix_list_ids = null
            ipv6_cidr_blocks = null
            security_groups = null
            self = false
        },
        {
            description = "HTTPS"
            cidr_blocks = [var.allowed_host]
            protocol = "tcp"
            from_port = 443
            to_port = 443
            prefix_list_ids = null
            ipv6_cidr_blocks = null
            security_groups = null
            self = false
        }
    ]
}
