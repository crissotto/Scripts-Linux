

clear
echo -e "BAJA DE USUARIOS"
echo ""
echo ""

	menu () {
	clear
	echo "|---------------------------------------|"
	echo "|---------BIENVENIDO AL MENU------------|"
	echo "|---------------------------------------|"
	echo "1) Borrar un usuario" 
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
	1)
	clear
	echo "|----------------------------------------------------|"
   	echo "|----------------USUARIOS DISPONIBLES----------------|"
    	echo "|----------------------------------------------------|"
	echo ""
	awk -F: '$3 > 1000 && $3 < 65534 {print $1}' /etc/passwd
	echo ""
	echo -e "Ingrese nombre de usuario a borrar: \c"
	read bajausuario

	
	if [ "$bajausuario" == "" ] 
	then
	clear
	echo -e "\n \n El nombre de usuario no puede estar vacio"
	sleep 2s
	clear
	menu
	fi

	EXISTE=$(awk -F: '$3 > 1000 && $3 < 65534 {print $1}' /etc/passwd | grep -w "$bajausuario")
	#EXISTE=$(cat /etc/passwd | cut -d: -f1 | grep -c "$bajausuario")
	if [ "$EXISTE" != "$bajausuario" ]
	then
	echo "Ese usuario no existe"
	sleep 3s
	clear
	menu
	else

	echo -e "Esta seguro de eliminar al usuario? y/n  \c"
	read respuesta

	if [ $respuesta == "y" ]
	then
	sudo userdel -r $bajausuario
	echo "Borrando..."
	sleep 3
	echo -e "El usuario $bajausuario ha sido borrado"
        echo -e "Espere 5 segundos para volver al menu principal"
	sleep 5s
	clear
	menu
	else
	echo -e "El usuario no ha sido borrado"
	echo -e "Espere 5 segundos para volver al menu principal"
	sleep 5s
	clear
	menu
	fi
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
