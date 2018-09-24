resource "aws_default_network_acl" "default" {
  default_network_acl_id = "${aws_vpc.ciclic_vpc.default_network_acl_id}"

  tags {
    Name = "default-acl"
  }

  ingress = {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "${var.all_ips}"
    from_port  = 0
    to_port    = 0
  }

  ingress = {
    protocol        = -1
    rule_no         = 101
    action          = "allow"
    ipv6_cidr_block = "::/0"
    from_port       = 0
    to_port         = 0
  }

  egress = {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "${var.all_ips}"
    from_port  = 0
    to_port    = 0
  }

  egress = {
    protocol        = -1
    rule_no         = 101
    action          = "allow"
    ipv6_cidr_block = "::/0"
    from_port       = 0
    to_port         = 0
  }
}
