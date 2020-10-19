
fecha=$(date +%d-%m-%Y_%H.%M)

clear
    echo "|----------------------------|"
    echo "|-----------BACK UP----------|"
    echo "|----------------------------|"
	
	menu() {
	clear
    echo "|----------------------------------|"
    echo "|--------BIENVENIDO AL MENU--------|"
    echo "|----------------------------------|"
	echo "1)Generar Backup de respaldo diferencial de directoio HOME"
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
	1)clear
	echo "Creando respaldo diferencial de Backup del directorio HOME..."
	sleep 3s
	cd /home/admin/BACKUP/backuphomediferencial
	tar -cpvzf home_$fecha.tgz -N /home/admin/BACKUP/backuphometotal/respaldo_home_total.tgz /home/*
	sleep 3s
    	clear
	echo "Su respaldo ha sido satisfactorio!"
	echo "" 
	echo "El respaldo se encontrara en la ruta /home/admin/BACKUP/backuphomediferencial"
	echo ""
	echo "Volviendo al menu..."
	sleep 3s
	clear
	menu	
	;;
	
	2)user=$(cat user.txt)
  	  userdestino=$(cat /home/$user/BACKUP/userdestino.txt)
    	  ipdestino=$(cat /home/$user/BACKUP/ipdestino.txt)
    	  cd /home/$user/BACKUP/backuphomediferencial

    scp -r /home/"$user"/BACKUP/backuphomediferencial "$userdestino"@"$ipdestino":/home/"$userdestino"/backuphomediferencial

	#clear
	echo "Volviendo al menu..."
	#sleep 1
	clear
	menu
	;;

	
	0)echo -e "Espere 5 segundos para volver al menu principal"
         sleep 5s
	 clear
	./menubackup.sh
	;;
	*)echo -e "Opcion incorrecta, vuelva a elegir."
	sleep 3s
	clear
	menu 
	esac 	
	}
	menu
