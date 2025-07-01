variable "public_subnet_id" {}
variable "web_sg_id" {}

resource "aws_instance" "web" {
  ami           = "ami-01f23391a59163da9" # Ubuntu 20.04 (eu-west-1)
  instance_type = "t2.micro"
  subnet_id     = var.public_subnet_id
  vpc_security_group_ids = [var.web_sg_id]

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y apache2 php libapache2-mod-php
              echo "<?php phpinfo(); ?>" > /var/www/html/index.php
              systemctl enable apache2
              systemctl start apache2
            EOF

  tags = {
    Name = "web-tier-terraform"
  }
}


output "web_instance_id" {
  value = aws_instance.web.id
}

output "web_public_ip" {
  value = aws_instance.web.public_ip
}

