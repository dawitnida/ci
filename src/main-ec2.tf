provider "aws" {
  profile = "dev"
  region  = "eu-west-1"
}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

data "aws_ami" "ubuntu-test-jenkins" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

resource "aws_instance" "web" {
  ami           = "${data.aws_ami.ubuntu-test-jenkins.id}"
  instance_type = "t2.micro"

  tags {
    AccountId   = "${data.aws_caller_identity.current.account_id}"
    Environment = "stage"
    Profile     = "dev"
  }
}
