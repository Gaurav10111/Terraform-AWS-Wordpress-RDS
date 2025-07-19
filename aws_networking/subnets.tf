resource "aws_subnet" "lw_public_subnet_1a" {
	vpc_id = aws_vpc.tfvpc.id
	cidr_block = var.AWS_SUBNET_CIDR_PUBLIC_1A
	availability_zone = var.AWS_SUBNET_AZ_A
	map_public_ip_on_launch = true	

	tags = {
		Name = "Public Subnet in 1a by TF"
	}

}


resource "aws_subnet" "lw_public_subnet_1b" {
  vpc_id = aws_vpc.tfvpc.id
  cidr_block = var.AWS_SUBNET_CIDR_PUBLIC_1B
  availability_zone = var.AWS_SUBNET_AZ_B
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet in 1b by TF"
  }

}


resource "aws_subnet" "lw_public_subnet_1c" {
  vpc_id = aws_vpc.tfvpc.id
  cidr_block = var.AWS_SUBNET_CIDR_PUBLIC_1C
  availability_zone = var.AWS_SUBNET_AZ_C
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet in 1c by TF"
  }

}


resource "aws_subnet" "lw_private_subnet_1a" {
  vpc_id = aws_vpc.tfvpc.id
  cidr_block = var.AWS_SUBNET_CIDR_PRIVATE_1A
  availability_zone = var.AWS_SUBNET_AZ_A
  map_public_ip_on_launch = false

  tags = {
    Name = "Private Subnet in 1a by TF"
  }

}

resource "aws_subnet" "lw_private_subnet_1b" {
  vpc_id = aws_vpc.tfvpc.id
  cidr_block = var.AWS_SUBNET_CIDR_PRIVATE_1B
  availability_zone = var.AWS_SUBNET_AZ_B
  map_public_ip_on_launch = false

  tags = {
    Name = "Private Subnet in 1b by TF"
  }

}

resource "aws_subnet" "lw_private_subnet_1c" {
  vpc_id = aws_vpc.tfvpc.id
  cidr_block = var.AWS_SUBNET_CIDR_PRIVATE_1C
  availability_zone = var.AWS_SUBNET_AZ_C
  map_public_ip_on_launch = false

  tags = {
    Name = "Private Subnet in 1c by TF"
  }

}
