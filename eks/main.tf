resource "aws_iam_role" "demo" {
  name = "eks-cluster-demo"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "demo-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.demo.name
}

resource "aws_eks_cluster" "demo" {
  name     = "demo"
  role_arn = aws_iam_role.demo.arn

  vpc_config {
    subnet_ids = concat("${aws_subnet.eks-private-subnet[*].id}", "${aws_subnet.eks-public-subnet[*].id}")
    /* subnet_ids = [
      aws_subnet.eks-private-subnet[*].id,
      aws_subnet.eks-public-subnet[*].id
      aws_subnet.private-ap-southeast-1a.id,
      aws_subnet.private-ap-southeast-1b.id,
      aws_subnet.public-ap-southeast-1a.id,
      aws_subnet.public-ap-southeast-1b.id
    ] */
  }

  depends_on = [aws_iam_role_policy_attachment.demo-AmazonEKSClusterPolicy]
}
