resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      nat_gateway_id             = aws_nat_gateway.nat.id
      carrier_gateway_id         = ""
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      gateway_id                 = ""
      instance_id                = ""
      ipv6_cidr_block            = ""
      local_gateway_id           = ""
      network_interface_id       = ""
      transit_gateway_id         = ""
      vpc_endpoint_id            = ""
      vpc_peering_connection_id  = ""
    },
  ]

  tags = {
    Name = "private"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      gateway_id                 = aws_internet_gateway.igw.id
      nat_gateway_id             = ""
      carrier_gateway_id         = ""
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      instance_id                = ""
      ipv6_cidr_block            = ""
      local_gateway_id           = ""
      network_interface_id       = ""
      transit_gateway_id         = ""
      vpc_endpoint_id            = ""
      vpc_peering_connection_id  = ""
    },
  ]

  tags = {
    Name = "public"
  }
}

resource "aws_route_table_association" "eks-private-rtb" {
  count     = length(var.eks-private-subnet)
  subnet_id = aws_subnet.eks-private-subnet[count.index].id
  /* This part is not working -> Error Error: Invalid for_each argument
  The given "for_each" argument value is unsuitable: the "for_each" argument 
  must be a map, or set of strings, and you have provided a value of type tuple.

  for_each       = aws_subnet.eks-private-subnet
  subnet_id      = each.value */
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "eks-public-rtb" {
  count     = length(var.eks-public-subnet)
  subnet_id = aws_subnet.eks-public-subnet[count.index].id

  /* This part is not working -> Error Error: Invalid for_each argument
  The given "for_each" argument value is unsuitable: the "for_each" argument 
  must be a map, or set of strings, and you have provided a value of type tuple.
  for_each       = aws_subnet.eks-public-subnet
  subnet_id      = each.value */

  route_table_id = aws_route_table.public.id

}

/* 
resource "aws_route_table_association" "private-ap-southeast-1a" {
  subnet_id      = aws_subnet.private-ap-southeast-1a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private-ap-southeast-1b" {
  subnet_id      = aws_subnet.private-ap-southeast-1b.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "public-ap-southeast-1a" {
  subnet_id      = aws_subnet.public-ap-southeast-1a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public-ap-southeast-1b" {
  subnet_id      = aws_subnet.public-ap-southeast-1b.id
  route_table_id = aws_route_table.public.id
}
 */