resource "aws_vpc" "ciclic_prod_vpc" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_hostnames = true

  tags {
    Name          = "ciclic-vpc"
    Creation-Tool = "terraform"
    Env           = "production"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.ciclic_prod_vpc.id}"

  tags {
    Name          = "ciclic-igw"
    Creation-Tool = "terraform"
    Env           = "production"
  }
}

resource "" "" {}

resource "aws_subnet" "subnet-B-public" {
  vpc_id = "${aws_vpc.ciclic_prod_vpc.id}"

  cidr_block              = "${var.public_subnet_b_cidr}"
  availability_zone       = "${var.region}b"
  map_public_ip_on_launch = true

  tags {
    Name          = "ciclic Public Subnet B"
    Creation-Tool = "terraform"
    Env           = "production"
  }
}

resource "aws_subnet" "subnet-C-public" {
  vpc_id = "${aws_vpc.ciclic_prod_vpc.id}"

  cidr_block              = "${var.public_subnet_c_cidr}"
  availability_zone       = "${var.region}c"
  map_public_ip_on_launch = true

  tags {
    Name          = "ciclic Public Subnet C"
    Creation-Tool = "terraform"
    Env           = "production"
  }
}

resource "aws_route_table" "public-route-table" {
  vpc_id = "${aws_vpc.ciclic_prod_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags {
    Name          = "ciclic Public Route Table"
    Creation-Tool = "terraform"
    Env           = "production"
  }
}

resource "aws_route_table_association" "associate-public-subnet-B-route-table" {
  subnet_id      = "${aws_subnet.subnet-B-public.id}"
  route_table_id = "${aws_route_table.public-route-table.id}"
}

resource "aws_route_table_association" "associate-public-subnet-C-route-table" {
  subnet_id      = "${aws_subnet.subnet-C-public.id}"
  route_table_id = "${aws_route_table.public-route-table.id}"
}

resource "aws_subnet" "subnet-B-private" {
  vpc_id = "${aws_vpc.ciclic_prod_vpc.id}"

  cidr_block        = "${var.private_subnet_b_cidr}"
  availability_zone = "${var.region}b"

  tags {
    Name          = "ciclic Private Subnet B"
    Creation-Tool = "terraform"
    Env           = "production"
  }
}

resource "aws_subnet" "subnet-C-private" {
  vpc_id = "${aws_vpc.ciclic_prod_vpc.id}"

  cidr_block        = "${var.private_subnet_c_cidr}"
  availability_zone = "${var.region}c"

  tags {
    Name          = "ciclic Private Subnet C"
    Creation-Tool = "terraform"
    Env           = "production"
  }
}

resource "aws_route_table" "private-route-table-B" {
  vpc_id = "${aws_vpc.ciclic_prod_vpc.id}"

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.natgw-b.id}"
  }

  tags {
    Name          = "ciclic Private Subnet B"
    Creation-Tool = "terraform"
    Env           = "production"
  }
}

resource "aws_route_table" "private-route-table-C" {
  vpc_id = "${aws_vpc.ciclic_prod_vpc.id}"

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.natgw-c.id}"
  }

  tags {
    Name          = "ciclic Private Subnet C"
    Creation-Tool = "terraform"
    Env           = "production"
  }
}

resource "aws_route_table_association" "associate-private-subnet-B-route-table" {
  subnet_id      = "${aws_subnet.subnet-B-private.id}"
  route_table_id = "${aws_route_table.private-route-table-B.id}"
}

resource "aws_route_table_association" "associate-private-subnet-C-route-table" {
  subnet_id      = "${aws_subnet.subnet-C-private.id}"
  route_table_id = "${aws_route_table.private-route-table-C.id}"
}

resource "aws_nat_gateway" "natgw-b" {
  allocation_id = "${aws_eip.nat-b.id}"
  subnet_id     = "${aws_subnet.subnet-B-public.id}"
}

resource "aws_nat_gateway" "natgw-c" {
  allocation_id = "${aws_eip.nat-c.id}"
  subnet_id     = "${aws_subnet.subnet-C-public.id}"
}

resource "aws_eip" "nat-b" {
  vpc = true
}

resource "aws_eip" "nat-c" {
  vpc = true
}


