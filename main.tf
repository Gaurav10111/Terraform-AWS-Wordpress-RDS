module "aws_networking" {
  source = "./aws_networking"

  AWS_VPC_CIDR = var.AWS_VPC_CIDR
  AWS_SUBNET_AZ_A = var.AWS_SUBNET_AZ_A
  AWS_SUBNET_AZ_B = var.AWS_SUBNET_AZ_B
  AWS_SUBNET_AZ_C = var.AWS_SUBNET_AZ_C

  AWS_SUBNET_CIDR_PUBLIC_1A = var.AWS_SUBNET_CIDR_PUBLIC_1A
  AWS_SUBNET_CIDR_PUBLIC_1B = var.AWS_SUBNET_CIDR_PUBLIC_1B
  AWS_SUBNET_CIDR_PUBLIC_1C = var.AWS_SUBNET_CIDR_PUBLIC_1C

  AWS_SUBNET_CIDR_PRIVATE_1A = var.AWS_SUBNET_CIDR_PRIVATE_1A
  AWS_SUBNET_CIDR_PRIVATE_1B = var.AWS_SUBNET_CIDR_PRIVATE_1B
  AWS_SUBNET_CIDR_PRIVATE_1C = var.AWS_SUBNET_CIDR_PRIVATE_1C

}

module "aws_rds_database" {
    source = "./aws_rds_database"

    vpc_id = module.aws_networking.vpc_id
    private_subnet_1a_id = module.aws_networking.private_subnet_1a_id
    private_subnet_1b_id = module.aws_networking.private_subnet_1b_id
    WP_Private_IP = module.aws_wordpress.Wordpress_private_iP
  
}

module "aws_wordpress" {
    source = "./aws_wordpress"

    WP_INSTANCE_TYPE = var.WP_INSTANCE_TYPE
    AMI_ID = var.AMI_ID

    vpc_id = module.aws_networking.vpc_id
    public_subnet_1a_id = module.aws_networking.public_subnet_1a_id
    rds_id = module.aws_rds_database.rds_id

    //depends_on = [ module.aws_rds_database ]
}