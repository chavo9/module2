provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

# database
module "database" {
  source      = "database"
  db_password = "${var.db_password}"
}

#server
module "server" {
  source = "server"
}
