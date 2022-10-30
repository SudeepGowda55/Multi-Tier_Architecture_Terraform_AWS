resource "aws_security_group" "public_sg" {
  name = "public_security_group"
  description = "A public security group for public instances"
  vpc_id = aws_vpc.multi-tier_vpc.id

  tags = {
    Name = "public_instance_security_group"
  }
  depends_on = [
    aws_vpc.multi-tier_vpc
  ]
}

resource "aws_security_group_rule" "public_sgr_for_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.public_sg.id
}

resource "aws_security_group_rule" "public_sgr_for_ssh" {
  type = "ingress"
  protocol = "tcp"
  from_port = 22
  to_port = 22
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.public_sg.id
}

resource "aws_security_group_rule" "public_sgr_for_https" {
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 443
  to_port           = 443
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.public_sg.id
}

resource "aws_security_group_rule" "public_sgr_for_out" {
  type = "egress"
  from_port = 0
  to_port = 0
  protocol = "all"
  security_group_id = aws_security_group.public_sg.id
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group" "private_sg" {
  name = "private_security_group"
  description = "A Private Security Group for private instances"
  vpc_id = aws_vpc.multi-tier_vpc.id

  tags = {
    Name = "private_instance_security_group"
  }
  depends_on = [
    aws_vpc.multi-tier_vpc
  ]
}

resource "aws_security_group_rule" "private_sgr_for_ssh" {
  type = "ingress"
  protocol = "tcp"
  from_port = 22
  to_port = 22
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.private_sg.id
}

resource "aws_security_group_rule" "private_sgr_for_MYSQL" {
  type = "ingress"
  protocol = "tcp"
  from_port = 3306
  to_port = 3306
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.private_sg.id
}

resource "aws_security_group_rule" "private_sgr_for_out" {
  type = "egress"
  from_port = 0
  to_port = 0
  protocol = "all"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.private_sg.id
}