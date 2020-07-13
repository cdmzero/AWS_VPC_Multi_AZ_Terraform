
# Balenceadores de PREPRODUCCION

# Publico

resource "aws_elb" "PRE-PUB-FRONTEND"{
    #Name_prefix genera un numero aleatorio y lo concatena al final de la cadena de nombre 
    name_prefix = var.project


    #Para que comparta el trafico equitativamente entre las dos subredes
    cross_zone_load_balancing = true
    subnets = [ "${aws_subnet.PRE-PUB-A.id}" , "${aws_subnet.PRE-PUB-B.id}"]

    #Le indicamos porque puerto debe escuchar y protocolo de la instancia donde debe enviarlo
    listener {
        instance_port = 80
        instance_protocol = "http"
        lb_port = 80
        lb_protocol = "http"
    }
    listener {
        instance_port = 443
        instance_protocol = "https"
        lb_port = 443
        lb_protocol = "https"
    }

    health_check {
        healthy_threshold   = 2
        unhealthy_threshold = 2
        timeout             = 3
        target              = "TCP:80"
        interval            = 30
    }

    security_groups = [ "${aws_security_group.PRE-FRONTEND-ELB.id}" ]
}


#Privado

resource "aws_elb" "PRE-PRI-FRONTEND"{
    #Name_prefix genera un numero aleatorio y lo concatena al final de la cadena de nombre 
    name_prefix = var.project


    #Para que comparta el trafico equitativamente entre las dos subredes
    cross_zone_load_balancing = true
    subnets = [ "${aws_subnet.PRE-PRI-A.id}" , "${aws_subnet.PRE-PRI-B.id}" ]

    #Le indicamos porque puerto debe escuchar y protocolo de la instancia donde debe enviarlo
    listener {
        instance_port = 8080
        instance_protocol = "http"
        lb_port = 8080
        lb_protocol = "http"
    }

    health_check {
        healthy_threshold   = 2
        unhealthy_threshold = 2
        timeout             = 3
        target              = "TCP:8080"
        interval            = 30
    }

    security_groups = [ "${aws_security_group.PRE-BACKEND-ELB.id}" ]
    # instances = aws_instance.INSTANCES-PRE-FRONTEND-A.*.id
}

# Balenceadores de PRODUCCION

# Publico

resource "aws_elb" "PRO-PUB-FRONTEND"{
    #Name_prefix genera un numero aleatorio y lo concatena al final de la cadena de nombre 
    name_prefix = var.project


    #Para que comparta el trafico equitativamente entre las dos subredes
    cross_zone_load_balancing = true
    subnets = [ "${aws_subnet.PRO-PUB-A.id}" , "${aws_subnet.PRO-PUB-B.id}"]

    #Le indicamos porque puerto debe escuchar y protocolo de la instancia donde debe enviarlo
    listener {
        instance_port = 80
        instance_protocol = "http"
        lb_port = 80
        lb_protocol = "http"
    }
    listener {
        instance_port = 443
        instance_protocol = "https"
        lb_port = 443
        lb_protocol = "https"
    }

    health_check {
        healthy_threshold   = 2
        unhealthy_threshold = 2
        timeout             = 3
        target              = "TCP:80"
        interval            = 30
    }

    security_groups = [ "${aws_security_group.PRO-FRONTEND-ELB.id}" ]
}


#Privado

resource "aws_elb" "PRO-PRI-BACKEND"{
    #Name_prefix genera un numero aleatorio y lo concatena al final de la cadena de nombre 
    name_prefix = var.project


    #Para que comparta el trafico equitativamente entre las dos subredes
    cross_zone_load_balancing = true
    subnets = [ "${aws_subnet.PRO-PRI-A.id}" , "${aws_subnet.PRO-PRI-B.id}"]

    #Le indicamos porque puerto debe escuchar y protocolo de la instancia donde debe enviarlo
    listener {
        instance_port = 8080
        instance_protocol = "http"
        lb_port = 8080
        lb_protocol = "http"
    }

    health_check {
        healthy_threshold   = 2
        unhealthy_threshold = 2
        timeout             = 3
        target              = "TCP:8080"
        interval            = 30
    }

    security_groups = [ "${aws_security_group.PRO-BACKEND-ELB.id}" ]
    # instances = aws_instance.INSTANCES-PRE-FRONTEND-A.*.id
}



