resource "aws_instance" "w2k16" {
  ami                    = var.ami-dc1
  instance_type          = var.instance-tp
  key_name               = "amazon_key"
  #vpc_security_group_ids = "sg-0c99f4d6189fc0d52"  
  security_groups      = [aws_security_group.lab1.id]
  subnet_id = aws_subnet.dc-subnet.id
  
  tags = {
    Name = "DC Lab 1 - Teste"
  }

  provisioner "remote-exec" {
    inline = [
      "sleep 20",
      "echo \"[Installing winrm]\"",
      "powershell,exe winrm quickconfig",
      "sleep 20",
    ]
    connection {
      host = self.public_ip
      type        = "winrm"
      user        = "ec2-user"
      timeout     = "1m"
      private_key = "amazon_key"  
    }
  }

  provisioner "file" {
    source      = "scripts/basic-config.ps1"
    destination = "C:\\tmp\\basic-config.ps1"

    connection {
      host = self.public_ip
      type        = "winrm"
      user        = "ec2-user"
      timeout     = "1m"
      private_key = "./amazon_key.pem"  
    }
  }

  provisioner "remote-exec" {
    inline = [
      "sleep 20",
      "echo \"[Executing PS script - IP]\"",
      "powershell.exe -file C:\\tmp\\basic-config.ps1",
      "sleep 20",
    ]

    connection {
      host = self.public_ip
      type        = "winrm"
      user        = "ec2-user"
      timeout     = "1m"
      private_key = "./amazon_key.pem"  
    }
  }
}
