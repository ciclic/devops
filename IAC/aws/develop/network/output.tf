# VPC
output "ciclic_vpc_id" {
  value = "${aws_vpc.ciclic_vpc.id}"
}

# Subnets

output "ciclic_aplication_subnet_id" {
  value = "${aws_subnet.ciclic_aplication_subnet.id}"
}

output "ciclic_connectivity_subnet_id" {
  value = "${aws_subnet.ciclic_connectivity_subnet.id}"
}

output "ciclic_database_subnet_id" {
  value = "${aws_subnet.ciclic_database_subnet.id}"
}

output "ciclic_operation_subnet_id" {
  value = "${aws_subnet.ciclic_operation_subnet.id}"
}

output "ciclic_repository_subnet_id" {
  value = "${aws_subnet.ciclic_repository_subnet.id}"
}

output "ciclic_services_subnet_id" {
  value = "${aws_subnet.ciclic_services_subnet.id}"
}

# Access Groups

output "ciclic_private_access_group_id" {
  value = "${aws_security_group.ciclic_private_access_group.id}"
}

output "ciclic_public_access_group_id" {
  value = "${aws_default_security_group.ciclic_public_access_group.id}"
}
