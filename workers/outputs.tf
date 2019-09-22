output "ips" {
  value = "${aws_instance.worker[*].public_ip}"
}
