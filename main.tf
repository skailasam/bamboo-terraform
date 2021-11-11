terraform {
  backend "s3" {
    bucket         = "tfstate-test123"
    key            = "terraform.tfstate"
    region         = "eu-west-1"
    encrypt        = true
    dynamodb_table = "dynamo_for_tf_lock"
  }
}

provider "aws" {
  profile = "default"
  region  = "eu-west-1"
}

resource "aws_instance" "BAMBOO" {
  ami           = "ami-0ed961fa828560210"
  instance_type = "t2.micro"
  tags = {
    "Name" = "BAMBOO"
  }
}

# resource "aws_instance" "web" {
#   ami               = "ami-02e136e904f3da870"
#   instance_type     = "t2.micro"
#   key_name          = "deneme"
#   network_interface {
#     device_index         = 0
#     network_interface_id = aws_network_interface.network-interface-1.id
#   }
#   tags = {
#     Name         = "Terraformcuk"
#     "created_by" = "Terraformcuk"
#   }
#   user_data = <<-EOF
#           #!/bin/bash
#           sudo yum update -y
#           sudo yum install apache2 -y
#           sudo systemctl start apache2
#           sudo bash -c 'echo your first web server' > /var/www/html/index.html
#           EOF
# }

# resource "aws_vpc" "my-vpc" {
#   cidr_block = "10.0.0.0/16"
#   tags = {
#     "Name" = "value"
#   }

# }
# resource "aws_subnet" "subnet1" {
#   vpc_id            = aws_vpc.my-vpc.id
#   cidr_block        = "10.0.0.0/24"
#   availability_zone = "eu-west-1a"

# }

# resource "aws_subnet" "subnet2" {
#   vpc_id            = aws_vpc.my-vpc.id
#   cidr_block        = "10.0.1.0/24"
#   availability_zone = "eu-west-1b"

# }

# resource "aws_subnet" "subnet3" {
#   vpc_id            = aws_vpc.my-vpc.id
#   cidr_block        = "10.0.2.0/24"
#   availability_zone = "eu-west-1c"

# }

# resource "aws_internet_gateway" "igw" {
#   vpc_id = aws_vpc.my-vpc.id
# }

# resource "aws_route_table" "routetable1" {
#   vpc_id = aws_vpc.my-vpc.id
#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.igw.id
#   }
# }

# resource "aws_route_table_association" "rta1" {
#   subnet_id      = aws_subnet.subnet1.id
#   route_table_id = aws_route_table.routetable1.id

# }

# resource "aws_security_group" "allow_web" {
#   name        = "allow_web"
#   description = "Allow web inbound traffic"
#   vpc_id      = aws_vpc.my-vpc.id

#   ingress {
#     description = "HTTPS from VPC"
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }






#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }


#   tags = {
#     Name = "allow_tls"
#   }
# }

# resource "aws_network_interface" "network-interface-1" {
#   subnet_id       = aws_subnet.subnet1.id
#   private_ips     = ["10.0.0.50"]
#   security_groups = [aws_security_group.allow_web.id]

# }

# resource "aws_eip" "eip" {
#   vpc                       = true
#   network_interface         = aws_network_interface.network-interface-1.id
#   associate_with_private_ip = "10.0.0.50"
#   depends_on                = [aws_internet_gateway.igw]
# }
