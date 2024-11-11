resource "aws_subnet" "eks-private-subnet" {
  vpc_id            = aws_vpc.main.id
  count             = length(var.eks-private-subnet)
  cidr_block        = var.eks-private-subnet[count.index]
  availability_zone = var.ap-southeast-1-azs[count.index]
  tags = {
    "Name"                            = "eks-private-subnets-${count.index + 1}"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/demo"      = "owned"
  }
}

resource "aws_subnet" "eks-public-subnet" {
  vpc_id            = aws_vpc.main.id
  count             = length(var.eks-public-subnet)
  cidr_block        = var.eks-public-subnet[count.index]
  availability_zone = var.ap-southeast-1-azs[count.index]
  tags = {
    "Name"                       = "eks-public-subnets-${count.index + 1}"
    "kubernetes.io/role/elb"     = "1"
    "kubernetes.io/cluster/demo" = "owned"
  }
}

/* resource "aws_subnet" "private-ap-southeast-1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.0.0/19"
  availability_zone = "ap-southeast-1a"

  tags = {
    "Name"                            = "private-ap-southeast-1a"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/demo"      = "owned"
  }
}

resource "aws_subnet" "private-ap-southeast-1b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.32.0/19"
  availability_zone = "ap-southeast-1b"

  tags = {
    "Name"                            = "private-ap-southeast-1b"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/demo"      = "owned"
  }
}

resource "aws_subnet" "public-ap-southeast-1a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.64.0/19"
  availability_zone       = "ap-southeast-1a"
  map_public_ip_on_launch = true

  tags = {
    "Name"                       = "public-ap-southeast-1a"
    "kubernetes.io/role/elb"     = "1"
    "kubernetes.io/cluster/demo" = "owned"
  }
}

resource "aws_subnet" "public-ap-southeast-1b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.96.0/19"
  availability_zone       = "ap-southeast-1b"
  map_public_ip_on_launch = true

  tags = {
    "Name"                       = "public-ap-southeast-1b"
    "kubernetes.io/role/elb"     = "1"
    "kubernetes.io/cluster/demo" = "owned"
  }
}
 */