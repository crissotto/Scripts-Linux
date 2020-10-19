

clear
echo "|---------------------------------------|"
echo "|---------------LOGS--------------------|"
echo "|---------------------------------------|"

fecha=$(date +%T%F)
user=$(cat user.txt)

	clear
	echo "LOGS HISTORICO DE USUARIOS CONECTADOS"
	echo ""
	echo ""
	
	menu() {
        echo "|----------------------------------|"
        echo "|--------BIENVENIDO AL MENU--------|"
        echo "|----------------------------------|"
	echo "1)Ver Logs Historicos de Usuarios conectados"
	echo "2)Exportar BACKUP"
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
	1)echo "Mostrando los usuarios conectados..."
	echo "Para volver al menu presione la letra Q y enter"
	sleep 5s 
	clear
	conectados=$(who | awk '{print $1,$3,$4,$5}')
	echo "$conectados"
	echo "$conectados" > /home/$user/BACKUP/respaldologs/respaldologsconectados/respaldologsconectados_$fecha.txt 
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
    	  cd /home/$user/BACKUP/respaldologs

   	 scp -r /home/"$user"/BACKUP/respaldologs/respaldologsconectados "$userdestino"@"$ipdestino":/home/"$userdestino"/respaldologs/respaldologsconectados

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
