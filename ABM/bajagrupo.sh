
clear
echo -e "BAJA DE GRUPOS"
echo ""
echo ""
	
	menu () {
	clear
	echo "|---------------------------------------|" 
	echo "|---------BIENVENIDO AL MENU------------|" 
	echo "|---------------------------------------|"  
	echo "1) Borrar grupo" 
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
	echo "|--------------------------------------------------|"
	echo "|----------------GRUPOS DISPONIBLES----------------|"
	echo "|--------------------------------------------------|"
	echo ""
	awk -F: '$3 > 1000 && $3 < 65534 {print $1}' /etc/group
	echo "" 
	echo -e "Ingrese el nombre del grupo ha borrar: \c"
	read borrargrp 
	
	if [ "$borrargrp" == "" ] 
	then
	clear
	echo -e "\n \n El nombre de grupo no puede estar vacio"
	sleep 2s
	clear
	menu
	fi

	#EXISTEGRUPO=$(cat /etc/group | cut -d: -f1 | grep -c "$borrargrp")
	EXISTEGRUPO=$(awk -F: '$3 > 500 && $3 < 65534 {print $1}' /etc/group | grep -w "$borrargrp")

	if [ "$EXISTEGRUPO" != "$borrargrp" ]
	then
	echo -e "El grupo no existe"
	sleep 3s
	clear
	else

	echo -e "Esta seguro de borrar el grupo? y/n  \c"
	read respuesta

	if [ $respuesta == "y" ]
	then
	sudo groupdel $borrargrp
	echo "Borrando..."
	sleep 3
	echo -e "El grupo $borrargrp ha sido borrado"
        echo -e "Espere 5 segundos para volver al menu principal"
	sleep 5s
	clear
	menu
	else
	echo -e "El grupo no ha sido borrado"
	echo -e "Espere 5 segundos para volver al menu principal"
	sleep 5
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
