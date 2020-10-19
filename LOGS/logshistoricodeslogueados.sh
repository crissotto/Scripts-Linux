

    clear
    echo "|---------------------------------------|"
    echo "|---------------LOGS--------------------|"
    echo "|---------------------------------------|"

    fecha=$(date +%T%F)
    user=$(cat user.txt)

	clear
	echo "LOGS HISTORICO DE USUARIOS DESLOGUEADOS"
	echo ""
	echo ""
	
	menu() {
    echo "|----------------------------------|"    
	echo "|--------BIENVENIDO AL MENU--------|"
    echo "|----------------------------------|"
	echo "1)Ver Logs Historico de Usuarios deslogueados"
	echo "2)Exportar LOGS"
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
	echo "Mostrando los usuarios deslogueados..."
	echo "Para volver al menu presion la letra Q"
	sleep 5s
	clear
	deslogueados=$(lastlog | more)
	echo "$deslogueados"
	echo "$deslogueados" > /home/$user/respaldologs/respaldologsdeslogueados/respaldologsdeslogueados_$fecha.txt
	echo "Log guardado"
	read
	clear
	echo "Volviendo al menu..."
	sleep 1
	clear
	menu	
	;;

	2)user=$(cat user.txt)
  	  userdestino=$(cat /home/$user/BACKUP/userdestino.txt)
    	  ipdestino=$(cat /home/$user/BACKUP/ipdestino.txt)
    	  cd /home/$user/BACKUP/respaldologs/logsdeslogueados

   	 scp -r /home/"$user"/BACKUP/respaldologs/respaldologsdeslogueados "$userdestino"@"$ipdestino":/home/"$userdestino"/respaldologs/respaldologsdeslogueados

	#clear
	echo "Volviendo al menu..."
	#sleep 1
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