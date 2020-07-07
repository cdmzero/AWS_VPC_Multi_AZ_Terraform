
#Seteamos el ID de la cuenta de AWS donde se va a levantar
variable "aws_id"{
    default = ["959994420448"]
}
variable "cidr" {
    default = "10.100.200.0/22"
}

# ZONA DE MANAGEMENT

variable "PRO-PUB-NAT-B" {
default = "10.100.200.0/26"
}

# ZONA DE DEV

variable "DEV-PUB-A" {
default = "10.100.200.64/26"
}

# ZONA DE PREPRODUCTION

# PRE-PUBLICA

variable "PRE-PUB-A" {
default = "10.100.201.0/26"
}

variable "PRE-PUB-B" {
default = "10.100.201.64/26"
}

# PRE-PRIVADA

variable "PRE-PRI-A" {
default = "10.100.201.128/26"
}
variable "PRE-PRI-B" {
default = "10.100.201.192/26"
}

# ZONA DE PRODUCTION

# PRO-PUBLICA

variable "PRO-PUB-A" {
default = "10.100.202.0/26"
}

variable "PRO-PUB-B" {
default = "10.100.202.64/26"
}

# PRO-PRIVADA

variable "PRO-PRI-A" {
default = "10.100.202.128/26"
}

variable "PRO-PRI-B" {
default = "10.100.202.192/26"
}




#Seteamos la variable para la instancia de tipo
variable "instance_type" {
    default = "t2.micro"
}
#Seteamos la variable para la region
variable "region" {
    default = "us-east-2"
}
#Seteamos la variable para las Amis a Levantar
variable "aws_amis" {
    default = {
        "eu-west-1" = "ami-026dea5602e368e96"
        "us-east-2" = "ami-026dea5602e368e96"
    }
}

variable "project" {
    default = "elbweb"
}

variable "environment"{
    default = "pro"
}
