locals {
  port_in  = [443, 80, 22]
  port_out = [0]
}

resource "aws_security_group" "main_sg_group" {
  name        = "main-sg_group"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.main_vpc.id

  dynamic "ingress" {
    for_each = toset(local.port_in)
    content {
      description = "HTTPS from VPC"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = toset(local.port_out)
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  tags = {
    Name = "main-sg_group"
  }
}