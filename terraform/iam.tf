resource "aws_iam_role_policy" "policy_iam" {
  name   = "policy_iam"
  role   = "${aws_iam_role.role_iam.id}"
  policy = "${file("config/policy_iam.json")}"
}

resource "aws_iam_role" "role_iam" {
  name               = "role_iam"
  assume_role_policy = "${file("config/role_iam.json")}"
}