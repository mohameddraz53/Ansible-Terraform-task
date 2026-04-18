resource "aws_instance" "aws_instance" {
  ami                    = "ami-0c3389a4fa5bddaad"
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  user_data              = file(init.bash)
  tags = {
    Name = "HelloWorld"
  }
}
