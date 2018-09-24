resource "aws_default_security_group" "ciclic_public_access_group" {
  vpc_id = "${aws_vpc.ciclic_vpc.id}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${var.all_ips}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${var.all_ips}"]
  }

  tags {
    Name = "public-access"
  }
}

resource "aws_security_group" "ciclic_private_access_group" {
  name        = "private-access"
  description = "Allow only private traffic"
  vpc_id      = "${aws_vpc.ciclic_vpc.id}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${var.ciclic_cidr}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${var.all_ips}"]
  }

  tags {
    Name = "private-access"
  }
}
