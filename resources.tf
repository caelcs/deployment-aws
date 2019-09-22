resource "aws_key_pair" "default" {
  key_name   = "clusterkp"
  public_key = "${file("${var.key_path}")}"
}

### Creating ELB
resource "aws_elb" "default" {
  name               = "terraform-asg-example"
  security_groups    = ["${aws_security_group.elb.id}"]
  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e", "us-east-1f"]
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }
  listener {
    lb_port           = 80
    lb_protocol       = "HTTP"
    instance_port     = 80
    instance_protocol = "HTTP"
  }
}

module "master" {
  source                 = "./master"
  aws_key_pair_id        = "${aws_key_pair.default.id}"
  ami                    = "${var.ami}"
  instance_type          = "${var.instance_type}"
  aws_security_group_ids = ["${aws_security_group.default.id}"]
  aws_elb_id             = "${aws_elb.default.id}"
}

module "worker" {
  source                 = "./workers"
  aws_key_pair_id        = "${aws_key_pair.default.id}"
  ami                    = "${var.ami}"
  instance_type          = "${var.instance_type}"
  aws_security_group_ids = ["${aws_security_group.default.id}"]
  aws_elb_id             = "${aws_elb.default.id}"
  total_workers          = var.total_workers

}
