data "aws_ami" "workshopAMI" {
  provider    = aws.workshop
  most_recent = true
  name_regex  = "^aws-workshop-ami-"
  owners      = ["self"]
}
resource "aws_instance" "ec2-demo" {
  ami           = data.aws_ami.workshopAMI.id
  instance_type = "t2.micro"

  tags = {
    Name    = "Demo Terraform"
    Project = "Workshop"
  }

  vpc_security_group_ids = [aws_security_group.workshop.id]
}
