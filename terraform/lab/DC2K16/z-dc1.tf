resource "random_string" "winrm_password" {
  length  = 16
  special = false
}

locals {
  password = random_string.winrm_password.result
}


resource "aws_instance" "w2k16" {
  ami           = var.ami-dc1
  instance_type = var.instance-tp
  key_name      = "aws_windows"  
  #vpc_security_group_ids = "sg-0c99f4d6189fc0d52"  
  security_groups = [aws_security_group.lab1.id]
  subnet_id       = aws_subnet.dc-subnet.id
  #user_data       = data.template_file.user_data.rendered
  depends_on      = [aws_internet_gateway.dc-gw]

  user_data       = <<EOF
  <powershell>
    net user ${var.username} ${local.password} /add /y
    net localgroup administrators ${var.username} /add
    netsh advfirewall set allprofiles state off
    winrm quickconfig -q    
    net stop winrm
    sc.exe config winrm start=auto
    net start winrm
    </powershell>
    EOF

  tags = {
    Name = "DC Lab 1 - Teste"
  }

  provisioner "file" {
    source      = "scripts/basic-config.ps1"
    destination = "C:/tmp/basic-config.ps1"

    connection {
      host        = self.public_ip
      port        = 5985
      type        = "winrm"
      user        = "admin"
      password    = random_string.winrm_password.result
      insecure    = true
      timeout     = "4m"
      private_key = "./aws_windows.pem"
      https       = false
    }
  }

  provisioner "remote-exec" {
    inline = [
      "sleep 20",
      "echo \"[Executing PS script - IP]\"",
      "powershell.exe -file C:/tmp/basic-config.ps1",
      "sleep 20",
    ]

    connection {
      host        = self.public_ip
      port        = 5985
      type        = "winrm"
      user        = "admin"
      password    = random_string.winrm_password.result
      insecure    = true
      timeout     = "4m"
      private_key = "./aws_windows.pem"
      https       = false
    }
  }
}


    #netsh advfirewall firewall add rule name="WinRM 3389" protocol=TCP dir=in localport=3389 action=allow
    #netsh advfirewall firewall add rule name="WinRM 5985" protocol=TCP dir=in localport=5985 action=allow
    #netsh advfirewall firewall add rule name="WinRM 5986" protocol=TCP dir=in localport=5986 action=allow