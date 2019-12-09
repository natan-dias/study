# Terraform basic commands

+ terraform init - Iniciar o objeto
+ terraform plan - planejar deploy
+ terraform apply - aplicar o deploy
+ terraform destroy - Remover baseado no arquivo tf
+ terraform show - visualizar recursos criados
+ terraform taint - marca como sujo e permite recriação do objeto (untaint desmarca)
+ terraform console - abre modo console do terraform
+ terraform workspace - Criação de workspaces

## Terraform through proxy
- set HTTPS_PROXY=http://<username>:<password>@<proxy>:<port>

## Aula de Comandos

+ Terraform fmt - Formatar texto
+ Terraform get - Baixar os módulos
+ Terraform import - Importar recursos que não estão no terraform
+ terraform graph - Gerar dados sobre os recursos

## Outputs

E:\aws\remote-state\ec2-web>terraform output id
i-0dec660bba218002b

E:\aws\remote-state\ec2-web>terraform output ami
ami-0d26efa3eddae3a8c

E:\aws\remote-state\ec2-web>terraform output ami > ../remote-state-bucket/s3/output.txt

E:\aws\remote-state\ec2-web>terraform output id >> ../remote-state-bucket/s3/output.txt

E:\aws\remote-state\ec2-web>terraform output arn >> ../remote-state-bucket/s3/output.txt

E:\aws\remote-state\ec2-web>

* Com estes comandos o output é escrito diretamente no arquivo dentro do bucket criado na pasta S3

