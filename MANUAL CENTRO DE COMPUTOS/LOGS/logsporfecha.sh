#!/bin/bash

#!/bin/bash

    clear
    echo "|---------------------------------------|"
    echo "|---------------LOGS--------------------|"
    echo "|---------------------------------------|"

    fecha=$(date +%T%F)
    user=$(cat user.txt)
    clear
	echo "LOGS HISTORICO DE USUARIOS LOGUEADOS"
	echo ""
	echo ""
	
	menu() {
    echo "|----------------------------------|"
    echo "|--------BIENVENIDO AL MENU--------|"
    echo "|----------------------------------|"
	echo "1)Ver Logs de fecha de Usuarios que loguearon"
	echo "2)Ver Logs de fecha de Usuarios que desloguearon"
	echo "0)Salir"
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
	echo -e "Ingrese mes para verificar: \c" 
	echo "Por favor ingrese el mes de esta manera: (Jan-Feb-Mar-Apr-May-Jun-Jul-Aug-Sep-Oct-Nov-Dec)"
	read mes
	echo -e "Ingrese dia para verificar: \c"
	read dia

	echo "Mostrando los usuarios que loguearon..."
	sleep 3s 
	clear
	userlogueados=$(last | awk '{print $1,$4,$5,$6,$7}' | grep -v "reboot" | grep -v "bmtp" | grep -w "$mes $dia" |  more)
	echo "$userlogueados"
	echo ""
	echo "Para volver al menu presione enter"
	echo ""
	#echo "$userlogueados" > /home/$user/respaldologs/respaldologslogueados_$fecha.txt	
	echo "Log guardado"
	read
	clear
	echo "Volviendo al menu..."
	sleep 1
	clear
	menu
	;;
	2)
	echo -e "Ingrese mes para verificar: \c" 
	echo "Por favor ingrese el mes de esta manera: (Jan-Feb-Mar-Apr-May-Jun-Jul-Aug-Sep-Oct-Nov-Dec)"
	read mes
	echo -e "Ingrese dia para verificar: \c"
	read dia

	echo "Mostrando los usuarios que loguearon..."
	sleep 3s 
	clear
	deslogueados=$(lastlog | grep -w "$mes $dia" | more)
	echo "$deslogueados"
	#echo "$deslogueados" > /home/$user/respaldologs/respaldologsdeslogueados_$fecha.txt
	echo ""
	echo "Para volver al menu presione enter"
	echo ""	
	echo "Log guardado"
	read
	clear
	echo "Volviendo al menu..."
	sleep 1
	clear
	menu
	;;
	0)echo -e "Espere 5 segundos para volver al menu principal"
         sleep 5s
	 clear
	./menulogs.sh
	;;
	esac
	}
	menu
	