resource "aws_subnet" "ciclic_connectivity_subnet" {
  vpc_id                  = "${aws_vpc.ciclic_vpc.id}"
  cidr_block              = "${var.connectivity_subnet_cidr}"
  map_public_ip_on_launch = true

  tags {
    Name = "ciclic-connectivity-subnet"
  }
}

resource "aws_subnet" "ciclic_aplication_subnet" {
  vpc_id            = "${aws_vpc.ciclic_vpc.id}"
  cidr_block        = "${var.aplication_subnet_cidr}"
  availability_zone = "${var.aws_region}d"

  tags {
    Name = "ciclic-aplication-subnet"
  }
}

resource "aws_subnet" "ciclic_aplication_subnet_b" {
  vpc_id            = "${aws_vpc.ciclic_vpc.id}"
  cidr_block        = "${var.aplication_subnet_b_cidr}"
  availability_zone = "${var.aws_region}b"

  tags {
    Name = "ciclic-aplication-subnet-b"
  }
}

resource "aws_subnet" "ciclic_operation_subnet" {
  vpc_id     = "${aws_vpc.ciclic_vpc.id}"
  cidr_block = "${var.operation_subnet_cidr}"

  tags {
    Name = "ciclic-operation-subnet"
  }
}

resource "aws_subnet" "ciclic_database_subnet" {
  vpc_id     = "${aws_vpc.ciclic_vpc.id}"
  cidr_block = "${var.database_subnet_cidr}"

  tags {
    Name = "ciclic-database-subnet"
  }
}

resource "aws_subnet" "ciclic_repository_subnet" {
  vpc_id     = "${aws_vpc.ciclic_vpc.id}"
  cidr_block = "${var.repository_subnet_cidr}"

  tags {
    Name = "ciclic-repository-subnet"
  }
}

resource "aws_subnet" "ciclic_services_subnet" {
  vpc_id     = "${aws_vpc.ciclic_vpc.id}"
  cidr_block = "${var.services_subnet_cidr}"

  tags {
    Name = "ciclic-services-subnet"
  }
}
