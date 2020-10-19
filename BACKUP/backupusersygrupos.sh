

fecha=$(date +%d-%m-%Y_%H.%M)

clear
    echo "|------------------------------|"
    echo "|-----------BACKUP-------------|"
    echo "|------------------------------|"
	
	menu() {

    clear    
    echo "|----------------------------------|"
    echo "|--------BIENVENIDO AL MENU--------|"
    echo "|----------------------------------|"
	echo "1)Crear BACKUP de USUARIOS y GRUPOS"
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
      user=$(cat user.txt)

    cd /home/$user/BACKUP/respaldousers	

    export UGIDLIMITE=1000

    echo "Generando back up de usuarios y grupos"
    sleep 5s 

    awk -v LIMITE=$UGIDLIMITE -F: '($3 > LIMITE) && ($3 != 65534)' /etc/passwd > /home/$user/BACKUP/respaldousers/passwd_$fecha.mig 

    awk -v LIMITE=$UGIDLIMITE -F: '($3 > LIMITE) && ($3 != 65534)' /etc/group > /home/$user/BACKUP/respaldousers/group_$fecha.mig

    awk -v LIMITE=$UGIDLIMITE -F: '($3 > LIMITE) && ($3 != 65534) {print $1}' /etc/passwd | tee - |egrep -f - /etc/shadow > /home/$user/BACKUP/respaldousers/shadow_$fecha.mig

    tar -zcvpf /home/$user/BACKUP/respaldousers/home_$fecha.tar.gz /home
    tar -zcvpf /home/$user/BACKUP/respaldousers/mail_$fecha.tar.gz /var/spool/mail
    sleep 3s
	
    echo "Back up de usuarios y grupos ejecutado satisfactoriamente!"
	echo "Volviendo al menu..."
	sleep 1
	clear
	menu	
	;;
    	2)user=$(cat user.txt)
  	  userdestino=$(cat /home/$user/BACKUP/userdestino.txt)
    	  ipdestino=$(cat /home/$user/BACKUP/ipdestino.txt)
    	  cd /home/$user/BACKUP/respaldousers

    scp -r /home/"$user"/BACKUP/respaldousers "$userdestino"@"$ipdestino":/home/"$userdestino"/respaldousers

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
	esac
	}
	menu