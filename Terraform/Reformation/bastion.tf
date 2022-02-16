# resource "aws_security_group" "bastion" {
#     name = "bastion"
#     description = "Allow inbound connections."

#     ingress {
#         from_port = 0
#         to_port = 22
#         protocol = "tcp"
#         cidr_blocks = ["0.0.0.0/0"]
#     }
#         ingress {
#         from_port = -1
#         to_port = -1
#         protocol = "icmp"
#         cidr_blocks = ["0.0.0.0/0"]
#     }
#     egress {
#         from_port       = 0
#         to_port         = 0
#         cidr_blocks     = ["0.0.0.0/0"]
#         protocol        = "-1"
#     }
#     vpc_id = "${aws_vpc.vpc.id}"

#     tags = {
#         Name = "Bastion"
#     }
# }

# resource "aws_iam_role" "ssm_role" {
#   name = "ssm_role"
#   assume_role_policy = <<EOF
# {
#  "Version": "2012-10-17",
#  "Statement": [
#    {
#      "Action": "sts:AssumeRole",
#      "Principal": {
#        "Service": "ec2.amazonaws.com"
#      },
#      "Effect": "Allow",
#      "Sid": ""
#    }
#  ]
# }
# EOF
# }

# data "aws_iam_policy" "ssm_policy" {
#   arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
# }

# resource "aws_iam_role_policy_attachment" "ssm_policy_attach" {
#    role       = "${aws_iam_role.ssm_role.name}"
#    policy_arn = "${data.aws_iam_policy.ssm_policy.arn}"
# }

# resource "aws_iam_instance_profile" "ssm_profile" {
#   name = "ssm_profile"
#   role = "${aws_iam_role.ssm_role.name}"
# }

# resource "aws_instance" "Bastion" {
#     ami = "ami-033b95fb8079dc481"
#     availability_zone = "us-east-1a"
#     instance_type = "t2.micro"
#     vpc_security_group_ids = ["${aws_security_group.bastion.id}"]
#     subnet_id = "${aws_subnet.public-subnet-1.id}"
#     associate_public_ip_address = true
#     iam_instance_profile = "${aws_iam_instance_profile.ssm_profile.name}"
#     source_dest_check = false
#     key_name = "reformation-ec2-key"
#     tags = {
#         Name = "Bastion"
#     }
# }