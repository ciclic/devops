resource "aws_autoscaling_group" "ecs-autoscaling-group" {
  name                 = "ecs-autoscaling-group"
  max_size             = "${var.max_instance_size}"
  min_size             = "${var.min_instance_size}"
  desired_capacity     = "${var.desired_capacity}"
  vpc_zone_identifier  = ["${data.aws_subnet.ciclic_aplication_subnet.id}", "${data.aws_subnet.ciclic_aplication_subnet_b.id}"]
  launch_configuration = "${aws_launch_configuration.ecs-launch-configuration.name}"
  health_check_type    = "ELB"
}
