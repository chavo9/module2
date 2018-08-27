variable "access_key" {}
variable "secret_key" {}

variable "region" {
  default = "us-east-1"
}

provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

module "server" {
  source = "server"
}

resource "aws_instance" "example" {
  ami           = "ami-6871a115"
  instance_type = "t2.micro"
  key_name      = "id_rsa"
}

output "public_ip" {
  value = "${aws_instance.example.public_ip}"
}

output "public_dns" {
  value = "${aws_instance.example.public_dns}"
}
