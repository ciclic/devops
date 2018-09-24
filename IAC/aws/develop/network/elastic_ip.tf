#EIP NAT GATEWAY

resource "aws_eip" "ciclic_nat_eip" {
  vpc        = true
  depends_on = ["aws_internet_gateway.ciclic_internet_gateway"]

  tags {
    Name = "ciclic-nat-eip"
  }
}
