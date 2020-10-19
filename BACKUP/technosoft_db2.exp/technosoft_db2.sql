{ DATABASE technosoft_db2  delimiter | }

{ Encoded Optical BLOB descriptor }

grant dba to "root";
grant dba to "informix";
grant resource to "rperez";
grant dba to "crissotto";
grant connect to "dforlan";
grant dba to "smorales";
grant dba to "apineyro";
grant connect to "lsuarez";
grant connect to "dgodin";
grant connect to "fespinoza";
grant connect to "fsimon";
grant connect to "jrodriguez";
grant connect to "pgonzalez";
grant connect to "pgimenez";
grant connect to "nsouza";
grant connect to "jmichibata";
grant connect to "jbutton";
grant connect to "bbeall";
grant connect to "jsnow";
grant dba to "dblanco";
grant connect to "jdiaz";
grant connect to "jramone1";
grant connect to "dramone1";



create role "operario_patio" ;
create role "operario_puerto" ;
create role "transportista" ;
create role "administrador" ;


grant "administrador" to "rperez" ;
grant "operario_patio" to "dforlan" ;
grant "administrador" to "lsuarez" ;
grant "operario_patio" to "dgodin" ;
grant "operario_puerto" to "fespinoza" ;
grant "transportista" to "fsimon" ;
grant "administrador" to "jrodriguez" ;
grant "operario_patio" to "pgonzalez" ;
grant "operario_puerto" to "pgimenez" ;
grant "transportista" to "nsouza" ;
grant "administrador" to "jmichibata" ;
grant "operario_patio" to "jbutton" ;
grant "operario_puerto" to "bbeall" ;
grant "transportista" to "jsnow" ;
grant "administrador" to "dblanco" ;
grant "administrador" to "crissotto" ;
grant "administrador" to "smorales" ;
grant "administrador" to "apineyro" ;








{ TABLE "root".roles_usuario row size = 105 number of columns = 2 index size = 115 }

{ unload file name = roles00100.unl number of rows = 4 }

create table "root".roles_usuario 
  (
    id_rol serial not null ,
    rol_usuario varchar(100) not null ,
    primary key (rol_usuario)  constraint "root".pk_rol_usuario
  );

revoke all on "root".roles_usuario from "public" as "root";

{ TABLE "root".estados_usuario row size = 105 number of columns = 2 index size = 115 }

{ unload file name = estad00101.unl number of rows = 4 }

create table "root".estados_usuario 
  (
    id_estado serial not null ,
    estado_usuario varchar(100) not null ,
    primary key (estado_usuario)  constraint "root".pk_estado_usuario
  );

revoke all on "root".estados_usuario from "public" as "root";

{ TABLE "root".usuarios row size = 568 number of columns = 9 index size = 318 }

{ unload file name = usuar00102.unl number of rows = 18 }

create table "root".usuarios 
  (
    usuario varchar(100),
    nombre varchar(100) not null ,
    apellido varchar(100) not null ,
    contrasena varchar(50) not null ,
    eliminado smallint 
        default 0 not null ,
    estado_usuario varchar(100) not null ,
    rol_usuario varchar(100) not null ,
    conectado smallint 
        default 0 not null ,
    ultima_conexion datetime year to second,
    
    check (eliminado IN (1 ,0 )),
    
    check (conectado IN (1 ,0 )),
    primary key (usuario)  constraint "root".pk_usuario
  );

revoke all on "root".usuarios from "public" as "root";

{ TABLE "root".estados_lote row size = 105 number of columns = 2 index size = 115 }

{ unload file name = estad00103.unl number of rows = 3 }

create table "root".estados_lote 
  (
    id_estado serial not null ,
    estado_lote varchar(100),
    primary key (estado_lote)  constraint "root".pk_estado_lote
  );

revoke all on "root".estados_lote from "public" as "root";

{ TABLE "root".lotes row size = 619 number of columns = 9 index size = 221 }

{ unload file name = lotes00104.unl number of rows = 1 }

create table "root".lotes 
  (
    id_lote serial not null ,
    nombre_lote varchar(100) not null ,
    tipo_vehiculos varchar(50) not null ,
    cantidad_vehiculos smallint not null ,
    descripcion varchar(254) not null ,
    asignado smallint 
        default 0 not null ,
    estado_lote varchar(100) not null ,
    eliminado smallint 
        default 0 not null ,
    usuario_creador varchar(100) not null ,
    
    check (asignado IN (1 ,0 )),
    
    check (eliminado IN (1 ,0 )),
    primary key (id_lote)  constraint "root".pk_id_lote
  );

revoke all on "root".lotes from "public" as "root";

{ TABLE "root".estados_vehiculo row size = 105 number of columns = 2 index size = 115 }

{ unload file name = estad00105.unl number of rows = 10 }

create table "root".estados_vehiculo 
  (
    id_estado serial not null ,
    estado_vehiculo varchar(100),
    primary key (estado_vehiculo)  constraint "root".pk_estado_vehiculo
  );

revoke all on "root".estados_vehiculo from "public" as "root";

{ TABLE "root".tipos_vehiculo row size = 105 number of columns = 2 index size = 115 }

{ unload file name = tipos00106.unl number of rows = 2 }

create table "root".tipos_vehiculo 
  (
    id_tipo serial not null ,
    tipo_vehiculo varchar(100),
    primary key (tipo_vehiculo)  constraint "root".pk_tipo_vehiculo
  );

revoke all on "root".tipos_vehiculo from "public" as "root";

{ TABLE "root".vehiculos row size = 531 number of columns = 10 index size = 235 }

{ unload file name = vehic00107.unl number of rows = 42 }

create table "root".vehiculos 
  (
    vin_vehiculo varchar(17),
    marca varchar(100) not null ,
    modelo varchar(100) not null ,
    tipo_vehiculo varchar(100) not null ,
    anualidad smallint not null ,
    color varchar(100) not null ,
    estado_vehiculo varchar(100) not null ,
    codigo_qr smallint 
        default 0 not null ,
    baja smallint 
        default 0 not null ,
    eliminado smallint 
        default 0 not null ,
    
    check (codigo_qr IN (1 ,0 )),
    
    check (baja IN (1 ,0 )),
    
    check (eliminado IN (1 ,0 )),
    primary key (vin_vehiculo)  constraint "root".pk_vin_vehiculo
  );

revoke all on "root".vehiculos from "public" as "root";

{ TABLE "root".tipos_ubicaciones row size = 206 number of columns = 3 index size = 115 }

{ unload file name = tipos00108.unl number of rows = 3 }

create table "root".tipos_ubicaciones 
  (
    id_tipo serial not null ,
    tipo_ubicacion varchar(100),
    ubicacion varchar(100) not null ,
    primary key (tipo_ubicacion)  constraint "root".pk_tipo_ubicacion
  );

revoke all on "root".tipos_ubicaciones from "public" as "root";

{ TABLE "root".ubicaciones row size = 210 number of columns = 5 index size = 115 }

{ unload file name = ubica00109.unl number of rows = 11 }

create table "root".ubicaciones 
  (
    id_ubicacion serial not null ,
    nombre_ubicacion varchar(100) not null ,
    capacidad_maxima smallint not null ,
    cantidad_vehiculos_actual smallint,
    tipo_ubicacion varchar(100),
    primary key (id_ubicacion)  constraint "root".pk_id_ubicacion
  );

revoke all on "root".ubicaciones from "public" as "root";

{ TABLE "root".inspecciones row size = 235 number of columns = 7 index size = 138 }

{ unload file name = inspe00110.unl number of rows = 6 }

create table "root".inspecciones 
  (
    id_inspeccion serial not null ,
    incidente_vehiculo smallint 
        default 0 not null ,
    vin_vehiculo varchar(17) not null ,
    usuario_inspector varchar(100) not null ,
    ubicacion varchar(100) not null ,
    fecha_hora datetime year to second not null ,
    eliminado char(1) 
        default '0',
    
    check (incidente_vehiculo IN (1 ,0 )),
    
    check (eliminado IN ('1' ,'0' )),
    primary key (id_inspeccion)  constraint "root".pk_id_inspeccion
  );

revoke all on "root".inspecciones from "public" as "root";

{ TABLE "root".desperfectos_vehiculos row size = 264 number of columns = 4 index size = 18 }

{ unload file name = despe00111.unl number of rows = 0 }

create table "root".desperfectos_vehiculos 
  (
    id_desperfecto serial not null ,
    id_inspeccion integer not null ,
    observacion varchar(254) not null ,
    eliminado char(1) 
        default '0',
    
    check (eliminado IN ('1' ,'0' )),
    primary key (id_desperfecto)  constraint "root".pk_id_desperfecto
  );

revoke all on "root".desperfectos_vehiculos from "public" as "root";

{ TABLE "root".imagenes_desperfectos row size = 264 number of columns = 4 index size = 273 }

{ unload file name = image00112.unl number of rows = 0 }

create table "root".imagenes_desperfectos 
  (
    id_imagen serial not null ,
    ruta_imagen varchar(254) not null ,
    id_desperfecto integer,
    eliminado char(1) 
        default '0',
    
    check (eliminado IN ('1' ,'0' )),
    primary key (id_imagen,ruta_imagen)  constraint "root".pk_id_imagen_ruta_imagen
  );

revoke all on "root".imagenes_desperfectos from "public" as "root";

{ TABLE "root".ingreso_vehiculos row size = 127 number of columns = 3 index size = 129 }

{ unload file name = ingre00113.unl number of rows = 0 }

create table "root".ingreso_vehiculos 
  (
    vin_vehiculo varchar(17),
    usuario varchar(100) not null ,
    fecha_hora datetime year to second not null ,
    primary key (vin_vehiculo)  constraint "root".pk_vin_vehiculo_ingreso
  );

revoke all on "root".ingreso_vehiculos from "public" as "root";

{ TABLE "root".asignacion_ubicaciones_vehiculos row size = 136 number of columns = 6 index size = 169 }

{ unload file name = asign00114.unl number of rows = 0 }

create table "root".asignacion_ubicaciones_vehiculos 
  (
    id_asignacion serial not null ,
    vin_vehiculo varchar(17),
    id_ubicacion integer,
    usuario varchar(100) not null ,
    fecha_hora datetime year to second,
    activo char(1) 
        default '1',
    
    check (activo IN ('0' ,'1' )),
    primary key (id_asignacion,vin_vehiculo,id_ubicacion)  constraint "root".pk_asignacion_vin_ubicacion
  );

revoke all on "root".asignacion_ubicaciones_vehiculos from "public" as "root";

{ TABLE "root".transporte_lotes row size = 226 number of columns = 6 index size = 128 }

{ unload file name = trans00115.unl number of rows = 0 }

create table "root".transporte_lotes 
  (
    id_lote integer,
    id_transporte serial not null ,
    ubicacion varchar(100) not null ,
    fecha_hora_salida datetime year to second not null ,
    fecha_hora_llegada datetime year to second,
    usuario_transportista varchar(100) not null ,
    primary key (id_lote,id_transporte)  constraint "root".pk_id_lote_transporte
  );

revoke all on "root".transporte_lotes from "public" as "root";

{ TABLE "root".vehiculos_lote row size = 22 number of columns = 2 index size = 32 }

{ unload file name = vehic00116.unl number of rows = 1 }

create table "root".vehiculos_lote 
  (
    vin_vehiculo varchar(17),
    id_lote integer not null ,
    primary key (vin_vehiculo)  constraint "root".pk_vin_vehiculo_lote
  );

revoke all on "root".vehiculos_lote from "public" as "root";

{ TABLE "root".telefonos_usuarios row size = 109 number of columns = 3 index size = 106 }

{ unload file name = telef00117.unl number of rows = 4 }

create table "root".telefonos_usuarios 
  (
    usuario varchar(100),
    telefono_particular integer,
    telefono_domicilio integer,
    primary key (usuario)  constraint "root".pk_usuario_telefonos
  );

revoke all on "root".telefonos_usuarios from "public" as "root";




grant select on "root".roles_usuario to "administrador" as "root";
grant select on "root".roles_usuario to "operario_patio" as "root";
grant select on "root".roles_usuario to "operario_puerto" as "root";
grant select on "root".roles_usuario to "transportista" as "root";
grant select on "root".estados_usuario to "administrador" as "root";
grant select on "root".estados_usuario to "operario_puerto" as "root";
grant select on "root".estados_usuario to "transportista" as "root";
grant select on "root".usuarios to "administrador" as "root";
grant update(nombre) on "root".usuarios to "administrador" as "root";
grant update(apellido) on "root".usuarios to "administrador" as "root";
grant update(contrasena) on "root".usuarios to "administrador" as "root";
grant update(eliminado) on "root".usuarios to "administrador" as "root";
grant update(estado_usuario) on "root".usuarios to "administrador" as "root";
grant update(rol_usuario) on "root".usuarios to "administrador" as "root";
grant update(conectado) on "root".usuarios to "administrador" as "root";
grant update(ultima_conexion) on "root".usuarios to "administrador" as "root";
grant insert on "root".usuarios to "administrador" as "root";
grant delete on "root".usuarios to "administrador" as "root";
grant select on "root".usuarios to "operario_patio" as "root";
grant update(estado_usuario) on "root".usuarios to "operario_patio" as "root";
grant update(conectado) on "root".usuarios to "operario_patio" as "root";
grant update(ultima_conexion) on "root".usuarios to "operario_patio" as "root";
grant select on "root".usuarios to "transportista" as "root";
grant update(estado_usuario) on "root".usuarios to "transportista" as "root";
grant update(conectado) on "root".usuarios to "transportista" as "root";
grant update(ultima_conexion) on "root".usuarios to "transportista" as "root";
grant select on "root".estados_lote to "administrador" as "root";
grant select on "root".estados_lote to "operario_puerto" as "root";
grant select on "root".estados_lote to "transportista" as "root";
grant select on "root".lotes to "administrador" as "root";
grant update(nombre_lote) on "root".lotes to "administrador" as "root";
grant update(tipo_vehiculos) on "root".lotes to "administrador" as "root";
grant update(cantidad_vehiculos) on "root".lotes to "administrador" as "root";
grant update(descripcion) on "root".lotes to "administrador" as "root";
grant update(estado_lote) on "root".lotes to "administrador" as "root";
grant update(eliminado) on "root".lotes to "administrador" as "root";
grant insert on "root".lotes to "administrador" as "root";
grant select on "root".lotes to "operario_puerto" as "root";
grant update(nombre_lote) on "root".lotes to "operario_puerto" as "root";
grant update(tipo_vehiculos) on "root".lotes to "operario_puerto" as "root";
grant update(cantidad_vehiculos) on "root".lotes to "operario_puerto" as "root";
grant update(descripcion) on "root".lotes to "operario_puerto" as "root";
grant update(estado_lote) on "root".lotes to "operario_puerto" as "root";
grant update(eliminado) on "root".lotes to "operario_puerto" as "root";
grant insert on "root".lotes to "operario_puerto" as "root";
grant select on "root".lotes to "transportista" as "root";
grant update(asignado) on "root".lotes to "transportista" as "root";
grant update(estado_lote) on "root".lotes to "transportista" as "root";
grant select on "root".estados_vehiculo to "administrador" as "root";
grant select on "root".estados_vehiculo to "operario_patio" as "root";
grant select on "root".estados_vehiculo to "operario_puerto" as "root";
grant select on "root".estados_vehiculo to "transportista" as "root";
grant select on "root".tipos_vehiculo to "administrador" as "root";
grant select on "root".tipos_vehiculo to "operario_patio" as "root";
grant select on "root".tipos_vehiculo to "operario_puerto" as "root";
grant select on "root".tipos_vehiculo to "transportista" as "root";
grant select on "root".vehiculos to "administrador" as "root";
grant update(marca) on "root".vehiculos to "administrador" as "root";
grant update(modelo) on "root".vehiculos to "administrador" as "root";
grant update(tipo_vehiculo) on "root".vehiculos to "administrador" as "root";
grant update(anualidad) on "root".vehiculos to "administrador" as "root";
grant update(color) on "root".vehiculos to "administrador" as "root";
grant update(estado_vehiculo) on "root".vehiculos to "administrador" as "root";
grant update(codigo_qr) on "root".vehiculos to "administrador" as "root";
grant update(baja) on "root".vehiculos to "administrador" as "root";
grant update(eliminado) on "root".vehiculos to "administrador" as "root";
grant insert on "root".vehiculos to "administrador" as "root";
grant delete on "root".vehiculos to "administrador" as "root";
grant select on "root".vehiculos to "operario_patio" as "root";
grant update(estado_vehiculo) on "root".vehiculos to "operario_patio" as "root";
grant update(baja) on "root".vehiculos to "operario_patio" as "root";
grant select on "root".vehiculos to "operario_puerto" as "root";
grant update(estado_vehiculo) on "root".vehiculos to "operario_puerto" as "root";
grant update(codigo_qr) on "root".vehiculos to "operario_puerto" as "root";
grant select on "root".vehiculos to "transportista" as "root";
grant update(estado_vehiculo) on "root".vehiculos to "transportista" as "root";
grant select on "root".tipos_ubicaciones to "administrador" as "root";
grant select on "root".tipos_ubicaciones to "operario_patio" as "root";
grant select on "root".ubicaciones to "administrador" as "root";
grant update(nombre_ubicacion) on "root".ubicaciones to "administrador" as "root";
grant update(capacidad_maxima) on "root".ubicaciones to "administrador" as "root";
grant update(cantidad_vehiculos_actual) on "root".ubicaciones to "administrador" as "root";
grant update(tipo_ubicacion) on "root".ubicaciones to "administrador" as "root";
grant insert on "root".ubicaciones to "administrador" as "root";
grant delete on "root".ubicaciones to "administrador" as "root";
grant select on "root".ubicaciones to "operario_patio" as "root";
grant update(cantidad_vehiculos_actual) on "root".ubicaciones to "operario_patio" as "root";
grant select on "root".inspecciones to "administrador" as "root";
grant update(incidente_vehiculo) on "root".inspecciones to "administrador" as "root";
grant insert on "root".inspecciones to "administrador" as "root";
grant select on "root".inspecciones to "operario_patio" as "root";
grant update(incidente_vehiculo) on "root".inspecciones to "operario_patio" as "root";
grant insert on "root".inspecciones to "operario_patio" as "root";
grant select on "root".inspecciones to "operario_puerto" as "root";
grant update(incidente_vehiculo) on "root".inspecciones to "operario_puerto" as "root";
grant insert on "root".inspecciones to "operario_puerto" as "root";
grant select on "root".desperfectos_vehiculos to "administrador" as "root";
grant update(observacion) on "root".desperfectos_vehiculos to "administrador" as "root";
grant insert on "root".desperfectos_vehiculos to "administrador" as "root";
grant select on "root".desperfectos_vehiculos to "operario_patio" as "root";
grant update(observacion) on "root".desperfectos_vehiculos to "operario_patio" as "root";
grant insert on "root".desperfectos_vehiculos to "operario_patio" as "root";
grant select on "root".desperfectos_vehiculos to "operario_puerto" as "root";
grant update(observacion) on "root".desperfectos_vehiculos to "operario_puerto" as "root";
grant insert on "root".desperfectos_vehiculos to "operario_puerto" as "root";
grant select on "root".imagenes_desperfectos to "administrador" as "root";
grant update(ruta_imagen) on "root".imagenes_desperfectos to "administrador" as "root";
grant insert on "root".imagenes_desperfectos to "administrador" as "root";
grant select on "root".imagenes_desperfectos to "operario_patio" as "root";
grant update(ruta_imagen) on "root".imagenes_desperfectos to "operario_patio" as "root";
grant insert on "root".imagenes_desperfectos to "operario_patio" as "root";
grant select on "root".imagenes_desperfectos to "operario_puerto" as "root";
grant update(ruta_imagen) on "root".imagenes_desperfectos to "operario_puerto" as "root";
grant insert on "root".imagenes_desperfectos to "operario_puerto" as "root";
grant select on "root".ingreso_vehiculos to "administrador" as "root";
grant update on "root".ingreso_vehiculos to "administrador" as "root";
grant insert on "root".ingreso_vehiculos to "administrador" as "root";
grant delete on "root".ingreso_vehiculos to "administrador" as "root";
grant select on "root".asignacion_ubicaciones_vehiculos to "administrador" as "root";
grant update(activo) on "root".asignacion_ubicaciones_vehiculos to "administrador" as "root";
grant insert on "root".asignacion_ubicaciones_vehiculos to "administrador" as "root";
grant select on "root".asignacion_ubicaciones_vehiculos to "operario_patio" as "root";
grant update(activo) on "root".asignacion_ubicaciones_vehiculos to "operario_patio" as "root";
grant insert on "root".asignacion_ubicaciones_vehiculos to "operario_patio" as "root";
grant select on "root".transporte_lotes to "administrador" as "root";
grant update(fecha_hora_llegada) on "root".transporte_lotes to "administrador" as "root";
grant insert on "root".transporte_lotes to "administrador" as "root";
grant select on "root".transporte_lotes to "transportista" as "root";
grant update(fecha_hora_llegada) on "root".transporte_lotes to "transportista" as "root";
grant insert on "root".transporte_lotes to "transportista" as "root";
grant select on "root".vehiculos_lote to "administrador" as "root";
grant insert on "root".vehiculos_lote to "administrador" as "root";
grant delete on "root".vehiculos_lote to "administrador" as "root";
grant select on "root".vehiculos_lote to "operario_patio" as "root";
grant update on "root".vehiculos_lote to "operario_patio" as "root";
grant select on "root".vehiculos_lote to "operario_puerto" as "root";
grant insert on "root".vehiculos_lote to "operario_puerto" as "root";
grant delete on "root".vehiculos_lote to "operario_puerto" as "root";
grant select on "root".vehiculos_lote to "public" as "root";
grant update on "root".vehiculos_lote to "public" as "root";
grant insert on "root".vehiculos_lote to "public" as "root";
grant delete on "root".vehiculos_lote to "public" as "root";
grant index on "root".vehiculos_lote to "public" as "root";
grant select on "root".telefonos_usuarios to "administrador" as "root";
grant update(telefono_particular) on "root".telefonos_usuarios to "administrador" as "root";
grant update(telefono_domicilio) on "root".telefonos_usuarios to "administrador" as "root";
grant insert on "root".telefonos_usuarios to "administrador" as "root";
grant delete on "root".telefonos_usuarios to "administrador" as "root";
















revoke usage on language SPL from public ;

grant usage on language SPL to public ;



create view "root".vista_estados_vehiculo (vin_vehiculo,estado_vehiculo) as 
  select x0.vin_vehiculo ,x0.estado_vehiculo from "root".vehiculos 
    x0 ;                                                     
                                                             
     
create view "root".vista_inspecciones_patio_no_eliminados (id_inspeccion,incidente_vehiculo,vin_vehiculo,usuario_inspector,ubicacion,fecha_hora,eliminado) as 
  select x0.id_inspeccion ,x0.incidente_vehiculo ,x0.vin_vehiculo 
    ,x0.usuario_inspector ,x0.ubicacion ,x0.fecha_hora ,x0.eliminado 
    from "root".inspecciones x0 where ((x0.ubicacion = 'PATIO' 
    ) AND (x0.eliminado = 0 ) ) ;                            
                                                             
                                                        
create view "root".vista_inspecciones_patio_eliminados (id_inspeccion,incidente_vehiculo,vin_vehiculo,usuario_inspector,ubicacion,fecha_hora,eliminado) as 
  select x0.id_inspeccion ,x0.incidente_vehiculo ,x0.vin_vehiculo 
    ,x0.usuario_inspector ,x0.ubicacion ,x0.fecha_hora ,x0.eliminado 
    from "root".inspecciones x0 where ((x0.ubicacion = 'PATIO' 
    ) AND (x0.eliminado = '1' ) ) ;                           
                                                             
                                                          
create view "root".vista_inspecciones_puerto_no_eliminados (id_inspeccion,incidente_vehiculo,vin_vehiculo,usuario_inspector,ubicacion,fecha_hora,eliminado) as 
  select x0.id_inspeccion ,x0.incidente_vehiculo ,x0.vin_vehiculo 
    ,x0.usuario_inspector ,x0.ubicacion ,x0.fecha_hora ,x0.eliminado 
    from "root".inspecciones x0 where ((x0.ubicacion = 'PUERTO'
     ) AND (x0.eliminado = 0 ) ) ;                           
                                                             
                                                       
create view "root".vista_inspecciones_puerto_eliminados (id_inspeccion,incidente_vehiculo,vin_vehiculo,usuario_inspector,ubicacion,fecha_hora,eliminado) as 
  select x0.id_inspeccion ,x0.incidente_vehiculo ,x0.vin_vehiculo 
    ,x0.usuario_inspector ,x0.ubicacion ,x0.fecha_hora ,x0.eliminado 
    from "root".inspecciones x0 where ((x0.ubicacion = 'PUERTO'
     ) AND (x0.eliminado = '1' ) ) ;                          
                                                             
                                                         
create view "root".vista_cantidad_vehiculos_lote (id_lote,cantidad_vehiculos) as 
  select x0.id_lote ,x0.cantidad_vehiculos from "root".lotes x0 
    ;                                                        
                                                            
create view "root".vista_tipo_camioneta_lotes (id_lote,tipo_vehiculos,cantidad_vehiculos,estado_lote,usuario_creador) as 
  select x0.id_lote ,x0.tipo_vehiculos ,x0.cantidad_vehiculos 
    ,x0.estado_lote ,x0.usuario_creador from "root".lotes x0 where 
    (x0.tipo_vehiculos = 'CAMIONETA' ) ;                      
                                                             
                                                             
                                                             
                                           
create view "root".vista_tipo_auto_lotes (id_lote,tipo_vehiculos,cantidad_vehiculos,estado_lote,usuario_creador) as 
  select x0.id_lote ,x0.tipo_vehiculos ,x0.cantidad_vehiculos 
    ,x0.estado_lote ,x0.usuario_creador from "root".lotes x0 where 
    (x0.tipo_vehiculos = 'AUTO' ) ;                           
                                                             
                                                             
                                                             
                                                
create view "root".vista_lotes_eliminados (id_lote,eliminado) as 
  select x0.id_lote ,x0.eliminado from "root".lotes x0 where (x0.eliminado 
    = 1 ) ;                                                  
                                                             
        
create view "root".vista_lotes_asignados (id_lote,asignado) as 
  select x0.id_lote ,x0.asignado from "root".lotes x0 where (x0.asignado 
    = 1 ) ;                                                  
                                                             
            
create view "root".vista_lotes_no_asignados (id_lote,asignado) as 
  select x0.id_lote ,x0.asignado from "root".lotes x0 where (x0.asignado 
    = 0 ) ;                                                  
                                                             
         
create view "root".vista_vehiculos_sin_lote (vin_vehiculo,marca,modelo,tipo_vehiculo) as 
  select x0.vin_vehiculo ,x0.marca ,x0.modelo ,x0.tipo_vehiculo 
    from "root".vehiculos x0 where (x0.vin_vehiculo != ALL (select 
    x1.vin_vehiculo from "root".vehiculos_lote x1 ) ) ;       
                                                             
                                                             
                                                             
                                                             
                
create view "root".vista_vehiculos_con_lote (vin_vehiculo,marca,modelo,tipo_vehiculo) as 
  select x0.vin_vehiculo ,x0.marca ,x0.modelo ,x0.tipo_vehiculo 
    from "root".vehiculos x0 where (x0.vin_vehiculo = ANY (select 
    x1.vin_vehiculo from "root".vehiculos_lote x1 ) ) ;       
                                                             
                                                             
                                                             
                                                             
                 
create view "root".vista_usuarios_activos (usuario,contrasena,eliminado,estado_usuario) as 
  select x0.usuario ,x0.contrasena ,x0.eliminado ,x0.estado_usuario 
    from "root".usuarios x0 where ((x0.eliminado = 0 ) AND (x0.estado_usuario 
    = 'ACTIVO' ) ) ;         
create view "root".vista_usuarios_eliminados (usuario,contrasena,eliminado,estado_usuario) as 
  select x0.usuario ,x0.contrasena ,x0.eliminado ,x0.estado_usuario 
    from "root".usuarios x0 where ((x0.eliminado = 1 ) AND (x0.estado_usuario 
    = 'INACTIVO' ) ) ;    
create view "root".vista_usuarios_bloqueados (usuario,contrasena,eliminado,estado_usuario) as 
  select x0.usuario ,x0.contrasena ,x0.eliminado ,x0.estado_usuario 
    from "root".usuarios x0 where ((x0.eliminado = 0 ) AND (x0.estado_usuario 
    = 'BLOQUEADO' ) ) ;   
create view "root".vista_usuarios_suspendidos (usuario,contrasena,eliminado,estado_usuario) as 
  select x0.usuario ,x0.contrasena ,x0.eliminado ,x0.estado_usuario 
    from "root".usuarios x0 where ((x0.eliminado = 0 ) AND (x0.estado_usuario 
    = 'SUSPENDIDO' ) ) ; 
create view "root".vista_vehiculos_con_qr (vin_vehiculo,marca,modelo,tipo_vehiculo,codigo_qr) as 
  select x0.vin_vehiculo ,x0.marca ,x0.modelo ,x0.tipo_vehiculo 
    ,x0.codigo_qr from "root".vehiculos x0 where (x0.codigo_qr 
    = 1 ) ;                               
create view "root".vista_vehiculos_sin_qr (vin_vehiculo,marca,modelo,tipo_vehiculo,codigo_qr) as 
  select x0.vin_vehiculo ,x0.marca ,x0.modelo ,x0.tipo_vehiculo 
    ,x0.codigo_qr from "root".vehiculos x0 where (x0.codigo_qr 
    = 0 ) ;                               
create view "root".vista_vehiculos_dados_baja (vin_vehiculo,marca,modelo,tipo_vehiculo,baja) as 
  select x0.vin_vehiculo ,x0.marca ,x0.modelo ,x0.tipo_vehiculo 
    ,x0.baja from "root".vehiculos x0 where (x0.baja = 1 ) ;  
                                            



create unique index "root".id_rol_index on "root".roles_usuario 
    (id_rol) using btree ;
create unique index "root".id_estados_usuario_index on "root".estados_usuario 
    (id_estado) using btree ;
create unique index "root".id_estado_lote_index on "root".estados_lote 
    (id_estado) using btree ;
create unique index "root".id_estado_vehiculo_index on "root".estados_vehiculo 
    (id_estado) using btree ;
create unique index "root".id_tipo_vehiculo_index on "root".tipos_vehiculo 
    (id_tipo) using btree ;
create unique index "root".id_tipo_ubicacion_index on "root".tipos_ubicaciones 
    (id_tipo) using btree ;



alter table "root".usuarios add constraint (foreign key (estado_usuario) 
    references "root".estados_usuario );
alter table "root".usuarios add constraint (foreign key (rol_usuario) 
    references "root".roles_usuario );
alter table "root".lotes add constraint (foreign key (usuario_creador) 
    references "root".usuarios );
alter table "root".lotes add constraint (foreign key (estado_lote) 
    references "root".estados_lote );
alter table "root".vehiculos add constraint (foreign key (estado_vehiculo) 
    references "root".estados_vehiculo );
alter table "root".vehiculos add constraint (foreign key (tipo_vehiculo) 
    references "root".tipos_vehiculo );
alter table "root".ubicaciones add constraint (foreign key (tipo_ubicacion) 
    references "root".tipos_ubicaciones );
alter table "root".inspecciones add constraint (foreign key (vin_vehiculo) 
    references "root".vehiculos );
alter table "root".inspecciones add constraint (foreign key (usuario_inspector) 
    references "root".usuarios );
alter table "root".desperfectos_vehiculos add constraint (foreign 
    key (id_inspeccion) references "root".inspecciones );
alter table "root".imagenes_desperfectos add constraint (foreign 
    key (id_desperfecto) references "root".desperfectos_vehiculos 
    );
alter table "root".ingreso_vehiculos add constraint (foreign 
    key (vin_vehiculo) references "root".vehiculos );
alter table "root".ingreso_vehiculos add constraint (foreign 
    key (usuario) references "root".usuarios );
alter table "root".asignacion_ubicaciones_vehiculos add constraint 
    (foreign key (vin_vehiculo) references "root".vehiculos );
    
alter table "root".asignacion_ubicaciones_vehiculos add constraint 
    (foreign key (id_ubicacion) references "root".ubicaciones 
    );
alter table "root".asignacion_ubicaciones_vehiculos add constraint 
    (foreign key (usuario) references "root".usuarios );
alter table "root".transporte_lotes add constraint (foreign key 
    (id_lote) references "root".lotes );
alter table "root".transporte_lotes add constraint (foreign key 
    (usuario_transportista) references "root".usuarios );
alter table "root".vehiculos_lote add constraint (foreign key 
    (id_lote) references "root".lotes );
alter table "root".vehiculos_lote add constraint (foreign key 
    (vin_vehiculo) references "root".vehiculos );
alter table "root".telefonos_usuarios add constraint (foreign 
    key (usuario) references "root".usuarios );






update statistics medium for table "informix".sysaggregates (
     owner) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".sysams (
     am_owner) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".sysblobs (
     colno) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".syscasts (
     argument_xid, result_xid) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".syschecks (
     seqno, type) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".syscolauth (
     colno, grantee, grantor) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".syscoldepend (
     colno) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".syscolumns (
     colno) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".sysconstraints (
     owner) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".sysdefaults (
     class, colno) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".sysdistrib (
     colno, seqno) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".sysfragments (
     evalpos, fragtype, indexname) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".sysindices (
     owner) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".syslangauth (
     grantee, grantor) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".sysobjstate (
     name, owner) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".sysopclasses (
     owner) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".sysprocauth (
     grantee, grantor) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".sysprocbody (
     datakey, seqno) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".sysproccolumns (
     paramid) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".sysprocedures (
     isproc, numargs, owner) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".sysprocplan (
     datakey, planid, seqno) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".systabauth (
     grantee, grantor) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".systables (
     owner) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".sysviews (
     seqno) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".sysxtddesc (
     seqno) 
     resolution   2.00000   0.95000 ;
update statistics medium for table "informix".sysxtdtypes (
     owner, source) 
     resolution   2.00000   0.95000 ;

 



