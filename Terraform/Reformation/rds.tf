resource "aws_db_subnet_group" "database-subnet-group" {
  name         = "reformation database subnet"
  subnet_ids   = [aws_subnet.public-subnet-1.id,aws_subnet.public-subnet-2.id]
  description  = "Subnet for DB Instance"

  tags   = {
    Name = "database-subnets"
  }
}

#multi_az is for stand by DB
#mysql
# resource "aws_db_instance" "reformation-database-instance" {
#   allocated_storage       = 50
#   db_name                 = "reformation" 
#   engine                  = "mysql"
#   engine_version          = "5.7"    
#   username                = "user"
#   password                = "Password1$"
#   publicly_accessible     = true
#   instance_class          = "${var.database-instance-class}"
#   skip_final_snapshot     = true
#   availability_zone       = "us-east-1a"
#   identifier              = "${var.database-instance-identifier}"
#   #snapshot_identifier     = 
#   db_subnet_group_name    = aws_db_subnet_group.database-subnet-group.name
#   multi_az                = "${var.multi-az-deployment}"
#   vpc_security_group_ids  = [aws_security_group.database-security-group.id]
# }

resource "aws_db_instance" "reformation-database-instance" {
  allocated_storage       = 50
  #db_name                 = "reformation" 
  engine                  = "sqlserver-ex"
  engine_version          = "14.00"    
  username                = "admin"
  password                = "Password1$"
  instance_class          = "${var.database-instance-class}"
  publicly_accessible     = true
  skip_final_snapshot     = true
  availability_zone       = "us-east-1a"
  identifier              = "${var.database-instance-identifier}"
  #snapshot_identifier     = 
  db_subnet_group_name    = aws_db_subnet_group.database-subnet-group.name
  multi_az                = "${var.multi-az-deployment}"
  vpc_security_group_ids  = [aws_security_group.database-security-group.id]
}