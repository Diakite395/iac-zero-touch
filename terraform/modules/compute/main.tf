# AMI Ubuntu 22.04 la plus récente (Canonical)
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_key_pair" "this" {
  key_name   = "${var.project_name}-key"
  public_key = var.public_key
}

resource "aws_instance" "web" {
  count = var.instance_count

  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_ids[count.index % length(var.subnet_ids)]
  vpc_security_group_ids = [var.security_group_id]
  key_name               = aws_key_pair.this.key_name

  user_data = templatefile("${path.module}/templates/user_data.sh.tpl", {
    repo_url     = var.repo_url
    repo_branch  = var.repo_branch
    server_label = "${var.project_name}-web-${count.index + 1}"
  })

  user_data_replace_on_change = true

  metadata_options {
    http_tokens = "required" # IMDSv2 obligatoire (bonne pratique de sécurité)
  }

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
    encrypted   = true
  }

  tags = {
    Name = "${var.project_name}-web-${count.index + 1}"
    Role = "web"
  }
}