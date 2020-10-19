
clear

echo "|-----------------------------"
echo "|------------LOGS-------------"
echo "|----------------------------|"


menu () {
	clear
	echo "|---------------------------------------|"
	echo "|---------BIENVENIDO AL MENU------------|"  
	echo "|---------------------------------------|"    
	echo "1) Ver CONECTADOS en VIVO" 
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
	1) clear
	   
	  who > whotemporal.txt
	  ps aux > psauxtemporal.txt

	  cantlineaswho=$(wc -l whotemporal.txt | cut -f1 -d " ")
	  cantlineaspsaux=$(wc -l psauxtemporal.txt | cut -f1 -d " ")
	
	  contadorwho=1

	  while [ "$contadorwho" != "$cantlineaswho" ]
	  do

	 	head -n $contadorwho whotemporal.txt | tail -1 > datoswho.txt

		userwho=$(awk '{print $1}' datoswho.txt)
		
		terminalwho=$(awk '{print $2}' datoswho.txt)

		#CORTAR EL GID DEL USUARIO SI ES MAYOR A 8 EL SERVIDOR NO LO TOMA
		#grep 'USUARIO /etc/passwd | cut -d":" -f3 		 

		contadorpsaux=2

	while [ "$contadorpsaux" != "$cantlineaspsaux" ] 
	do 
	
		head -n $contadorpsaux psauxtemporal.txt | tail -1 > datospsaux.txt
		userpsaux=$(awk '{print $1}' datospsaux.txt)
		terminalpsaux=$(awk '{print $7}' datospsaux.txt)
		horapsaux=$(awk '{print $9}' datospsaux.txt)
		tiempopsaux=$(awk '{print $10}' datospsaux.txt)
		procesopsaux=$(awk '{print $11}' datospsaux.txt)

	if [ "$userwho" = "$userpsaux" ] && [ "$terminalwho" = "$terminalpsaux" ]
	then 
	echo "$userwho:$terminalwho:$horapsaux:$tiempopsaux:$procesopsaux" >> log.auditoria
	fi
	let "contadorpsaux=$contadorpsaux+1"
	done 

	let "contadorwho=$contadorwho+1"
	done
	cat log.auditoria 
	;;




	0)echo -e "Espere 5 segundos para volver al menu principal"
         sleep 5
	 clear
	 ./menulogs.sh
 	;;
	*)echo -e "Opcion incorrecta, vuelva a elegir."
	sleep 3s
	clear

	menu 
	esac 
	}
	menu
