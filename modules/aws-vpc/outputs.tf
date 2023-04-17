output "aws_vpc_id" {
  value = aws_vpc.this.id
}

output "aws_subnet_id" {
  value = aws_subnet.subnet0.id
}
