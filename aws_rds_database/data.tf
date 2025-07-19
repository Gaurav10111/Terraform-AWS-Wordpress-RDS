data "aws_secretsmanager_secret" "db_secret" {
  name = "my-rds-secret"
}

data "aws_secretsmanager_secret_version" "db_secret_version" {
  secret_id = data.aws_secretsmanager_secret.db_secret.id
}
