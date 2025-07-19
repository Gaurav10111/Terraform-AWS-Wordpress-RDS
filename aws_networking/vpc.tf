resource "aws_vpc" "tfvpc" {
	cidr_block = var.AWS_VPC_CIDR
	enable_dns_support = true
	enable_dns_hostnames = true
	tags = {
		Name = "VPC by TF"
	}

}
