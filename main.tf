provider "aws" {
}

variable "cidr_blocks" {
  description = "cidr block for vpc and subnest"
  type = list(object({
    cidr_block = string
    name = string
  }))
}

variable "vpc_cidr_block" {
  description = "vpc cidr block"
}

variable "environment" {
  description = "deployment environment"
}

variable avail_zone {}

resource "aws_vpc" "development-vpc" {
    cidr_block = var.cidr_blocks[0].cidr_block
    tags = {
      Name : var.cidr_blocks[0].name
    }
}

resource "aws_subnet" "dev-subnet-1" {
  vpc_id = aws_vpc.development-vpc.id
  cidr_block = var.cidr_blocks[1].cidr_block
  availability_zone = var.avail_zone
  tags = {
      Name : var.cidr_blocks[1].name
  }
}