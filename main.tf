resource "aws_vpc" "jenkins_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "jenkins-vpc"
  }
}

resource "aws_subnet" "jenkins_public_subnet" {
  vpc_id            = aws_vpc.jenkins_vpc.id
  cidr_block        = var.subnet_cidr
  availability_zone = "${var.aws_region}a"

  tags = {
    Name = "jenkins-subnet"
  }
}

resource "aws_internet_gateway" "jenkins_igw" {
  vpc_id = aws_vpc.jenkins_vpc.id

  tags = {
    Name = "jenkins-igw"
  }
}

resource "aws_route_table" "jenkins_rtb" {
  vpc_id = aws_vpc.jenkins_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.jenkins_igw.id
  }
  tags = {
    Name = "jenkins-rtb"
  }
}
