terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.0"
        }
    }
}

provider "aws" {
    region = "ap-south-1"
}

resource "aws_s3_bucket" "app_data" {
    bucket = "devsecops-app-data"
}

resource "aws_s3_bucket_versioning" "app_data"{
    bucket = aws_s3_bucket.app_data.id
    versioning_configuration {
        status = "Disabled"
    }
}

resource "aws_security_group" "open_sg"{
    name = "open-security-grp"

    ingress {
        from_port = 0
        to_port   = 65535
        protocol  = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}