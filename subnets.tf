# resource "aws_subnet" "three-tier_public_subnet1" {
#   cidr_block = "10.0.0.0/24"
#   vpc_id = aws_vpc.multi-tier_vpc
#   availability_zone = "us-east-1a"
#   tags = {
#     Name = "three-tier_public_subnet1"
#   }
#   depends_on = [
#     aws_vpc.multi-tier_vpc
#   ]
# }

# resource "aws_subnet" "3tier_public_subnet2" {
#   cidr_block = "10.0.1.0/24"
#   vpc_id = aws_vpc.multitier_vpc.id
#   availability_zone = "us-east-1b"
#   tags = {
#     Name = "3tier_public_subnet2"
#   }
# }


# resource "aws_subnet" "3tier_private_subnet" {
#   vpc_id = aws_vpc.multitier_vpc.id
#   cidr_block = "10.0.2.0/24"
#   availability_zone = "us-east-1c"
#   tags = {
#     Name = "3tier_private_subnet"
#   }
# }

# data "aws_subnets" "subnets_id" {
#   filter {
    
#   }
# }