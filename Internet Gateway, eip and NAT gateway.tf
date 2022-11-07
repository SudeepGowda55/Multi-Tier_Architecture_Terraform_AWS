resource "aws_internet_gateway" "multiTier_IG" {
  vpc_id = aws_vpc.multi-tier_vpc.id

  tags = {
    Name = "three_tier_Internet_gateway"
  }
  depends_on = [
    aws_vpc.multi-tier_vpc
  ]
}

resource "aws_eip" "name" {
  vpc = true
  depends_on = [
    aws_internet_gateway.multiTier_IG
  ]
}

resource "aws_nat_gateway" "multiTier_nat_gateway" {
  tags = {
    Name = "multiTier_nat_gateway"
  }
  subnet_id = aws_subnet.three-tier_public_subnet1.id
  allocation_id = aws_eip.name.id
  depends_on = [
    aws_internet_gateway.multiTier_IG
  ]
}