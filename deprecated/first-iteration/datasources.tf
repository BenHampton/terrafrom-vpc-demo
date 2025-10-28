data "aws_ami" "example" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
}

resource "aws_instance" "MyEC2Instance" {
  ami                    = data.aws_ami.example.id
  instance_type          = "t3.micro"
  key_name               = aws_key_pair.deployer.id
  vpc_security_group_ids = [aws_security_group.allow_sgs.id]
  subnet_id              = aws_subnet.main.id
  user_data              = file("${path.module}/init-script.sh")

  root_block_device {
    volume_size = 10
  }

  tags = {
    Name = "dev-node"
  }
}