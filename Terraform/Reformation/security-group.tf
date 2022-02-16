
resource "aws_security_group" "alb-security-group" {
  name        = "Reformation-ALB Security Group"
  description = "Enable HTTP/HTTPS access on Port 80/443"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags   = {
    Name = "Reformation-ALB Security Group"
  }
}

resource "aws_security_group" "ssh-security-group" {
  name        = "Reformation SSH Access"
  description = "Enable SSH access on port 22"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description      = "SSH Access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["${var.ssh-location}"]
  }

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags   = {
    Name = "Reformation-SSH Security Group"
  }
}

resource "aws_security_group" "webserver-security-group" {
  name        = "Reformation Web Server Security Group"
  description = "Enable HTTP/HTPPS access on Port 80/443 via ALB and SSH on Port 22 via SSH Security Group."
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags   = {
    Name = "reformation-webserver-security-group"
  }
}

resource "aws_security_group" "database-security-group" {
  name        = "Reformation Database Security Group"
  description = "Enable MYSQL Aurora acess on Port 3306"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description      = "MYSQL Aurora Access"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags   = {
    Name = "Reformation Database Security Group"
  }
}