# resource "aws_instance" "webservers" {

#     ami = lookup(var.aws_amis, var.region)

#     instance_type = var.instance_type

#     # Asociamos las instancias a un grupo de seguridad
#     vpc_security_group_ids = [ "${aws_security_group.web-sg.id}"]

#     subnet_id = aws_subnet.pri1.id

#     count = 2

#     tags = {
#         Name = "Web servers en la subredes privadas"
#     }

# }