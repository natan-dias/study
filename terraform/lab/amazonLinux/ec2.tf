resource "aws_instance" "kube-controlplane" {
    ami = var.ami
    instance_type = var.instance-tp
    
    vpc_security_group_ids = ["${aws_security_group.web.id}"]

    subnet_id = aws_subnet.public_a.id

    #availability_zone = var.region
    key_name = var.key

    depends_on = [
        aws_security_group.web,
        aws_subnet.public_a,
    ]

    tags = {
        Name = "Kube Control Plane"
    }

}

resource "aws_eip" "public" {
    instance = aws_instance.kube-controlplane.id
    vpc = true
}