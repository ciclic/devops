variable "aws_profile" {
  description = "Default Terraform Profile"
  default     = "terraform"
}

variable "aws_region" {
  description = "Deploy region"
  default     = "us-east-1"
}
# ----------------------------------------------#
#                 VPC VARS                      #
# ----------------------------------------------#

# CIDR - CLASSLESS INTERN-DOMAIN ROUTING

variable "all_ips" {
  description = "CIDR Block for all IPS"
  default     = "0.0.0.0/0"
}

variable "ciclic_public_ip" {
  description = "Router Static public IP address"
  default     = "222.222.14.1"
}

variable "vpc_cidr" {
  description = "CIDR for the whole VPC"
  default     = "172.27.0.0/21"
}

variable "ciclic_cidr" {
  description = "CIDR for the CICLIC Internal Network"
  default     = "172.26.0.0/22"
}

# ----------------------------------------------#
#               SUBNETS VARS                    #
# ----------------------------------------------#

# CIDR - CLASSLESS INTERN-DOMAIN ROUTING

variable "connectivity_subnet_cidr" {
  description = "CIDR for the conectivity subnet"
  default     = "172.27.0.0/24"
}

variable "aplication_subnet_cidr" {
  description = "CIDR for the aplication subnet"
  default     = "172.27.1.0/24"
}

variable "operation_subnet_cidr" {
  description = "CIDR for the operation subnet"
  default     = "172.27.2.0/24"
}

variable "database_subnet_cidr" {
  description = "CIDR for the database subnet"
  default     = "172.27.3.0/24"
}

variable "repository_subnet_cidr" {
  description = "CIDR for the repository subnet"
  default     = "172.27.4.0/24"
}

variable "services_subnet_cidr" {
  description = "CIDR for the services subnet"
  default     = "172.27.5.0/24"
}
