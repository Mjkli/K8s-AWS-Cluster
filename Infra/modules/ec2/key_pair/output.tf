output name {
    value = aws_key_pair.instance_key.key_name
}

output public_key {
    value = tls_private_key.ssh.public_key_openssh
    sensitive = true
}