resource "aws_db_instance" "chavo_db" {
  engine              = "mysql"
  allocated_storage   = 5
  instance_class      = "db.t2.micro"
  name                = "chavo_mysql"
  username            = "admin"
  password            = "${var.db_password}"
  skip_final_snapshot = true
}
resource "aws_key_pair" "chavo" {
  key_name   = "chavo"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}

resource "aws_instance" "web" {
  ami           = "ami-6871a115"
  instance_type = "t2.micro"
  key_name      = "${aws_key_pair.chavo.id}"

  connection {
    user        = "ubuntu"
    private_key = "${file("~/.ssh/id_rsa")}"
  }

  provisioner "file" {
    source      = "asset"
    destination = "/tmp"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo sh /tmp/assets/setup-web.sh",
    ]
  }
}

output "public_ip" {
  value = "${aws_instance.web.public_ip}"
}
