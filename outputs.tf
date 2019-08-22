output "MASTER" {
  value = "${aws_eip.ip.public_ip}"
}
