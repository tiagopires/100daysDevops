provider "aws" {

    profile = "default"
    region  = "eu-west-1"
}

resource "aws_s3_bucket" "stg_100_days" {

    bucket = "stg-100-days-24082020"
    acl    = "private"
}

resource "aws_default_vpc" "default" {
}

resource "aws_default_subnet" "default_az1" {

    availability_zone = "eu-west-1a"

    tags = {
        "Terraform" = "true"
    }
}

resource "aws_security_group" "stg_web" {

    ingress {

        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {

        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags {
        Terraform = "true"
    }
}

resource "aws_instance" "stg_web" {

    ami = "ami-0813bebde038dee86"
    instance_type = t2.nanos
}







