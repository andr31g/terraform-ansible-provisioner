resource "aws_route_table" "this" {
  vpc_id = aws_vpc.this.id
  route {
    cidr_block = var.cidr_shortest_match
    gateway_id = aws_internet_gateway.this.id
  }
}

resource "aws_route_table_association" "this" {
  subnet_id = aws_subnet.subnet0.id
  route_table_id = aws_route_table.this.id
}
