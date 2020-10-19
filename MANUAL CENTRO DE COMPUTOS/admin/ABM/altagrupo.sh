
clear
echo -e "ALTA DE GRUPOS"
echo ""
echo ""
	
	menu () {
	clear
	echo "|---------------------------------------|"
	echo "|---------BIENVENIDO AL MENU------------|"  
	echo "|---------------------------------------|"    
	echo "1) Crear grupo" 
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
	echo -e "Ingrese el nombre del grupo ha crear: \c"
	read creargrp 
	
	if [ "$opc" == "" ] 
	then
	clear
	echo -e "\n \n El nombre de grupo no puede estar vacio"
	sleep 1
	menu
	fi
	
	EXISTEGRUPO=$(awk -F: '$3 > 1000 && $3 < 65534 {print $1}' /etc/group | grep -w "$creargrp")
	if [ "$EXISTEGRUPO" == "$creargrp" ]
	then
	echo -e "El grupo ya existe"
	sleep 3s
	clear
	menu
	else

	sudo groupadd $creargrp
	echo "Creando..."
        sleep 3
	echo -e "El grupo ha sido creado"
        echo -e "Espere 5 segundos para volver al menu principal"
	sleep 5s
	clear
	menu
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

