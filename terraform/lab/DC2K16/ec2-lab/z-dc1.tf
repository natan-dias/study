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
    winrm quickconfig
    y
    winrm set winrm/config/service/Auth '@{Basic="true"}'
    winrm set winrm/config/service '@{AllowUnencrypted="true"}'
    winrm set winrm/config/winrs '@{MaxMemoryPerShellMB="1024"}'   
    net stop winrm
    sc.exe config winrm start=auto
    net start winrm
    </powershell>
    EOF

  tags = {
    Name = "DC Lab 1 - Teste"
  }
}


    #netsh advfirewall firewall add rule name="WinRM 3389" protocol=TCP dir=in localport=3389 action=allow
    #netsh advfirewall firewall add rule name="WinRM 5985" protocol=TCP dir=in localport=5985 action=allow
    #netsh advfirewall firewall add rule name="WinRM 5986" protocol=TCP dir=in localport=5986 action=allow