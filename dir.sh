#!/bin/bash

DIRETORIOS=$(cat folder.txt)
GRP=$(cat grupos.txt)
USRS=$(cat usuarios.txt)

echo "Criando diretorios"

for pastas in $DIRETORIOS;do
	mkdir /$pastas
done

echo "Criando grupos de usuarios"

for gr in $GRP;do
       groupadd $gr	
done

echo "Criando usuarios"

for us in $USRS;do
       useradd $us -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
done



echo "Especificando permissões"

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico

echo "Fim ......"