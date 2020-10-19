
clear
echo -e "ALTA DE USUARIOS"
echo ""
echo ""

	  setContrasenia() {
	  pass=$(date | md5sum | cut -c 1-8)
          echo "$altausuario:$pass" | chpasswd 
          if [ $? -eq 0 ]
	  then
	  echo "La contrasenia de $altausuario es: " $pass
	  echo "$altausuario $pass $group" >> /home/admin/BACKUP/contraseniapordefecto.txt
          else
	  echo "No se pudo asignar la contrasenia al usuario."
	  fi
	  } 

	menu() {
	clear
	echo "|---------------------------------------|"
	echo "|---------BIENVENIDO AL MENU------------|"
	echo "|---------------------------------------|" 
	echo "1) Agregar un usuario y asignarle un grupo" 
	echo "0) Salir" 
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
	1)echo "Recuerde que no debe contener numeros ni simbolos"
      echo -e "Ingrese nombre del usuario: \c"
	  read nombre

       	echo -e "Ingrese apellido del usuario: \c"
 	  read apellido

	  echo -e "Ingrese nombre de usuario a crear: \c"
	  read altausuario

	  if [ "$altausuario" == "" ] 
	  then
	  clear
	  echo -e "\n \n El nombre de usuario no puede estar vacio"
	  sleep 2
	  clear
	  menu
	  fi
	 
	  EXISTE=$(cat /etc/passwd | cut -d: -f1 | grep -c "$altausuario")
	  if [ $EXISTE -eq 1 ]
	  then 
	  echo -e "El usuario ya existe"
	  sleep 3s
	  clear
	  menu
	  else
          #echo "Ingrese el directorio home (por defecto /home/$altausuario): "
	  #read home
	
	  #if [ "$home" == "" ] ; then
	  #home="/home/$altausuario"
	  #else
	  #$home
	  #fi
	
	  echo "Ingrese el shell a utilizar (por defecto /bin/bash): "
	  read shell
	  if [ "$shell" == "" ] ; then
	  shell="/bin/bash"
	  fi
	  clear  
	  #awk -F: '$3 > 1000 && $3 < 65534 {print $3 ")",$1}' /etc/group
	  echo "|----------------------------------------------|"
	  echo "|---------------GRUPOS DISPONIBLES-------------|"
          echo "|----------------------------------------------|"
	  echo ""
	  awk -F: '$3 > 1000 && $3 < 65534 {print $1}' /etc/group
      echo ""
      echo "Recuerde que no debe contener numeros ni simbolos"
      echo "El grupo debe ingresarse en MAYUSCULAS!"  
	  echo -e "Ingrese el nombre del grupo al que quiere agregar al usuario: \c"
	  read group
	  
	  if [ "$group" == "" ] 
	  then
	  clear
	  echo -e "\n \n El nombre de grupo no puede estar vacio"
	  sleep 2s
	  clear
	  menu
	  fi
	
	 #EXISTEGRUPO=$(cat /etc/group | cut -d: -f1 | grep -c "$group")
	EXISTEGRUPO=$(awk -F: '$3 > 500 && $3 < 65534 {print $1}' /etc/group | grep ^"$group")

	  echo "$EXISTEGRUPO"
	  if [ "$EXISTEGRUPO" != "$group" ]
	  then 
	  echo "Grupo no existe"
	  sleep 3s
	  menu 
	  else
	
	  sudo useradd -d /home/$altausuario -c "$nombre $apellido $group" -g $group -m -s $shell $altausuario
	  #useradd -d /home/$altausuario -m -g $group $altausuario 
	  #useradd -d /home/$altausuario -g $group -m -s $altausuario
	  setContrasenia
	  echo "Creando..."
          sleep 3
	  echo -e "El usuario $altausuario ha sido creado"
	  INGRESA=$(echo "insert into usuarios (usuario, nombre, apellido, contrasena, eliminado, estado_usuario, rol_usuario, conectado, ultima_conexion)
	  VALUES  ('$altausuario', '$nombre', '$apellido', '$passwd', 0, 'ACTIVO','$group', 0, null) " | dbaccess technosoft_db2)
	  echo "$INGRESA"
	  echo "$(echo "grant CONNECT to $altausuario" | dbaccess technosoft_db2)"
	  chmod +x $group.sh
	  ./$group.sh $altausuario         
	  chmod 000 $group.sh
	  echo -e "Espere 5 segundos para volver al menu principal"
	  sleep 5s
 	  clear
	  menu
	  fi
	  fi
 	  ;;

	0)echo -e "Espere 5 segundos para volver al menu principal"
         sleep 5s
	 clear
	 ./menuabm.sh
 	;;
	*) echo -e "Opcion incorrecta, vuelva a elegir."
	sleep 3s
	clear
	menu 
	esac 
	}
	menu
