# Output for WordPress EC2 public IP
output "wordpress_public_ip" {
  value = aws_instance.WordPressOS.public_ip
  description = "Public IP address of WordPress EC2 instance"
}

output "Wordpress_private_iP" {
    value = aws_instance.WordPressOS.private_ip
  
}
