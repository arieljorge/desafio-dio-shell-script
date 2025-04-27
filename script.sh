#!/bin/bash

echo "realizar exclusao caso diretorios, grupos e usuarios existam ? [s/n]";
read temp;

temp=$(echo "$temp" | tr '[:upper:]' '[:lower:]')

if [ "$temp" == "s" ]; then
    echo "removendo diretorios...";
    sudo rm -rf /publico /adm /ven /sec -v;

    echo "removendo usuarios...";
    sudo userdel carlos -rf;
    sudo userdel maria -rf;
    sudo userdel joao_ -rf;
    sudo userdel debora -rf;
    sudo userdel sebastiana -rf;
    sudo userdel roberto -rf;
    sudo userdel josefina -rf;
    sudo userdel amanda -rf;
    sudo userdel rogerio -rf;

    echo "removendo grupos...";
    sudo groupdel GRP_ADM;
    sudo groupdel GRP_VEN;
    sudo groupdel GRP_SEC;
fi

echo "criando grupos...";
sudo groupadd GRP_ADM;
sudo groupadd GRP_VEN;
sudo groupadd GRP_SEC;

echo "criando diretorios...";
sudo mkdir /publico -v;
sudo mkdir /adm -v;
sudo mkdir /ven -v;
sudo mkdir /sec -v;

echo "configurando permissoes do diretorios...";
sudo chmod 777 /publico -v;
sudo chmod 770 /adm -v;
sudo chmod 770 /ven -v;
sudo chmod 770 /sec -v;

sudo chown root:GRP_ADM /adm/
sudo chown root:GRP_VEN /ven/
sudo chown root:GRP_SEC /sec/

echo "criando usuarios e designando a grupos...";
sudo useradd carlos -m -s /bin/bash -p $(openssl passwd -6 senha123) -g GRP_ADM;
sudo passwd carlos -e;
sudo useradd maria -m -s /bin/bash -p $(openssl passwd -6 senha123) -g GRP_ADM;
sudo passwd maria -e;
sudo useradd joao_ -m -s /bin/bash -p $(openssl passwd -6 senha123) -g GRP_ADM;
sudo passwd joao_ -e;
sudo useradd debora -m -s /bin/bash -p $(openssl passwd -6 senha123) -g GRP_VEN;
sudo passwd debora -e;
sudo useradd sebastiana -m -s /bin/bash -p $(openssl passwd -6 senha123) -g GRP_VEN;
sudo passwd sebastiana -e;
sudo useradd roberto -m -s /bin/bash -p $(openssl passwd -6 senha123) -g GRP_VEN;
sudo passwd roberto -e;
sudo useradd josefina -m -s /bin/bash -p $(openssl passwd -6 senha123) -g GRP_SEC;
sudo passwd josefina -e;
sudo useradd amanda -m -s /bin/bash -p $(openssl passwd -6 senha123) -g GRP_SEC;
sudo passwd amanda -e;
sudo useradd rogerio -m -s /bin/bash -p $(openssl passwd -6 senha123) -g GRP_SEC;
sudo passwd rogerio -e;

# verificar grupos no arquivo /etc/group
# verificar usuarios no arquivo /etc/passwd