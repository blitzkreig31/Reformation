variable "vpc-cidr" {
  default = "10.0.0.0/16"
  description = "vpc cidr block"
  type = string
}

variable "public-subnet-1-cidr" {
  default = "10.0.0.0/24"
  description = "public-subnet-1-cidr-block"
  type = string
}

variable "public-subnet-2-cidr" {
  default = "10.0.1.0/24"
  description = "public-subnet-2-cidr block"
  type = string
}

variable "private-subnet-1-cidr" {
  default = "10.0.2.0/24"
  description = "private-subnet-1-cidr block"
  type = string
}

variable "private-subnet-2-cidr" {
  default = "10.0.3.0/24"
  description = "private-subnet-2-cidr block"
  type = string
}

variable "private-subnet-3-cidr" {
  default = "10.0.4.0/24"
  description = "private-subnet-3-cidr block"
  type = string
}

variable "private-subnet-4-cidr" {
  default = "10.0.5.0/24"
  description = "private-subnet-4-cidr block"
  type = string
}

variable "ssh-location" {
  default = "0.0.0.0/0"
  description = "In Production just limit it to IP address"
  type = string
}

variable "database-instance-class" {
  default = "db.t2.micro"
  description = "Database instance type"
  type = string
}

variable "database-instance-identifier" {
  default = "mysql57db"
  description = "Database instance identifier"
  type = string
}

variable "multi-az-deployment" {
  default = false
  description = "Database instance on Stand By"
  type = bool
}