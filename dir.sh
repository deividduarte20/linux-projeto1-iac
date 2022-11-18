#!/bin/bash

DIRETORIOS=("publico" "ven" "sec" "adm")
GRP=("GRP_ADM" "GRP_VEN" "GRP_SEC")
USRS=("carlos" "maria" "joao" "debora" "sebastiana" "roberto" "josefina" "rogerio")


echo "Criando diretorios"

for pastas in "${DIRETORIOS[@]}";do
	mkdir /$pastas
done

echo "Criando grupos de usuarios"

for gr in ${GRP[@]};do
       groupadd $gr	
done

echo "Criando usuarios"

for us in ${USRS[@]};do
       useradd $us -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
done



echo "Especificando permissões"

chown root:GRP_ADM /adm

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico

echo "Fim ......"
