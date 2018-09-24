resource "aws_internet_gateway" "ciclic_internet_gateway" {
  vpc_id = "${aws_vpc.ciclic_vpc.id}"

  tags {
    Name = "ciclic-internet-gateway"
  }
}

resource "aws_nat_gateway" "ciclic_nat_gateway" {
  allocation_id = "${aws_eip.ciclic_nat_eip.id}"
  subnet_id     = "${aws_subnet.ciclic_connectivity_subnet.id}"
  depends_on    = ["aws_internet_gateway.ciclic_internet_gateway"]

  tags {
    Name = "ciclic-nat-gateway"
  }
}

resource "aws_customer_gateway" "ciclic_remote_vpn_gateway" {
  bgp_asn    = "65000"
  ip_address = "${var.ciclic_public_ip}"
  type       = "ipsec.1"

  tags {
    Name = "ciclic-remote-vpn"
  }
}

resource "aws_vpn_gateway" "ciclic_local_vpn_gateway" {
  vpc_id = "${aws_vpc.ciclic_vpc.id}"

  tags {
    Name = "ciclic-local-vpn-gateway"
  }
}
