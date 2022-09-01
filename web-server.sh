#! /bin/bash

##################################################
#   arquivo de lote para instalar um webserver   #
#                 data: 31/08/2022               #
##################################################

echo "Atualizando o servidor e instalando o Apache2"
echo "Execute esse script como root"
echo "para abortar tecle CRTL+C"
sleep 10

apt update
apt upgrade -y
apt install apache2 -y
apt install unzip -y

echo "Baixando os arquivos da aplicacao e colando na pasta padrao do apache2"

cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
unzip main.zip
cd linux-site-dio-main
cp -R * /var/www/html/

echo "teste no seu navegador se o site abre!"
echo "FIM"
