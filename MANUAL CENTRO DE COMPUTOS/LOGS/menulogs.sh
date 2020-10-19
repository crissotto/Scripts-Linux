#!/bin/bash


#usu=$(cat usu.txt)

clear
echo "|---------------------------------------------------------|"
echo "|--------------------------LOGS---------------------------|"
echo "|---------------------------------------------------------|"
echo ""
echo ""
echo "1)Para ver LOGS HISTORICOS de USUARIOS CONECTADOS."
echo ""
echo "2)Para ver LOGS HISTORICOS de USUARIOS LOGUEADOS."
echo ""
echo "3)Para ver LOGS HISTORICOS de USUARIOS DESLOGUEADOS."
echo ""
echo "4)Para ver LOGS HISTORICOS de USUARIOS FALLIDOS."
echo ""
echo "5)Para ver LOGS POR NOMBRE."
echo ""
echo "6)Para ver LOGS POR FECHA."
echo ""
echo "7)Para ver LOGS EN VIVO."
echo ""
echo "Para SALIR ingrese 0"
echo ""
echo -e "Ingrese la opcion deseada: \c"
read opcion
	case $opcion in
	1)	./logshistoricosconectados.sh
	;;
    	2)	./logshistoricoslogueados.sh
	;;
	3)	./logshistoricosdeslogueados.sh
	;;
	4)	./logshistoricosfallidos.sh
	;;
	5) 	./logsporusuario.sh
	;;
	6)	./logsporfecha.sh
	;;
	7)	./conectadosenvivo.sh
	;;
   	0)	clear
      echo "Gracias por utilizar nuestro servicio"
      sleep 2
      sh /home/admin/centrodecomputos.sh
	  ;;
	*)echo "ERROR, elija la opcion correcta"
     sleep 2 
     ./menulogs.sh
	 ;;
	esac
