
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
	echo "1) Modificar grupo" 
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
	echo "|--------------------------------------------------|"
	echo "|----------------GRUPOS DISPONIBLES----------------|"
	echo "|--------------------------------------------------|"
	echo ""
	awk -F: '$3 > 1000 && $3 < 65534 {print $1}' /etc/group
	echo "" 
	echo -e "Ingrese el nombre del grupo ha modificar: \c"
	read modgrp 
	
	if [ "$modgrp" == "" ] 
	then
	clear
	echo -e "\n \n El nombre de grupo no puede estar vacio"
	sleep 2
	clear
	menu
	fi

	EXISTEGRUPO=$(awk -F: '$3 > 1000 && $3 < 65534 {print $1}' /etc/group | grep -w "$modgrp")
	#EXISTEGRUPO=$(cat /etc/group | cut -d: -f1 | grep -c "$modgrp")
	if [ "$EXISTEGRUPO" != "$modgrp" ]
	then
	echo -e "El grupo no existe"
	sleep 3s 
	clear
	menu
	else
	echo -e "Ingrese el nuevo nombre de grupo:  \c"
	read newgrp

	EXISTENUEVOGRUPO=$(awk -F: '$3 > 1000 && $3 < 65534 {print $1}' /etc/group | grep -w "$newgrp")
	if [ "$EXISTENUEVOGRUPO" == "$newgrp" ]
	then
	echo -e "El grupo ya existe"
	sleep 3s 
	clear
	menu
	else


	echo -e "Esta seguro de modificar el usuario? y/n  \c"
	read respuesta

	if [ $respuesta == "y" ]
	then
	sudo groupmod -n $newgrp $modgrp
	echo "Modificando..."
	sleep 3
	echo -e "El grupo ha sido modificado"
        echo -e "Espere 5 segundos para volver al menu principal"
	sleep 5s
	clear
	menu
	else
	echo -e "El grupo no ha sido modificado"
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
