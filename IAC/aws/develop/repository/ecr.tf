resource "aws_ecr_repository" "ciclic-base" {
  name = "ciclic/base"
}

resource "aws_ecr_repository" "ciclic-app" {
  name = "ciclic/app"
}