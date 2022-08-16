provider "aws"{
    region = "us-east-1"
}
variable "dev-vpc" {
  
}
resource "aws_vpc" "dev-vpc"{
    cidr_block=var.dev-vpc
    tags = {
      "Name" = "Devlopment VPC"
      "vpc-env" = "Dev-vpc"
    }
}

resource "aws_subnet" "dev-subnet-1" {
    vpc_id=aws_vpc.dev-vpc.id
    cidr_block = "10.0.10.0/24"
    availability_zone = "us-east-1a"
    tags = {
      "Name" = "subent1"
    }
}
data "aws_vpc" "existing-vpc" {
    default = true
}
resource "aws_subnet" "dev-subnet-2" {
    vpc_id = data.aws_vpc.existing-vpc.id
    cidr_block = "172.31.96.0/20"
    availability_zone = "us-east-1a"
    tags = {
      "Name" = "subenet2"
    }
}
