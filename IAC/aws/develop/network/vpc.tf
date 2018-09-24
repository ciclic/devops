resource "aws_vpc" "ciclic_vpc" {
  cidr_block                       = "${ var.vpc_cidr }"
  enable_dns_hostnames             = true
  enable_dns_support               = true
  assign_generated_ipv6_cidr_block = true

  tags {
    Name = "ciclic-vpc"
  }
}
