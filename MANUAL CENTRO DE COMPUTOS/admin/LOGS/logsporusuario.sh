
clear
echo "|---------------------------------------|"
echo "|---------------LOGS--------------------|"
echo "|---------------------------------------|"

fecha=$(date +%T%F)
user=$(cat user.txt)

	clear
	echo "LOGS DIARIO DE USUARIOS"
	echo ""
	echo ""
	
	menu() {
        echo "|----------------------------------|"
        echo "|--------BIENVENIDO AL MENU--------|"
        echo "|----------------------------------|"
	echo "1)Ver Logs Diarios de Usuarios"
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
    echo -e "Ingrese el nombre del usuario ha buscar: \c"
	read nombreuser
	
	if [ "$nombreuser" == "" ] 
	then
	clear
	echo -e "\n \n El nombre de usuario no puede estar vacio"
	sleep 2
	clear
	menu
	fi
    
    EXISTE=$(awk -F: '$3 > 500 && $3 < 65534 {print $1}' /etc/passwd | grep -w "$nombreuser")
	if [ "$EXISTE" != "$nombreuser" ]
	then
	echo "El usuario no existe"
	sleep 2
	clear
	menu 
	else
    CONTENIDO=$(sudo cat /var/log/secure | grep $nombreuser)
    if [ "" != "$CONTENIDO" ]
    then
    echo "$CONTENIDO"
    else
    clear
    echo "No se han encontrado logs del usuario $nombreuser"
	echo "Volviendo al menu..."
	sleep 3
	clear
	menu
	fi
	fi
	;;
	0)echo -e "Espere 5 segundos para volver al menu principal"
         sleep 5s
	 clear
	./menulogs.sh
	;;
	esac
	}
	menu
