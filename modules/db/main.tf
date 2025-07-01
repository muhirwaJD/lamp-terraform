variable "private_subnet_id" {}
variable "db_sg_id" {}

resource "aws_instance" "db" {
  ami           = "ami-01f23391a59163da9"
  instance_type = "t2.micro"
  subnet_id     = var.private_subnet_id
  vpc_security_group_ids = [var.db_sg_id]

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y mysql-server
              systemctl enable mysql
              systemctl start mysql
            EOF

  tags = {
    Name = "db-tier-terraform"
  }
}

output "db_instance_id" {
  value = aws_instance.db.id
}

