resource "aws_default_route_table" "ciclic_public_route_table" {
  default_route_table_id = "${aws_vpc.ciclic_vpc.default_route_table_id}"

  tags {
    Name = "public-route-table"
  }
}

resource "aws_route" "ciclic_public_route" {
  route_table_id         = "${aws_vpc.ciclic_vpc.default_route_table_id}"
  destination_cidr_block = "${var.all_ips}"
  gateway_id             = "${aws_internet_gateway.ciclic_internet_gateway.id}"
}

resource "aws_route" "ciclic_public-vpn" {
  route_table_id         = "${aws_vpc.ciclic_vpc.default_route_table_id}"
  depends_on             = ["aws_vpn_gateway.ciclic_local_vpn_gateway"]
  destination_cidr_block = "${var.ciclic_cidr}"
  gateway_id             = "${aws_vpn_gateway.ciclic_local_vpn_gateway.id}"
}

resource "aws_route_table" "ciclic_nat_route_table" {
  vpc_id     = "${aws_vpc.ciclic_vpc.id}"
  depends_on = ["aws_internet_gateway.ciclic_internet_gateway"]

  tags {
    Name = "NAT"
  }
}

resource "aws_route" "ciclic_nat_route" {
  route_table_id         = "${aws_route_table.ciclic_nat_route_table.id}"
  depends_on             = ["aws_route_table.ciclic_nat_route_table"]
  destination_cidr_block = "${var.all_ips}"
  nat_gateway_id         = "${aws_nat_gateway.ciclic_nat_gateway.id}"
}

resource "aws_route" "nat-vpn" {
  route_table_id         = "${aws_route_table.ciclic_nat_route_table.id}"
  depends_on             = ["aws_route_table.ciclic_nat_route_table", "aws_vpn_gateway.ciclic_local_vpn_gateway"]
  destination_cidr_block = "${var.ciclic_cidr}"
  gateway_id             = "${aws_vpn_gateway.ciclic_local_vpn_gateway.id}"
}

resource "aws_route_table_association" "nat_conectivity" {
  subnet_id      = "${aws_subnet.ciclic_connectivity_subnet.id}"
  route_table_id = "${aws_default_route_table.ciclic_public_route_table.id}"
}

resource "aws_route_table_association" "nat_aplication" {
  subnet_id      = "${aws_subnet.ciclic_aplication_subnet.id}"
  route_table_id = "${aws_route_table.ciclic_nat_route_table.id}"
}

resource "aws_route_table_association" "nat_operation" {
  subnet_id      = "${aws_subnet.ciclic_operation_subnet.id}"
  route_table_id = "${aws_route_table.ciclic_nat_route_table.id}"
}

resource "aws_route_table_association" "nat_database" {
  subnet_id      = "${aws_subnet.ciclic_database_subnet.id}"
  route_table_id = "${aws_route_table.ciclic_nat_route_table.id}"
}

resource "aws_route_table_association" "nat_repository" {
  subnet_id      = "${aws_subnet.ciclic_repository_subnet.id}"
  route_table_id = "${aws_route_table.ciclic_nat_route_table.id}"
}

resource "aws_route_table_association" "nat_services" {
  subnet_id      = "${aws_subnet.ciclic_services_subnet.id}"
  route_table_id = "${aws_route_table.ciclic_nat_route_table.id}"
}
