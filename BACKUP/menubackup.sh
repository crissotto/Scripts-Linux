#!/bin/bash 


#usu=$(cat usu.txt)

clear
echo "|-----------------------------------------------------------|"
echo "|--------------------------BACKUP---------------------------|"
echo "|-----------------------------------------------------------|"
echo ""
echo ""
echo "1)Para IMPORTAR la BASE de DATOS."
echo ""
echo "2)Para EXPORTAR la BASE de DATOS."
echo ""
echo "3)Para CREAR un BACK UP de USUARIOS y GRUPOS del SISTEMA."
echo ""
echo "4)Para CREAR un BACK UP de HOME TOTAL."
echo ""
echo "5)Para CREAR un BACK UP de HOME DIFERENCIAL."
echo ""
echo "6)Para CREAR un BACK UP de BD TOTAL."
echo ""
echo "7)Para CREAR un BACK UP de BD DIFERENCIAL."
echo ""
echo "8)Para CREAR un BACK UP de SYSCONFIG TOTAL."
echo ""
echo "9)Para CREAR un BACK UP de SYSCONFIG DIFERENCIAL."
echo ""
echo "Para SALIR ingrese 0"
echo ""
echo -e "Ingrese la opcion deseada: \c"
read opcion
	case $opcion in
	1)	./importarbd.sh
	;;
        2)	./exportarbd.sh
	;;
	3)	./backupusersygrupos.sh
	;;
	4)	./backuphometotal.sh
	;;
	5)	./backuphomediferencial.sh
	;;
	6)	./backupbdtotal.sh
	;;
	7)	./backupbddiferencial.sh
	;;
	8)	./backupsysconfigtotal.sh
	;;
	9)	./backupsysconfigdiferencial.sh
	;;
	0)clear
      echo "Gracias por utilizar nuestro servicio"
      sleep 2
      sh /home/admin/centrodecomputos.sh
	  ;;
	*)echo -e "Opcion incorrecta, vuelva a elegir."
	sleep 3s
	./menubackup.sh
	;;
	esac
