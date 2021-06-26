# Ansible Playbooks

## Pré-Requisitos

+ Control Host Linux CentOS ou RedHat
+ GCC Development Tools
+ epel-release
+ Pacotes Kerberos
+ Python PIP
+ Configurações do Kerberos via krb5.conf
+ Configurações dos HOSTS e Group_Vars no Ansible
+ Servidores remotos precisam ser configurados via script PS1

## Segurança dos Group_vars

Para acessar os servidores remotos via WinRM é necessário configurar os Group_vars. Para que a senha não fique em Clear Text no arquivo, recomenda-se a utilização do Ansible-Vault. 

Para criar:

> openssl rand -base64 2048 > ansible-vault.pass
>
> ansible-vault encrypt vault-test.yml --vault-password-file=./ansible-vault.pass

Para executar playbok com group_vars encriptado:

> ansible-playbook vault-test.yml --vault-password-file=ansible-vault.pass

OBS: Não deixe o arquivo de senha na mesma máquina do que os playbooks. Importante restringir acesso apenas aos administradores.

Para editar os arquivos encriptados:

> ansible-vault edit group_vars-file --vault-password-file=ansible-vault.pass

## Playbooks disponíveis

Lista dos playbooks disponíveis até agora

+ install-msi.yaml
+ install-Wupdates.yaml
+ uninstall-msi.yaml

## Playbook Windows Updates

Para executar o playbook de Windows Updates, o KB precisa ser copiado para o Control Host. O Playbook copia o KB para os servidores remotos presentes no HOST do Ansible e instala. 

OBS: Para reiniciar o servidor após a instalação, as últimas linhas do playbook devem ser descomentadas.
