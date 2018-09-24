data "aws_subnet" "ciclic_aplication_subnet" {
  filter {
    name   = "tag:Name"
    values = ["ciclic-aplication-subnet"]
  }
}

data "aws_subnet" "ciclic_aplication_subnet_b" {
  filter {
    name   = "tag:Name"
    values = ["ciclic-aplication-subnet-b"]
  }
}

data "aws_subnet" "ciclic_operation_subnet" {
  filter {
    name   = "tag:Name"
    values = ["ciclic-operation-subnet"]
  }
}

data "aws_subnet" "ciclic_connectivity_subnet" {
  filter {
    name   = "tag:Name"
    values = ["ciclic-connectivity-subnet"]
  }
}

data "aws_subnet" "ciclic_database_subnet" {
  filter {
    name   = "tag:Name"
    values = ["ciclic-database-subnet"]
  }
}

data "aws_vpc" "ciclic_vpc" {
  filter {
    name   = "tag:Name"
    values = ["ciclic-vpc"]
  }
}

data "aws_security_group" "ciclic_public_access_group" {
  filter {
    name   = "tag:Name"
    values = ["public-access"]
  }
}

data "aws_security_group" "ciclic_private_access_group" {
  filter {
    name   = "tag:Name"
    values = ["private-access"]
  }
}
