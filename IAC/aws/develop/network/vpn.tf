resource "aws_vpn_connection" "ciclic_vpn_connection" {
  vpn_gateway_id        = "${aws_vpn_gateway.ciclic_local_vpn_gateway.id}"
  customer_gateway_id   = "${aws_customer_gateway.ciclic_remote_vpn_gateway.id}"
  type                  = "ipsec.1"
  static_routes_only    = true
  tunnel1_preshared_key = "z1HyvSpKJJW2FbQzw4rgScj1pT6u8eWD"

  tags {
    Name = "ciclic-vpn-connection"
  }
}

resource "aws_vpn_connection_route" "ciclic_vpn_connection_route" {
  destination_cidr_block = "${var.ciclic_cidr}"
  vpn_connection_id      = "${aws_vpn_connection.ciclic_vpn_connection.id}"
}
