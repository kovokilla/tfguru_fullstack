data "aws_ami" "ubuntu" {
  most_recent = "true"
  owners = ["099720109477"] #Canonical
  filter {
  name = "name"
  values = ["*16.04-amd64-server-*"]
  }
 filter {
  name = "virtualization-type"
  values = ["hvm"]
 }
}

data "aws_ami" "ubuntu2" {
  most_recent = "true"
  owners = ["099720109477"]
  filter {
  name = "name"
  values = ["*18.04-amd64-server-*"]
  }
  filter {
  name = "virtualization-type"
  values = ["hvm"]
 }
}

output "aws_ami"  { 
  value = data.aws_ami.ubuntu.id
}

output "secondaws_ami" { 

  value = data.aws_ami.ubuntu2.id
}
