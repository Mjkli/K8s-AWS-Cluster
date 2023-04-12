resource "aws_eip" "elastic-ip" {
  vpc = true
  network_interface =  var.nic
  associate_with_private_ip = var.private_ip
}

resource "aws_eip_association" "assoc" {
    instance_id = var.instance_id
    allocation_id = aws_eip.elastic-ip.id
}