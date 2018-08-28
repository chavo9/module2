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

# keypair
module "keypair" {
  source = "keypair"
}

# database
module "database" {
  source = "database"
}

#server
module "server" {
  source = "server"
}
