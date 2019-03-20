
## Nginx
Ansbile feito para rodar em ubuntu  

### Para instalar o LB

#### sudo ansible-playbook -i inventory  site.yml

#### Criar Variaveis

        vim group_vars/all/all.yml
        smtp_email: smtp.exemplo.com:587
        FROM_EMAIL_ADDRESS: user@email.com
        EMAIL_ACCOUNT_PASSWORD: "{{ vault_EMAIL_ACCOUNT_PASSWORD }}"
        FRIENDLY_NAME: fulano

#### Também é bom criar um arquivo vault

        sudo ansible-playbook create group_vars/all/vault.yml

#### No inventory pode se ter quandos backends(nodes) precisar

        vim inventory
        [nginx]
        10.168.99.102

        [node]  
        10.168.99.100
        10.168.99.101

Para rodar os playbooks deverá existir um usuário ansible  destino.
           
          1) adduser ansible 
          2) passwd ansible
          3) vim /etc/sudoers
             ansible ALL=(ALL)  NOPASSWD: ALL
obs. para não informar a senha a todo momento, pode ser feito  trocas de  [chaves publicas!]( https://www.digitalocean.com/community/tutorials/como-configurar-chaves-ssh-no-ubuntu-18-04-pt)
