

clear
echo -e "Asignar grupo a usuario"
echo ""
echo ""
echo ""

	
	menu () {
	clear
	echo "|----------------------------------------------------|"  
	echo "|----------------BIENVENIDO AL MENU------------------|"
    	echo "|----------------------------------------------------|"
    echo "1) Asignar usuario a un grupo" 
	echo "0) Salir" 
	echo -e "Seleccione una opcion: \c" 
	read opc
	
	if [ "$opc" == "" ] 
	then
	clear
	echo -e "\n \n La opcion no puede estar vacio"
	sleep 2s
	clear
	menu
	fi
	
	case $opc in 
	1)clear
	echo "|----------------------------------------------------|"
   	echo "|----------------USUARIOS DISPONIBLES----------------|"
    	echo "|----------------------------------------------------|"
	echo ""
	awk -F: '$3 > 1000 && $3 < 65534 {print $1}' /etc/passwd
	echo ""
	echo -e "Ingrese el nombre del usuario a asignar: \c"
	read user
	clear
	echo "|--------------------------------------------------|"
	echo "|----------------GRUPOS DISPONIBLES----------------|"
	echo "|--------------------------------------------------|"
	echo ""
	awk -F: '$3 > 1000 && $3 < 65534 {print $1}' /etc/group
	echo "" 
	echo -e "Ingrese el nombre del grupo al que quiere agregar al usuario: \c"
	read group
	EXISTE=$(awk -F: '$3 > 1000 && $3 < 65534 {print $1}' /etc/passwd | grep -w "$user")
	EXISTEGRUPO=$(awk -F: '$3 > 1000 && $3 < 65534 {print $1}' /etc/group | grep -w "$group")
	if [ "$EXISTE" != "$user" ] || [ "$EXISTEGRUPO" != "$group" ]
	then
	echo "Usuario o grupo no existen"
	sleep 3s
	clear
	menu

	else
	echo "Asignando grupo..."
	sudo usermod -g $group $user
	sleep 5s
	echo -e "El usuario $user ha sido asignado al grupo $group correctamente"	
	sleep 3s
	clear
	menu
	fi
	;;
	0)echo -e "Espere 5 segundos para volver al menu principal"
         sleep 5s
	 clear
 	./menuabm.sh
 	;;
	*)echo -e "Opcion incorrecta, vuelva a elegir."
	sleep 3s
	clear
	menu 
	esac 
	} 
	menu
