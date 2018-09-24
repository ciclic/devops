data "aws_ecs_task_definition" "ciclic_app" {
  task_definition = "${aws_ecs_task_definition.ciclic_app.family}"
}

resource "aws_ecs_task_definition" "ciclic_app" {
  family = "hello_world"

  container_definitions = <<DEFINITION
[
  {
    "name": "ciclic-app",
    "image": "00000000000.dkr.ecr.us-east-1.amazonaws.com/ciclic/app:latest",
    "essential": true,
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 80
      }
    ],
    "memory": 500,
    "cpu": 4
  },
]
DEFINITION
}
