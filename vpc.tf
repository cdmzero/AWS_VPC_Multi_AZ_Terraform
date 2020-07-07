


resource "aws_vpc" "vpc" {
    #cidr_block = "fichero_de_variables.nombre_de_referencia_de_la_variable"
    cidr_block = var.cidr  
    enable_dns_hostnames = true 
    enable_dns_support = true 
    tags = {
        Name = "AWS-VPC-MULTI-AZ"
    }
}


resource "aws_subnet" "PRO-PUB-NAT-B"{
    cidr_block = var.PRO-PUB-NAT-B
    vpc_id = aws_vpc.vpc.id
    map_public_ip_on_launch = true
    availability_zone = data.aws_availability_zones.az.names[0]
    tags = {
        Name = "PRO-PUB-NAT-B"
    }
}

resource "aws_subnet" "DEV-PUB-A"{
    cidr_block = var.DEV-PUB-A
    vpc_id = aws_vpc.vpc.id
    map_public_ip_on_launch = true
    availability_zone = data.aws_availability_zones.az.names[1]
    tags = {
        Name = "DEV-PUB-A"
    }
}



resource "aws_subnet" "PRE-PUB-A"{
    cidr_block = var.PRE-PUB-A
    vpc_id = aws_vpc.vpc.id
    map_public_ip_on_launch = true
    availability_zone = data.aws_availability_zones.az.names[0]
    tags = {
        Name = "PRE-PUB-A"
    }
}

resource "aws_subnet" "PRE-PUB-B"{
    cidr_block = var.PRE-PUB-B
    vpc_id = aws_vpc.vpc.id
    map_public_ip_on_launch = true
    availability_zone = data.aws_availability_zones.az.names[1]
    tags = {
        Name = "PRE-PUB-B"
    }
}


resource "aws_subnet" "PRE-PRI-A"{
    cidr_block = var.PRE-PRI-A
    vpc_id = aws_vpc.vpc.id
    map_public_ip_on_launch = true
    availability_zone = data.aws_availability_zones.az.names[0]
    tags = {
        Name = "PRE-PRI-A"
    }
}
resource "aws_subnet" "PRE-PRI-B"{
    cidr_block = var.PRE-PRI-B
    vpc_id = aws_vpc.vpc.id
    map_public_ip_on_launch = true
    availability_zone = data.aws_availability_zones.az.names[1]
    tags = {
        Name = "PRE-PRI-B"
    }
}


resource "aws_subnet" "PRO-PUB-A"{
    cidr_block = var.PRO-PUB-A
    vpc_id = aws_vpc.vpc.id
    map_public_ip_on_launch = true
    availability_zone = data.aws_availability_zones.az.names[0]
    tags = {
        Name = "PRO-PUB-A"
    }
}

resource "aws_subnet" "PRO-PUB-B"{
    cidr_block = var.PRO-PUB-B
    vpc_id = aws_vpc.vpc.id
    map_public_ip_on_launch = true
    availability_zone = data.aws_availability_zones.az.names[1]
    tags = {
        Name = "PRO-PUB-B"
    }
}


resource "aws_subnet" "PRO-PRI-A"{
    cidr_block = var.PRO-PRI-A
    vpc_id = aws_vpc.vpc.id
    map_public_ip_on_launch = true
    availability_zone = data.aws_availability_zones.az.names[0]
    tags = {
        Name = "PRO-PRI-A"
    }
}

resource "aws_subnet" "PRO-PRI-B"{
    cidr_block = var.PRO-PRI-B
    vpc_id = aws_vpc.vpc.id
    map_public_ip_on_launch = true
    availability_zone = data.aws_availability_zones.az.names[1]
    tags = {
        Name = "PRO-PRI-B"
    }
}





resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id

}

resource "aws_route" "default_route" {

    route_table_id = aws_vpc.vpc.default_route_table_id

    destination_cidr_block = "0.0.0.0/0"

    gateway_id = aws_internet_gateway.igw.id

}

