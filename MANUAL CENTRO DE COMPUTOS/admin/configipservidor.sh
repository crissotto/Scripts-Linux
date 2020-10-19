

user=$(cat user.txt)
clear
echo "1)Ingrese la IP del servidor"
echo "2)Ingrese nombre de usuario del servidor"
echo "3)Ingrese nombre para usuario actual en el sistema"
echo "0)Ingrese 0 para salir"
echo -e "Ingrese la opcion deseada: \c"
read opcion

case "$opcion" in

1)
	clear
	echo -e "Ingrese IP: \c"
	read IP
	echo "$IP" > ipdestino.txt
	echo "$user">/home/$user/BACKUP/ipdestino.txt
	sleep 3s
	echo "La IP $IP se ha ingresado satisfactoriamente!"
	;;

2)
	clear
	echo -e "Ingrese nombre: \c"
	read nombre
	echo "$nombre">userdestino.txt
	sleep 3s
	echo "El nombre $nombre se ha ingresado satisfactoriamente"
	;;

3)
	clear
	echo -e "Ingrese nombre: \c"
	read user
	echo "$user">/home/$user/ABM/user.txt
	echo "$user">/home/$user/LOGS/user.txt
	echo "$user">/home/$user/user.txt
	echo "$user">/home/$user/BACKUP/user.txt
	echo "$user">/home/$user/BACKUP/userdestino.txt
	sleep 3s
	echo "El nombre $user se ha ingresado satisfactoriamente!"
	;;

0)
	exit
	;;

*)
	echo "Caracter Invalido"; sleep 2
	;;

esac
