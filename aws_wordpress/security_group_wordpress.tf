resource "aws_security_group" "lwSGWordPress" {
	name = "lwSGWordPressTF"
	description = "Allow Inbound traffic for HTTP and all outbound traffic for all"
	vpc_id = var.vpc_id
	
	tags = {
		Name = "lw SG WordPress TF"
	}
}

resource "aws_vpc_security_group_egress_rule" "WP_allow_all_traffic__ipv4" {
	security_group_id = aws_security_group.lwSGWordPress.id
	cidr_ipv4 = "0.0.0.0/0"
	ip_protocol = "-1"
}

resource "aws_vpc_security_group_ingress_rule" "WP_allow_http_ipv4_for_all" {
	security_group_id = aws_security_group.lwSGWordPress.id
	cidr_ipv4 = "0.0.0.0/0"
	from_port = 80
	ip_protocol = "tcp"
	to_port = 80
}

resource "aws_vpc_security_group_ingress_rule" "WP_allow_ssh_ipv4_for_all" {
	security_group_id = aws_security_group.lwSGWordPress.id
	cidr_ipv4 = "0.0.0.0/0"
	from_port = 22
	ip_protocol = "tcp"
	to_port = 22
}
