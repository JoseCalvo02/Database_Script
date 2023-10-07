-- TABLA CATEGORIAS
create table categorias(
    codigo_categoria varchar2(6) not null, 
    nombre_categoria varchar2(60) not null,
    constraint pk_categorias primary key(codigo_categoria)
 );

-- TABLA PRODUCTOS
create table productos(
    codigo_producto varchar2(6),  
    serie_producto   varchar2(200) not null,
    desc_producto    varchar2(250) not null,
    precio_producto   varchar2(200) not null,
    codigo_categoria varchar2(6),
    constraint pk_productos primary key(codigo_producto)
 );
 
 
 
 -- LLAVE FORANEA EN LA TABLA PRODUCTOS
 ALTER TABLE productos ADD (
  CONSTRAINT fk_codigo_categoria
  FOREIGN KEY (codigo_categoria) 
  REFERENCES categorias (codigo_categoria));
 
 -- TABLA CLIENTES
 create table clientes(
    codigo_cliente      varchar2(6), 
    nombre_cliente      varchar2(200) not null,
    apellido_cliente    varchar2(250) not null,
    direccion_cliente   varchar2(200) not null,
    nombre_ciudad       varchar2(20) not null,
    correo_cliente      varchar2(60) not null,
    telefono_cliente    varchar2(60) not null,
    fecha_registro      date not null,
    constraint pk_clientes primary key (codigo_cliente)
 );
 
 -- TABLA VENDEDOR
  create table vendedor(
    codigo_vendedor      varchar2(6), 
    nombre_vendedor      varchar2(200) not null,
    correo_vendedor      varchar2(60) not null,
    comision_vendedor     varchar2(250) not null,
    fecha_contratacion   date not null,
    constraint pk_vendedor primary key (codigo_vendedor)
 );
 
 -- TABLA TIPO DE DOCUMENTO
   create table tipo_Documento(
    codigo_documento      varchar2(6), 
    indicador_documento   varchar2(6) not null,
    documento_desc        varchar2(250) not null,
    constraint pk_documento primary key (codigo_documento)
 );
 
 -- TABLA VALIDAR QUE EN LA TABLA DE TIPO DE DOCUMENTO SOLO ACEPTE ESOS DATOS V,C,R,V
 alter table tipo_Documento add (
  constraint ck_tipos_docu_ind_docu 
  check(indicador_documento in ('V','C','R','V'))
 );
 
-- TABLA PROVEDOR 

   create table provedor(
    codigo_provedor        varchar2(6), 
    nombre_provedor        varchar2(200) not null,
    direccion_provedor     varchar2(60) not null,
    nombre_pais            varchar2(250) not null,
    correo_provedor        varchar2(250) not null,
    telefono_provedor        varchar2(250) not null, 
    fecha_registro   date not null,
    constraint pk_provedor primary key (codigo_provedor)
 );
 
 -- TABLA ALMACEN
 
    create table almacen(
    codigo_almacen        varchar2(6), 
    nombre_almacen        varchar2(200) not null,
    direccion_almacen     varchar2(60) not null,
    telefono_almacen        varchar2(250) not null,
    constraint pk_almacen primary key (codigo_almacen)
 );
 
 -- TABLA DE EXISTENCIAS
 
 create table stock(
    codigo_producto varchar2(6), 
    cantidad_articulo  varchar2(200) not null, 
    codigo_almacen varchar2(6) not null,
    constraint pk_stock primary key(codigo_producto)
 );
 
 
 -- LLAVE FORANEA DEL CAMPO DEL ALMACEN
 ALTER TABLE stock ADD (
  CONSTRAINT fk_codigo_producto
  FOREIGN KEY (codigo_producto) 
  REFERENCES almacen (codigo_almacen));
  

-- Creacion de tablas de facturas, compras, pagos y detalle de cada una

-- TABLA FACTURAS
create table factura(
    codigo_factura   varchar2(6), 
    numero_factura   varchar2(200) not null,
    total_factura    varchar2(250) not null,
    tipo_documento   varchar2(200) not null,
    codigo_cliente   varchar2(200) not null,
    fecha_factura    date not null,
    constraint pk_factura primary key(tipo_documento)
 );
 
 -- LLAVES FORANEAS
 ALTER TABLE factura ADD (
  CONSTRAINT fk_tipo_documento
  FOREIGN KEY (tipo_documento) 
  REFERENCES tipo_Documento (codigo_documento));
  
 ALTER TABLE factura ADD (
  CONSTRAINT fk_codigo_cliente
  FOREIGN KEY (codigo_cliente) 
  REFERENCES clientes (codigo_cliente));
-- HASTA AUI FACTURAS

-- TABLA COMPRAS

 create table compra(
    codigo_compra     varchar2(6), 
    codigo_provedor   varchar2(200) not null,
    numero_factura    varchar2(250) not null,
    tipo_documento    varchar2(200) not null,
    total_compra      varchar2(200) not null,
    fecha_compra     date not null,
    constraint pk_compra primary key(codigo_compra)
 );
 
  ALTER TABLE compra ADD (
  CONSTRAINT fk_codigo_provedor
  FOREIGN KEY (codigo_provedor) 
  REFERENCES provedor (codigo_provedor));
  

-- HASTA AQUI SE AGREGARON LLAVES FORANEAS

-- TABLA PAGOS

 create table pagos(
    id_pago           varchar2(6), 
    codigo_cliente   varchar2(200) not null,
    fecha_pago     date not null,
    tipo_documento    varchar2(200) not null,
    monto_pagado    varchar2(250) not null,
    concepto_pago      varchar2(200) not null,
    constraint pk_pago primary key(id_pago)
 );
 
  ALTER TABLE pagos ADD (
  CONSTRAINT fk_codigo_cliente_pagos
  FOREIGN KEY (codigo_cliente) 
  REFERENCES clientes(codigo_cliente));
  
ALTER TABLE pagos ADD (
  CONSTRAINT fk_tipo_documento_pagos
  FOREIGN KEY (tipo_documento) 
  REFERENCES tipo_Documento(codigo_documento));
  
-- TABLA DETALLE DE FACTURAS
  
 create table detalle_Factura (
    codigo_factura           varchar2(6), 
    codigo_producto          varchar2(200) not null,
    cantidad_producto        varchar2(200) not null,
    precio_unitario          varchar2(250) not null,
    impuesto_ventas          varchar2(200) not null,
    constraint pk_detalle_factura primary key(codigo_factura)
 );

ALTER TABLE detalle_Factura ADD (
  CONSTRAINT fk_codigo_factura_detalle_factura
  FOREIGN KEY (codigo_factura) 
  REFERENCES factura(codigo_factura));
  
ALTER TABLE detalle_Factura ADD (
  CONSTRAINT fk_codigo_producto_detalle_factura
  FOREIGN KEY (codigo_producto) 
  REFERENCES productos(codigo_producto));
  
-- HASTA AQUI LA TABLA DE DETALLE DE FACTURAS CON LAS LLAVES FORANEAS


-- TABLA DETALLE DE COMPRAS

 create table detalle_Compra (
    codigo_compra           varchar2(6), 
    codigo_producto          varchar2(200) not null,
    cantidad_producto        varchar2(200) not null,
    precio_unitario          varchar2(250) not null,
    impuesto_ventas          varchar2(200) not null,
    constraint pk_detalle_compra primary key(codigo_compra)
 );
 
 ALTER TABLE detalle_Compra ADD(
    CONSTRAINT fk_codigo_compra_detalle_compra
    FOREIGN KEY (codigo_compra)
    REFERENCES compra(codigo_compra)

 );
 -- HASTA AQUI LA TABLA DE DETALLE DE COMPRAS CON LAS LLAVES FORANEAS
 
 -- TABLA DETALLE DE PAGOS
 create table detalle_Pagos (
    id_pago                 varchar2(6), 
    codigo_factura          varchar2(200) not null,
    monto                   varchar2(200) not null,
    constraint pk_detalle_pagos primary key(id_pago)
 );
 
  ALTER TABLE detalle_Pagos ADD(
    CONSTRAINT fk_id_pago_detalle_pagos
    FOREIGN KEY (id_pago)
    REFERENCES pagos(id_pago)

 );
 
   ALTER TABLE detalle_Pagos ADD(
    CONSTRAINT fk_codigo_factura_detalle_pagos
    FOREIGN KEY (codigo_factura)
    REFERENCES factura(codigo_factura)

 );
 -- HASTA AQUI LA TABLA DE DETALLE DE PAGOS CON LAS LLAVES FORANEAS
 
--                                                                       
commit; -- para guardar datos
 
drop table productos                                                                                                                                                                      
 

desc FACTURA
desc productos 

insert into categorias(codigo_categoria, nombre_categoria) values('01', 'Monitores');
 
select * from productos
    

