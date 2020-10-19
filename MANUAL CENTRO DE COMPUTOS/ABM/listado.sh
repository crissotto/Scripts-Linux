
clear
echo -e "LISTADO DE USUARIOS Y GRUPOS"
echo ""
echo ""
	
	menu () {
	clear 
	echo "|---------------------------------------|"
	echo "|---------BIENVENIDO AL MENU------------|" 
	echo "|---------------------------------------|"  
	echo "1) Listar usuarios" 
	echo "2) Listar grupos"
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
	  echo "Para volver al menú presione la letra Q"
	  sleep 5s
	  clear
	  echo -e "Lista de usuarios disponibles actualmente."
	  echo ""
	  echo ""
	  awk -F: '$3 >= 1000 && $3 < 65534 {print $1}' /etc/passwd | less
	  echo -e "Espere 5 segundos para volver al menu principal"
	  sleep 5s 
	  menu;; 

	  2)
	  echo "Para volver al menú presione la letra Q"
	  sleep 5s
	  clear
	  echo -e "Lista de grupos disponibles actualmente."
	  echo ""
	  echo ""

	  awk -F: '$3 > 1000 && $3 < 65534 {print $1}' /etc/group | less
	  echo -e "Espere 5 segundos para volver al menu principal"
	  sleep 5s
	  clear 
	  menu;;
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
