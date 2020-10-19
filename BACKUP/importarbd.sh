
    clear
    echo "|----------------------------|"
    echo "|-----------BACK UP----------|"
    echo "|----------------------------|"
	
	menu() {
	clear
    echo "|----------------------------------|"
    echo "|--------BIENVENIDO AL MENU--------|"
    echo "|----------------------------------|"
	echo "1)Importar Base de Datos"
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
    #usu=$(cat usu.txt)

   #cd /home/$usu/configbd

    tar -vxf technosoft_db2.tar
    echo "drop database technosoft_db2" | dbaccess

    dbimport -d datosdbs technosoft_db2
	clear
	echo "Volviendo al menu..."
	sleep 1
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
