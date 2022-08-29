#! /bin/bash

clear

echo "Arquivo de criação de infraestrutura para ambiente Linux"
echo "Criação de Grupos de usuarios, diretorios e permissões"
echo " Criação de Usuários e inclusão nos grupos criados "
echo "!!! EXECUTAR ESSE SCRIPT COMO SUPERUSUARIO/ROOT !!!"
echo "!!!          PARA ABORTAR TECLE CTRL+C          !!!"

sleep 5

#Criando grupos no sistema

group1=$(grep -w GRP_ADM /etc/group | cut -d ':' -f 1)
group2=$(grep -w GRP_VEN /etc/group | cut -d ':' -f 1)
group3=$(grep -w GRP_SEC /etc/group | cut -d ':' -f 1)

if [ -z $group1];
then
  groupadd GRP_ADM
else
  echo "Grupo ADM já existe"
fi

if [ -z $group2];
then
  groupadd GRP_VEN
else
  echo "Grupo VEN já existe"
fi

if [ -z $group3];
then
  groupadd GRP_SEC
else
  echo "Grupo SEC já existe"
fi

#criando pastas na raiz do sistema

if [ -d /public ];
then
  echo "já existe o diretorio /public no sistema"
else
  mkdir /public
  chown root:root /public
  chmod 777 /public
fi

if [ -d /adm ];
then
  echo "já existe o diretorio /adm no sistema"
else
  mkdir /adm
  chown root:GRP_ADM /adm
  chmod 770 /adm
fi

if [ -d /ven ];
then
  echo "já existe o diretorio /ven no sistema"
else
  mkdir /ven
  chown root:GRP_VEN /ven
  chmod 770 /ven
fi

if [ -d /sec ];
then
  echo "já existe o diretorio /sec no sistema"
else
  mkdir /sec
  chown root:GRP_SEC /sec
  chmod 770 /sec
fi

#criando usuarios no sistema

user1=$(grep -w carlos /etc/passwd |  cut -d ':' -f 1)
user2=$(grep -w debora /etc/passwd |  cut -d ':' -f 1)
user3=$(grep -w josefina /etc/passwd |  cut -d ':' -f 1)
user4=$(grep -w maria /etc/passwd |  cut -d ':' -f 1)
user5=$(grep -w sebastiana /etc/passwd |  cut -d ':' -f 1)
user6=$(grep -w amanda /etc/passwd |  cut -d ':' -f 1)
user7=$(grep -w joao /etc/passwd |  cut -d ':' -f 1)
user8=$(grep -w roberto /etc/passwd |  cut -d ':' -f 1)
user9=$(grep -w rogerio /etc/passwd |  cut -d ':' -f 1)

if [ -z $user1];
then
  useradd carlos -m -c "Carlos da Silva" -s /bin/bash -p $(openssl passwd Senha 123) -G GRP_ADM
else
  echo "Usuario carlos já existe"
fi

if [ -z $user2];
then
  useradd debora -m -c "Débora da Silva" -s /bin/bash -p $(openssl passwd Senha 123) -G GRP_VEN
else
  echo "Usuario debora já existe"
fi

if [ -z $user3];
then
  useradd josefina -m -c "Josefina da Silva" -s /bin/bash -p $(openssl passwd Senha 123) -G GRP_SEC
else
  echo "Usuario josefina já existe"
fi

if [ -z $user4];
then
  useradd maria -m -c "Maria da Silva" -s /bin/bash -p $(openssl passwd Senha 123) -G GRP_ADM
else
  echo "Usuario maria já existe"
fi

if [ -z $user5];
then
  useradd sebastiana -m -c "Sebastiana da Silva" -s /bin/bash -p $(openssl passwd Senha 123) -G GRP_VEN
else
  echo "Usuario sebastiana já existe"
fi

if [ -z $user6];
then
  useradd amanda -m -c "Amanda da Silva" -s /bin/bash -p $(openssl passwd Senha 123) -G GRP_SEC
else
  echo "Usuario amanda já existe"
fi

if [ -z $user7];
then
  useradd joao -m -c "Joao da Silva" -s /bin/bash -p $(openssl passwd Senha 123) -G GRP_ADM
else
  echo "Usuario joao já existe"
fi

if [ -z $user8];
then
  useradd roberto -m -c "Roberto da Silva" -s /bin/bash -p $(openssl passwd Senha 123) -G GRP_VEN
else
  echo "Usuario roberto já existe"
fi

if [ -z $user9];
  useradd rogerio -m -c "Rogerio da Silva" -s /bin/bash -p $(openssl passwd Senha 123) -G GRP_SEC
else
  echo "Usuario rogerio já existe"

echo "FIM DE SCRIPT"
