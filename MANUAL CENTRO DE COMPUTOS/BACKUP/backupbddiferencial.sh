

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
	echo "1)Generar Backup de respaldo diferencial de directorio HOME"
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
	cd /home/admin/BACKUP/backupbddiferencial
	dbexport -d technosoft_db2
	clear
	tar -cpvzf technosoft_db2_diferencial_$fecha.tgz -N /home/admin/BACKUP/backupbdtotal/technosoftdb_2_total.tgz /home/admin/BACKUP/backupbddiferencial/technosoft_db2.exp
	sleep 3s
    	clear
	echo "Su respaldo ha sido satisfactorio!"
	echo "" 
	echo "El respaldo se encontrara en la ruta /home/admin/BACKUP/backupbddiferencial"
	echo ""
	echo "Volviendo al menu..."
	sleep 3s
	clear
	menu	
	;;

	2)user=$(cat user.txt)
  	  userdestino=$(cat /home/$user/BACKUP/userdestino.txt)
    	  ipdestino=$(cat /home/$user/BACKUP/ipdestino.txt)
    	  cd /home/$user/BACKUP/backupbddiferencial

    scp -r /home/"$user"/BACKUP/backupbddiferencial "$userdestino"@"$ipdestino":/home/"$userdestino"/backupbddiferencial

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

