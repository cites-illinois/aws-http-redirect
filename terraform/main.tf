resource "aws_ecr_repository" "default" {
  name = "aws-http-redirect"
}

output "repository_url" {
  value = "${aws_ecr_repository.default.repository_url}"
}
