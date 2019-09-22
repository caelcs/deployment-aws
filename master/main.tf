resource "aws_instance" "master" {
  ami                    = "${var.ami}"
  instance_type          = "${var.instance_type}"
  key_name               = "${var.aws_key_pair_id}"
  user_data              = "${file("${var.bootstrap_path}")}"
  vpc_security_group_ids = var.aws_security_group_ids
}

resource "aws_elb_attachment" "lumartex" {
  elb      = "${var.aws_elb_id}"
  instance = "${aws_instance.master.id}"
}
