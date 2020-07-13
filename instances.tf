resource "aws_instance" "INSTANCES-PRE-PRI-FRONTEND-A" {

# Le pasamos el array de variable de AMIS a la funcion de TF Lookup, y le añadimos la region

    ami = lookup(var.aws_amis, var.region)

    instance_type = var.instance_type

# Asociamos las instancias a un grupo de seguridad

    vpc_security_group_ids = [ "${aws_security_group.PRE-FRONTEND.id}" ]

    subnet_id = aws_subnet.PRE-PRI-A.id

    count = 2

    tags = {
        Name = "Instancias en la subred A privada de PRE-FRONTEND"
    }

}


resource "aws_instance" "INSTANCES-PRE-PRI-FRONTEND-B" {

# Le pasamos el array de variable de AMIS a la funcion de TF Lookup, y le añadimos la region

    ami = lookup(var.aws_amis, var.region)

    instance_type = var.instance_type

# Asociamos las instancias a un grupo de seguridad

    vpc_security_group_ids = [ "${aws_security_group.PRE-FRONTEND.id}" ]

    subnet_id = aws_subnet.PRE-PRI-B.id

    count = 2

    tags = {
        Name = "Instancias en la subred B privada de PRE-FRONTEND"
    }

}



resource "aws_instance" "INSTANCES-PRE-PRI-BACKEND-A" {

# Le pasamos el array de variable de AMIS a la funcion de TF Lookup, y le añadimos la region

    ami = lookup(var.aws_amis, var.region)

    instance_type = var.instance_type

# Asociamos las instancias a un grupo de seguridad

    vpc_security_group_ids = [ "${aws_security_group.PRE-BACKEND.id}" ]

    subnet_id = aws_subnet.PRE-PRI-A.id

    count = 2

    tags = {
        Name = "Instancias en la subred A privada de PRE-BACKEND"
    }

}


resource "aws_instance" "INSTANCES-PRE-PRI-BACKEND-B" {

# Le pasamos el array de variable de AMIS a la funcion de TF Lookup, y le añadimos la region

    ami = lookup(var.aws_amis, var.region)

    instance_type = var.instance_type

# Asociamos las instancias a un grupo de seguridad

    vpc_security_group_ids = [ "${aws_security_group.PRE-BACKEND.id}" ]

    subnet_id = aws_subnet.PRE-PRI-B.id

    count = 2

    tags = {
        Name = "Instancias en la subred B privada de PRE-BACKEND"
    }

}


resource "aws_instance" "INSTANCES-PRO-PRI-FRONTEND-A" {

# Le pasamos el array de variable de AMIS a la funcion de TF Lookup, y le añadimos la region

    ami = lookup(var.aws_amis, var.region)

    instance_type = var.instance_type

# Asociamos las instancias a un grupo de seguridad

    vpc_security_group_ids = [ "${aws_security_group.PRO-FRONTEND.id}" ]

    subnet_id = aws_subnet.PRO-PRI-A.id

    count = 2

    tags = {
        Name = "Instancias en la subred A privada de PRO-FRONTEND"
    }

}


resource "aws_instance" "INSTANCES-PRO-PRI-FRONTEND-B" {

# Le pasamos el array de variable de AMIS a la funcion de TF Lookup, y le añadimos la region

    ami = lookup(var.aws_amis, var.region)

    instance_type = var.instance_type

# Asociamos las instancias a un grupo de seguridad

    vpc_security_group_ids = [ "${aws_security_group.PRO-FRONTEND.id}" ]

    subnet_id = aws_subnet.PRO-PRI-B.id

    count = 2

    tags = {
        Name = "Instancias en la subred B privada de PRO-FRONTEND"
    }

}



resource "aws_instance" "INSTANCES-PRO-PRI-BACKEND-A" {

# Le pasamos el array de variable de AMIS a la funcion de TF Lookup, y le añadimos la region

    ami = lookup(var.aws_amis, var.region)

    instance_type = var.instance_type

# Asociamos las instancias a un grupo de seguridad

    vpc_security_group_ids = [ "${aws_security_group.PRO-BACKEND.id}" ]

    subnet_id = aws_subnet.PRO-PRI-A.id

    count = 2

    tags = {
        Name = "Instancias en la subred A privada de PRO-BACKEND"
    }

}


resource "aws_instance" "INSTANCES-PRO-PRI-BACKEND-B" {

# Le pasamos el array de variable de AMIS a la funcion de TF Lookup, y le añadimos la region

    ami = lookup(var.aws_amis, var.region)

    instance_type = var.instance_type

# Asociamos las instancias a un grupo de seguridad

    vpc_security_group_ids = [ "${aws_security_group.PRO-BACKEND.id}" ]

    subnet_id = aws_subnet.PRO-PRI-B.id

    count = 2

    tags = {
        Name = "Instancias en la subred B privada de PRO-BACKEND"
    }

}