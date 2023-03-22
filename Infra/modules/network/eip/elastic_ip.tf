resource "aws_eip" "elastic-ip" {
  vpc = true
  network_interface = var.network_interface
  associate_with_private_ip = var.private_ip
}