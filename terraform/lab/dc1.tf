resource "aws_instance" "w2k16" {
  ami                    = var.ami-dc1
  instance_type          = var.instance-tp
  key_name               = "SRV-DC1"
  vpc_security_group_ids = "sg-0c99f4d6189fc0d52"
  tags = {
    Name = "DC Lab 1 - Teste"
  }

  provisioner "file" {
    source      = "scripts/basic-config.ps1"
    destination = "C:\\tmp\\basic-config.ps1"
  }

  provisioner "remote-exec" {
    inline = [
      "powershell.exe -file C:\\tmp\\basic-config.ps1"
    ]
  }
}

