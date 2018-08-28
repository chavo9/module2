resource "aws_instance" "web" {
  ami           = "ami-04169656fea786776"
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
      "chmod +x /tmp/asset/setup-web.sh",
      "sudo /tmp/asset/setup-web.sh",
    ]
  }
}
