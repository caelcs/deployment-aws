resource "aws_key_pair" "default"{
  key_name = "clusterkp"
  public_key = "${file("${var.key_path}")}"
}

resource "aws_instance" "default" {
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  key_name = "${aws_key_pair.default.id}"
  user_data = "${file("${var.bootstrap_path}")}"
  vpc_security_group_ids = ["${aws_security_group.default.id}"]
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.default.id}"
}
