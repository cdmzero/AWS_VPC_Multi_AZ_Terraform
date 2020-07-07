
# # Generamos un balenceador
# resource "aws_elb" "elb-web"{
#     #Name_prefix genera un numero aleatorio y lo concatena al final de la cadena de nombre 
#     name_prefix = var.project


#     #Para que comparta el trafico equitativamente entre las dos subredes
#     cross_zone_load_balancing = true
#     subnets = [ "${aws_subnet.pub1.id}" , "${aws_subnet.pub2.id}"]

#     #Le indicamos porque puerto debe escuchar y protocolo por que puerto y protocolo de la instancia debe enviarlo
#     listener {
#         instance_port = 80
#         instance_protocol = "http"
#         lb_port = 80
#         lb_protocol = "http"
#     }

#     security_groups = [ "${aws_security_group.elb-sg.id}" ]
#     instances = aws_instance.webservers.*.id
# }