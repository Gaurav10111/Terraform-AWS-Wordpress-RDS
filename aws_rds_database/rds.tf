resource "aws_db_instance" "WPRDS" {
	allocated_storage = 10
	db_name = "mydb"
	engine = "mysql"
	engine_version = "8.0.35"
	instance_class = "db.t3.micro"
	username = "admin"
	password = jsondecode(data.aws_secretsmanager_secret_version.db_secret_version.secret_string)["db_password"]
	apply_immediately   = true
	db_subnet_group_name = aws_db_subnet_group.wordpressrdssubnetgroup.name
    vpc_security_group_ids = [ aws_security_group.lwSGRDS.id ]
    parameter_group_name = "default.mysql8.0"
	skip_final_snapshot = true

}
