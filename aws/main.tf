data "aws_ami" "focal" {
  most_recent = true
  owners = ["amazon"]
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-*-server-*"]
  }
  filter {
    name = "state"
    values = ["available"]
  }
  filter {
    name = "architecture"
    values = ["x86_64"]
  }
  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name = "root-device-type"
    values = ["ebs"]
  }
}

resource "aws_instance" "this" {
  user_data = module.ansible-payload-aws.cloud_init_template_reified
  ami = data.aws_ami.focal.id
  instance_type = var.aws_instance_type
  associate_public_ip_address = true
  subnet_id = module.aws-vpc.aws_subnet_id
  availability_zone = data.aws_availability_zones.this.names[0]
  vpc_security_group_ids = [module.aws-firweall.aws_security_group_id]
  monitoring = true
  root_block_device {
    volume_type = "gp2"
    volume_size = var.aws_root_block_device_size_in_gb
    delete_on_termination = true
  }
  tags = {
    Name = var.vm_name
  }
}
