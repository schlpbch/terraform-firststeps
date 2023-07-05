# main.tf

# defining the provider as AWS

provider "aws" {
	region = "${var.region}"
	access_key = "${var.access_key}"
	secret_key = "${var.secret_key}"
}

# create a security group for RDS database instances

resource "aws_security_group" "rds_mySQL_sg" {
	name = "rds_mySQL_sg"
	ingress {
		from_port = 3306
		to_port = 3306
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}
	egress {
		from_port = 3306
		to_port = 3306
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}
}

# create RDS database instance

resource "aws_db_instance" "mySQL_instance" {
	engine = "mysql"
	identifier = "mySQL_instance"
	alloacted_storage = 20
	engine_version = "8.0.33"
	instance_class = "db.t2.micro"
	username = "myrdsuser"
	password = "myrdspassword"
	parameter_group_name = "default.mysqql8.0"
	vpc_security_group_ids = ["${aws_security_group.rds_mySQL_sg.id}"]
	skip_final_snapshot = true
	publicly_accessible = true
}
