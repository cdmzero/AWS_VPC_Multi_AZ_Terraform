resource "aws_security_group" "PRO-NAT"{

    name = "PRO-NAT"
    vpc_id = aws_vpc.vpc.id

    ingress {
        from_port = 22
        protocol = "tcp"
        to_port = 22
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 943
        protocol = "tcp"
        to_port = 943
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 443
        protocol = "tcp"
        to_port = 443
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 1134
        protocol = "udp"
        to_port = 1134
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 0
        protocol = "-1"
        to_port = 0
        cidr_blocks = ["10.100.200.0/22"]
    }

    egress {
        from_port = 0
        protocol = "-1"
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
    }
}


resource "aws_security_group" "DEV-NAT"{

    name = "DEV"
    vpc_id = aws_vpc.vpc.id

    ingress {
        from_port = 22
        protocol = "tcp"
        to_port = 22
        security_groups = [aws_security_group.PRO-NAT.id]
    }

    ingress {
        from_port = 80
        protocol = "tcp"
        to_port = 80
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 443
        protocol = "tcp"
        to_port = 443
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 8080
        protocol = "tcp"
        to_port = 8080
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        protocol = "-1"
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
    }
}



resource "aws_security_group" "PRE-FRONTEND-ELB"{

 name = "PRE-FRONTEND-ELB"
    vpc_id = aws_vpc.vpc.id

    ingress {
        from_port = 80
        protocol = "tcp"
        to_port = 80
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 443
        protocol = "tcp"
        to_port = 443
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        protocol = "-1"
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
    }

}

resource "aws_security_group" "PRE-FRONTEND"{

 name = "PRE-FRONTEND"
    vpc_id = aws_vpc.vpc.id

    ingress {
        from_port = 80-81
        protocol = "tcp"
        to_port = 80-81
        security_groups = [aws_security_group.PRE-FRONTEND-ELB.id]
    }

    ingress {
        from_port = 22
        protocol = "tcp"
        to_port = 22
        security_groups = [aws_security_group.PRO-NAT.id]
    }

    egress {
        from_port = 0
        protocol = "-1"
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
    }

}

resource "aws_security_group" "PRE-BACKEND-ELB"{

 name = "PRE-BACKEND-ELB"
    vpc_id = aws_vpc.vpc.id

    ingress {
        from_port = 8080
        protocol = "tcp"
        to_port = 8080
        security_groups = [aws_security_group.PRE-FRONTEND.id]
    }

    egress {
        from_port = 0
        protocol = "-1"
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
    }

}


resource "aws_security_group" "PRE-BACKEND"{

 name = "PRE-BACKEND"
    vpc_id = aws_vpc.vpc.id

    ingress {
        from_port = 8080
        protocol = "tcp"
        to_port = 8080
        security_groups = [aws_security_group.PRE-BACKEND-ELB.id]
    }


    ingress {
        from_port = 22
        protocol = "tcp"
        to_port = 22
        security_groups = [aws_security_group.PRO-NAT.id]
    }

    egress {
        from_port = 0
        protocol = "-1"
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
    }

}


resource "aws_security_group" "PRE-MYSQL"{

 name = "PRE-MYSQL"
    vpc_id = aws_vpc.vpc.id

    ingress {
        from_port = 3306
        protocol = "tcp"
        to_port = 3306
        security_groups = [aws_security_group.PRE-BACKEND.id]
    }

    egress {
        from_port = 0
        protocol = "-1"
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
    }

}



resource "aws_security_group" "PRO-FRONTEND-ELB"{

 name = "PRO-FRONTEND-ELB"
    vpc_id = aws_vpc.vpc.id

    ingress {
        from_port = 80
        protocol = "tcp"
        to_port = 80
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 443
        protocol = "tcp"
        to_port = 443
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        protocol = "-1"
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
    }

}

resource "aws_security_group" "PRO-FRONTEND"{

 name = "PRO-FRONTEND"
    vpc_id = aws_vpc.vpc.id

    ingress {
        from_port = 80-81
        protocol = "tcp"
        to_port = 80-81
        security_groups = [aws_security_group.PRO-FRONTEND-ELB.id]
    }

    ingress {
        from_port = 22
        protocol = "tcp"
        to_port = 22
        security_groups = [aws_security_group.PRO-NAT.id]
    }

    egress {
        from_port = 0
        protocol = "-1"
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
    }

}

resource "aws_security_group" "PRO-BACKEND-ELB"{

 name = "PRO-BACKEND-ELB"
    vpc_id = aws_vpc.vpc.id

    ingress {
        from_port = 8080
        protocol = "tcp"
        to_port = 8080
        security_groups = [aws_security_group.PRE-FRONTEND.id]
    }

    egress {
        from_port = 0
        protocol = "-1"
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
    }

}


resource "aws_security_group" "PRO-BACKEND"{

 name = "PRO-BACKEND"
    vpc_id = aws_vpc.vpc.id

    ingress {
        from_port = 8080
        protocol = "tcp"
        to_port = 8080
        security_groups = [aws_security_group.PRO-BACKEND-ELB.id]
    }


    ingress {
        from_port = 22
        protocol = "tcp"
        to_port = 22
        security_groups = [aws_security_group.PRO-NAT.id]
    }

    egress {
        from_port = 0
        protocol = "-1"
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
    }

}

resource "aws_security_group" "PRO-MYSQL"{
    
 name = "PRO-MYSQL"
    vpc_id = aws_vpc.vpc.id

    ingress {
        from_port = 3306
        protocol = "tcp"
        to_port = 3306
        security_groups = [aws_security_group.PRO-BACKEND.id]
    }

    egress {
        from_port = 0
        protocol = "-1"
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
    }

}
