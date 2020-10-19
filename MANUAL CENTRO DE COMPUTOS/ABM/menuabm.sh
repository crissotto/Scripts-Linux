
usu=$(cat usu.txt)

clear
echo "|--------------------------------------------------------|"
echo "|--------------------------ABM---------------------------|"
echo "|--------------------------------------------------------|"
echo ""
echo ""
echo "1)Para CREAR un USUARIO."
echo ""
echo "2)Para ASIGNAR un GRUPO ha un USUARIO."
echo ""
echo "3)Para ELIMINAR un USUARIO."
echo ""
echo "4)Para MODIFICAR el NOMBRE y CONTRASEÑA de un USUARIO."
echo ""
echo "5)Para CREAR un GRUPO."
echo ""
echo "6)Para ELIMINAR un GRUPO."
echo ""
echo "7)Para MODIFICAR un GRUPO."
echo ""
echo "8)Para VER el LISTADO de USUARIOS y GRUPOS."
echo ""
echo "Para SALIR ingrese 0"
echo ""
echo -e "Ingrese la opcion deseada: \c"
read opcion
	case $opcion in
	1)
		./altausuario.sh
	;;
    2)
		./asignargrupo.sh
	;;
	3)
		./bajausuario.sh
	;;
	4)
		./modificarusuario.sh
	;;
	5)
		./altagrupo.sh
	;;
	6)
		./bajagrupo.sh
	;;
	7)
		./modificargrupo.sh
	;;
   	8)
		./listado.sh
	;;
	0)clear
      echo "Gracias por utilizar nuestro servicio"
      sleep 2
      sh /home/admin/centrodecomputos.sh
	  ;;
	*)echo "ERROR, elija la opcion correcta"
     sleep 2 
     ./menuabm.sh
	 ;;
	esac
