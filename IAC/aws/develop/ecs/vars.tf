# main creds for AWS connection
variable "aws_profile" {
  description = "Default Terraform Profile"
  default     = "terraform"
}

variable "ecs_cluster" {
  description = "ECS cluster name"
  default     = "cluster"
}

variable "aws_region" {
  description = "Deploy region"
  default     = "us-east-1"
}

variable "availability_zone" {
  description = "availability zone used for the demo, based on region"

  default = {
    us-east-1 = "us-east-1"
  }
}

########################### Autoscale Config ################################

variable "max_instance_size" {
  description = "Maximum number of instances in the cluster"
  default     = "2"
}

variable "min_instance_size" {
  description = "Minimum number of instances in the cluster"
  default     = "2"
}

variable "desired_capacity" {
  description = "Desired number of instances in the cluster"
  default     = "2"
}
