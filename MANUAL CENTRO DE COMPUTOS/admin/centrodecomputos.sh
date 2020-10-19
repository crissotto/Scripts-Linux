
clear
echo "|-----------------------------------------------------------------------|"
echo "|--------------------------CENTRO DE COMPUTOS---------------------------|"
echo "|-----------------------------------------------------------------------|"

echo "1)ABM"
echo "2)Back up"
echo "3)Permisos"
echo "4)Logs"
echo "5)Configuracion IP Servidor"
echo "0)Salir"
echo -e "Ingrese la opcion deseada: \c"

read opcion 
	case $opcion in 
	1) sh /home/admin/ABM/menuabm.sh;;
	2) sh /home/admin/BACKUP/menubackup.sh;;
	3) sh /home/admin/permisos.sh;;
	4) sh /home/admin/LOGS/menulogs.sh;;
	0) sh /home/admin/configipservidor.sh;;
	  echo "Gracias por utilizar nuestro servicio"
	  sleep 3s
	  exit;;
	*)echo "ERROR, elija la opcion correcta"
	  sleep 2s
  	./centrodecomputos.sh;;

esac
