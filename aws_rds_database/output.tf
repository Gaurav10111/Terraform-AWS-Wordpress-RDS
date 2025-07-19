#  RDS endpoint for WordPress configuration
output "rds_endpoint" {
    value = aws_db_instance.WPRDS.endpoint
    description = "RDS MySQL endpoint for WordPress connection"
}

output "rds_id" {
    value = aws_db_instance.WPRDS.id
  }