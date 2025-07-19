resource "aws_db_subnet_group" "wordpressrdssubnetgroup" {
	name = "wprdssubnetgroup"

	subnet_ids = [ var.private_subnet_1a_id, var.private_subnet_1b_id ]

	tags = {
		Name = "LW WordPress DB subnet group"
	}

}
