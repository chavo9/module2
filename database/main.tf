resource "aws_db_instance" "chavo_db" {
  engine              = "mysql"
  allocated_storage   = 5
  instance_class      = "db.t2.micro"
  name                = "chavo_mysql"
  username            = "admin"
  password            = "${var.db_password}"
  skip_final_snapshot = true
}
