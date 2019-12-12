

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

  resource "null_resource" "copy-file" {

    provisioner "file" {
        source = "scripts/basic-config.ps1"
        destination = "c:/tmp/basic-config.ps1"
        }

    connection {
        host = aws_instance.w2k16.public_ip
        type = "winrm"
        user = "admin"
        password = "random_string.winrm_password.result"
        }
}