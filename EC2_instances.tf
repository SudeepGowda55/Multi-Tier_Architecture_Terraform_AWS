resource "aws_instance" "multiTier_public_ec2_1" {
  ami = "ami-08c40ec9ead489470"
  instance_type = "t2.micro"
  tags = {
    Name = "Presentation_Tier_Pb1_Client"
  }
  key_name = "VPC"
  associate_public_ip_address = true
  subnet_id = aws_subnet.three-tier_public_subnet1.id
  vpc_security_group_ids = [ aws_security_group.public_sg.id ]
  provisioner "file" {
    source = "../VPC.pem"
    destination = "/home/ubuntu/VPC.pem"

    connection {
      type = "ssh"
      host = self.public_ip
      user = "ubuntu"
      private_key = "${file("../VPC.pem")}"
    }
  }
  depends_on = [
    aws_security_group.public_sg
  ]
}

resource "aws_instance" "multiTier_public_ec2_2" {
  ami = "ami-08c40ec9ead489470"
  instance_type = "t2.micro"
  tags = {
    Name = "Presentation_Tier_Pb2_Client"
  }
  key_name = "VPC"
  associate_public_ip_address = true
  subnet_id = aws_subnet.three-tier_public_subnet2.id
  vpc_security_group_ids = [ aws_security_group.public_sg.id ]
  provisioner "file" {
    source = "../VPC.pem"
    destination = "/home/ubuntu/VPC.pem"

    connection {
      type = "ssh"
      host = self.public_ip
      user = "ubuntu"
      private_key = "${file("../VPC.pem")}"
    }
  }
  depends_on = [
    aws_security_group.public_sg
  ]
}

resource "aws_instance" "multiTier_private_ec2" {
  ami = "ami-08c40ec9ead489470"
  instance_type = "t2.micro"
  tags = {
    Name = "Presentation_Tier_Pr_Client"
  }
  key_name = "VPC"
  subnet_id = aws_subnet.three-tier_private_subnet.id
  vpc_security_group_ids = [ aws_security_group.private_sg.id ]
  depends_on = [
    aws_security_group.private_sg
  ]
}