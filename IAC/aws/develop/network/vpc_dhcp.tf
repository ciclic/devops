resource "aws_default_vpc_dhcp_options" "default" {
  tags {
    Name = "default-vpc-dhcp-options"
  }
}
