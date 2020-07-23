resource "aws_security_group" "rds-prod" {

  name = "${var.PROJECT_NAME}-SG-rds-production"
  description = "by TF Guru"
  vpc_id      = aws_vpc.main.id
  
  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = ["${var.RDS_CIDR}"]

  }

  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = [aws_security_group.appservers.id]

  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
 tags = {
    Name = "${var.PROJECT_NAME}-SG-rds-production"
  }

}
