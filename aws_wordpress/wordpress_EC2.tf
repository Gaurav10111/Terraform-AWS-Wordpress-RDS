locals {
  ENV = terraform.workspace
}


resource "aws_instance" "WordPressOS" {
	ami = var.AMI_ID
	instance_type = var.WP_INSTANCE_TYPE
	key_name      = "terraform-key"
	vpc_security_group_ids = [ aws_security_group.lwSGWordPress.id ]
	subnet_id = var.public_subnet_1a_id

	tags = {
		Name = "${local.ENV}-LinuxWord WordPress Site"
    MYENV = local.ENV
	}

  depends_on = [ 
    var.rds_id,
    var.public_subnet_1a_id,
    aws_security_group.lwSGWordPress 
     ]
}

resource "null_resource" "nullremote1" {
  provisioner "remote-exec" {

          inline = [
                    "sudo yum install httpd -y",
                    "sudo yum install git -y",
                    "sudo amazon-linux-extras install -y mariadb10.5 php8.2",
                    "sudo git clone https://github.com/WordPress/WordPress.git",
                    "sudo mv WordPress/* /var/www/html/",
                    "sudo chown -R apache /var/www/html/",
                    "sudo systemctl restart httpd"
                  ]
            }


  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("${path.module}/../terraform-key.pem")
    host        = aws_instance.WordPressOS.public_ip
  }

  depends_on = [ aws_instance.WordPressOS ]

}

resource "null_resource" "nulllocalchrome" {
  provisioner "local-exec" {
                command = "start http://${aws_instance.WordPressOS.public_ip}/"
              }

  depends_on = [ null_resource.nullremote1 ]
}

