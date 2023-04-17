output "public_instance_ip" {
  value = aws_instance.this.public_ip
}

output "public_instance_dns" {
  value = aws_instance.this.public_dns
}

output "private_instance_ip" {
  value = aws_instance.this.private_ip
}

output "private_instance_dns" {
  value = aws_instance.this.private_dns
}

output "ami_id" {
  value = data.aws_ami.focal.id
}

output "ami_name" {
  value = data.aws_ami.focal.name
}
