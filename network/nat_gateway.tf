resource " aws_eip" "nat_eip" {
  count = 2
  vpc   = true
}

resource "aws_nat_gateway" "nat_gateway" {
  count         = 2
  subnet_id     = aws_subnet.public_subnets[count.index].id
  allocation_id = aws_eip.nat_eip[count.index].id
  tags = {
    Name = "nat-gateway-${count.index + 1}"
  }
  depends_on = [aws_eip.nat_eip]
}