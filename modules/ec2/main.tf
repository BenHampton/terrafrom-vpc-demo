
data "aws_ami" "main_ami" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
}

resource "aws_instance" "app_server" {
  ami                    = data.aws_ami.main_ami.id
  instance_type          = var.instance
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id              = var.subnet_id
  # key_name               = aws_key_pair.deployer.id
  # user_data              = file("${path.module}/init-script.sh")

  root_block_device {
    volume_size = 10
  }

  tags = {
    Name = "main-app-node"
  }
}

# resource "aws_key_pair" "deployer" {
#   key_name   = "mykey"
#   public_key = file("terraform-key.pub") #TODO point to the correct local file or reference key-pair in aws
# }