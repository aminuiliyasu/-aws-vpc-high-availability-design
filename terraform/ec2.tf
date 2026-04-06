resource "aws_instance" "bastion" {
  ami           = var.bastion_ami
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = aws_subnet.public[0].id
  vpc_security_group_ids = [aws_security_group.bastion.id]
  tags = {
    Name = "bastion-host"
  }
}

resource "aws_instance" "webapp" {
  count         = length(aws_subnet.private)
  ami           = var.webapp_ami
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = aws_subnet.private[count.index].id
  vpc_security_group_ids = [aws_security_group.webapp.id]
  tags = {
    Name = "webapp-${count.index + 1}"
  }
}