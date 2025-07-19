output "VPC_id" {
	value = module.aws_networking.vpc_id
	description = "ID of VPC"
}

output "wordpress_public_ip" {
  value = module.aws_wordpress.wordpress_public_ip
  description = "Public IP address of WordPress server"
}

output "rds_endpoint" {
  value = module.aws_rds_database.rds_endpoint
  description = "RDS MYSQL database identifier"
}