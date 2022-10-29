resource "aws_route_table" "multi_tier_route_table" {
  tags = {
    Name = "multi_tier_route_table"
  }
  vpc_id = aws_vpc.multi-tier_vpc.id
}

resource "aws_route" "route1" {
  route_table_id = aws_route_table.multi_tier_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.multiTier_IG.id
}

resource "aws_route_table_association" "multi_tier_route_table_association" {
  route_table_id = aws_route_table.multi_tier_route_table.id
  subnet_id = aws_subnet.three-tier_public_subnet1.id
}

resource "aws_route_table_association" "multi_tier_route_table_association" {
  route_table_id = aws_route_table.multi_tier_route_table.id
  subnet_id = aws_subnet.three-tier_public_subnet2.id
}

# resource "aws_default_route_table" "default-route_table" {
#   default_route_table_id = aws_vpc.multi-tier_vpc.default_route_table_id
  
#   route {
#     cidr_block = "0.0.0.0/0"
#     nat_gateway_id = aws_nat_gateway.multiTier_nat_gateway.id
#   }
#   tags = {
#     "Name" = "nat_route"
#   }
# }