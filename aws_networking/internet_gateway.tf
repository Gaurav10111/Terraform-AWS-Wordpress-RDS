resource "aws_internet_gateway" "lwIGW" {
	vpc_id = aws_vpc.tfvpc.id
	
	tags = {
		Name = "LW Internet Gateway by TF"
	}


}
