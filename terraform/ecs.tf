resource "aws_ecs_cluster" "cluster_ecs" {
  name = "cicli_production"
}

resource "aws_ecs_service" "mongo" {
  name            = "mongodb"
  cluster         = "${aws_ecs_cluster.cluster_ecs.id}"
  task_definition = "${aws_ecs_task_definition.service.arn}"
  desired_count   = 3
  iam_role        = "${aws_iam_role.role_iam.arn}"
  depends_on      = ["aws_iam_role_policy.policy_iam", "aws_lb.lb_ecs"]
  ordered_placement_strategy {
    type  = "binpack"
    field = "cpu"
  }
  load_balancer {
    target_group_arn = "${aws_lb_target_group.target_lb_ecs.arn}"
    container_name   = "mongo"
    container_port   = 27017
  }
  placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in [${var.region}a, ${var.region}b]"
  }
}

resource "aws_ecs_task_definition" "service" {
  family                = "mongo"
  container_definitions = "${file("config/service.json")}"

  volume {
    name      = "service-storage"
    host_path = "/ecs/service-storage"
  }
  placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in [${var.region}a, ${var.region}b]"
  }
}