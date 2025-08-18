terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ec2" {
  ami           = "ami-020cba7c55df1f615"
  instance_type = "t2.medium"
  availability_zone = "us-east-1a"

  user_data = <<-EOF
              #!/bin/bash
              mkfs -t ext4 /dev/xvdf
              mkdir /mnt/data
              mount /dev/xvdf /mnt/data
              EOF
}

resource "aws_ebs_volume" "server_storage" {
  availability_zone = "us-east-1a"
  size              = 10
  type              = "gp3"
}

resource "aws_volume_attachment" "attachment" {
  device_name = "/dev/xvdf"
  volume_id   = aws_ebs_volume.server_storage.id
  instance_id = aws_instance.ec2.id
}