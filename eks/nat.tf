resource "aws_eip" "nat" {
  //domain = "vpc"
  vpc = true

  tags = {
    Name = "nat"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.eks-public-subnet[0].id
  //  subnet_id     = aws_subnet.public-ap-southeast-1a.id

  tags = {
    Name = "nat"
  }

  depends_on = [aws_internet_gateway.igw]
}
