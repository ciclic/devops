resource "aws_lb" "lb_ecs" {
  name                       = "test-lb-tf"
  internal                   = false
  load_balancer_type         = "network"
  subnets                    = ["${aws_subnet.subnet-B-public.id}" , "${aws_subnet.subnet-C-public.id}"]
  enable_deletion_protection = false
  tags {
    Environment = "production"
  }
}

resource "aws_lb_listener" "example" {
  load_balancer_arn = "${aws_lb.lb_ecs.arn}"
  port              = "27017"
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.target_lb_ecs.arn}"
  }
}

resource "aws_lb_target_group" "target_lb_ecs" {
  name     = "lb-ecs-prod"
  port     = 27017
  protocol = "TCP"
  vpc_id   = "${aws_vpc.ciclic_prod_vpc.id}"
}

