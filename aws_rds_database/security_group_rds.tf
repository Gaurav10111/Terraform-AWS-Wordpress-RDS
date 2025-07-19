resource "aws_security_group" "lwSGRDS" {
	name = "lwSGRDStf"
	description = "Allow inbound traffic only for mysql and all outbound traffic "
	vpc_id = var.vpc_id

	tags = {
		Name = "lw sg RDS TF"
	}
}

resource "aws_vpc_security_group_egress_rule" "RDS_allow_all_traffic_ipv4" {
        security_group_id = aws_security_group.lwSGRDS.id
        cidr_ipv4 = "0.0.0.0/0"
        ip_protocol = "-1"
}

resource "aws_vpc_security_group_ingress_rule" "mysql_allow_ipv4_for_all" {
        security_group_id = aws_security_group.lwSGRDS.id
        cidr_ipv4 = "${var.WP_Private_IP}/32"
	from_port = 3306							
        ip_protocol = "tcp"
        to_port = 3306
}


