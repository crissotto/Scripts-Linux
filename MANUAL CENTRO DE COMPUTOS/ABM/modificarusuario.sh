

clear
echo -e "MODIFICACION DE GRUPOS"
echo "" 
echo "" 
clear
   		
	menu () {
	clear
	echo "|---------------------------------------|"
	echo "|---------BIENVENIDO AL MENU------------|" 
	echo "|---------------------------------------|"   
	echo "1) Modificar usuario"
	echo "0) Salir" 
	echo -e "Seleccione una opcion: \c" 
	read opc
	
	if [ "$opc" == "" ] 
	then
	clear
	echo -e "\n \n La opcion no puede estar vacio"
	sleep 2
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
	echo -e "Ingrese el nombre del usuario ha modificar: \c"
	read modificarusuario
	
	if [ "$modificarusuario" == "" ] 
	then
	clear
	echo -e "\n \n El nombre de usuario no puede estar vacio"
	sleep 2
	clear
	menu
	fi

	EXISTE=$(awk -F: '$3 > 500 && $3 < 65534 {print $1}' /etc/passwd | grep -w "$modificarusuario")
	#EXISTE=$(cat /etc/passwd | cut -d: -f1 | grep -c "$modificarusuario")
	if [ "$EXISTE" != "$modificarusuario" ]
	then
	echo -e "El usuario no existe"
	sleep 2
	clear
	menu 
	else
	echo -e "Ingrese el nuevo nombre de usuario:  \c"
	read newnombre
	
	EXISTENUEVOUSUARIO=$(awk -F: '$3 > 500 && $3 < 65534 {print $1}' /etc/passwd | grep -w "$newnombre")
	if [ "$EXISTENUEVOUSUARIO" == "$newnombre" ]
	then
	echo -e "El usuario ya existe"
	sleep 3s 
	clear
	menu
	else

	echo -e "Esta seguro de modificar el usuario? y/n  \c"
	read respuesta

	if [ $respuesta == "y" ]
	then
	sudo usermod -l $newnombre -d /home/$newnombre -m $modificarusuario
	sudo passwd $newnombre 
	echo "Modificando..."
	sleep 3
	echo -e "El usuario $modificarusuario ha sido modificado"
        echo -e "Espere 5 segundos para volver al menu principal"
	sleep 5s
	menu
	else
	echo -e "El usuario no ha sido modificado"
	echo -e "Espere 5 segundos para volver al menu principal"
	sleep 5
	clear
	menu
	fi
	fi
	fi
	;; 
	0)echo -e "Espere 5 segundos para volver al menu principal"
         sleep 5
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
