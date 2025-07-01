variable "private_subnet_id" {}
variable "app_sg_id" {}

resource "aws_instance" "app" {
  ami           = "ami-01f23391a59163da9"
  instance_type = "t2.micro"
  subnet_id     = var.private_subnet_id
  vpc_security_group_ids = [var.app_sg_id]

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y php
            EOF

  tags = {
    Name = "app-tier-terraform"
  }
}

output "app_instance_id" {
  value = aws_instance.app.id
}

