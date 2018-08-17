drop table if exists opiniones;
drop table if exists imagenes;
drop table if exists detalleventa;
drop table if exists detallereservacion;
drop table if exists ventas;
drop table if exists reservaciones;
drop table if exists usuarios;
drop table if exists items;
drop table if exists tipo;
drop table if exists categorias;



create table usuarios(
 nombreusuario character varying(16) primary key not null,
 clave character varying(16) not null,
 nombre1 character varying (20) not null,
 nombre2 character varying (20) null,
 apellidop character varying (20) not null,
 apellidon character varying (20) not null,
 correo character varying (50) not null unique, 
 foto character varying (50)  default 'client_01.jpg',
 direccion character varying (100) not null,
 dni character varying (50) not null
);

insert into usuarios values('evelyn','qwer123','Evelyn','','Jaramillo','','evej@gmail.com','client_01.jpg','BABAHOYO','1234567890');


select * from usuarios;


create table tipo(
idtipo int not null primary key,
descripcion character varying(20) not null
);

insert into tipo values(1,'Productos');
insert into tipo values(2,'Servicios');

create table categorias(
 idcategorias int not null primary key,
 descripcion character varying(25),
 imagen character varying(25)
);

select * from categorias;

insert into categorias values(1,'VESTIDOS','banner-02.jpg');
insert into categorias values(2,'BLUSAS','f.jpg');
insert into categorias values(3,'BOLSOS','banner-10.jpg');
insert into categorias values(4,'ACCESORIOS','banner-05.jpg');
insert into categorias values(5,'PANTALONES','banner-06.jpg');
insert into categorias values(6,'CALZADO','banner-07.jpg');

drop sequence if exists sig_item;
create sequence sig_item;
create table items(
 iditem int not null primary key default nextval('sig_item'),
 nombre character varying(50) not null,
 descripcion character varying(100) not null,
 descripcion2 character varying(1000) ,
 precio float,
 descuento float,
 idtipo int not null references tipo on update cascade on delete restrict,
 idcategorias int not null references categorias on update cascade on delete restrict,
 imagen character varying(50),
 stock int,
 rate float
);

-------------------------------------
insert into items values(default,'Maleta negra','Algo','Algo2',75.00,0,1,1,'item-02.jpg',5);
insert into items values(default,'Chaqueta azul','Algo','Algo2',36.50,0,1,1,'item-03.jpg',5);
insert into items values(default,'Reloj delgado negro','Algo','Algo2',165.90,0,1,1,'banner-03.jpg',5);
insert into items values(default,'Shorts femenino azul','Algo','Algo2',29.40,45,1,1,'item-07.jpg',5);
insert into items values(default,'Maleta negra','Algo','Algo2',75.00,0,1,1,'item-02.jpg',5);
insert into items values(default,'Chaqueta azul','Algo','Algo2',36.50,0,1,1,'item-03.jpg',5);
insert into items values(default,'Reloj delgado negro','Algo','Algo2',165.90,0,1,1,'banner-03.jpg',5);
insert into items values(default,'Shorts femenino azul','Algo','Algo2',29.40,45,1,1,'item-07.jpg',5);
/*
insert into items values(default,'Aroma Repairing Mask','Algo','Algo2',26,0,1,1,'Aromachology-Repairing-Mask-2-300x300.jpg',5);
insert into items values(default,'Aroma Repairing Mask','Algo','Algo2',26,0,1,1,'Aromachology-Repairing-Mask-2-300x300.jpg',5);
insert into items values(default,'Aroma Repairing Mask','Algo','Algo2',26,0,1,1,'Aromachology-Repairing-Mask-2-300x300.jpg',5);
insert into items values(default,'Aroma Repairing Mask','Algo','Algo2',26,0,1,1,'Aromachology-Repairing-Mask-2-300x300.jpg',5);
insert into items values(default,'Aroma Repairing Mask','Algo','Algo2',26,0,1,1,'Aromachology-Repairing-Mask-2-300x300.jpg',5);
insert into items values(default,'Aroma Repairing Mask','Algo','Algo2',26,0,1,1,'Aromachology-Repairing-Mask-2-300x300.jpg',5);
insert into items values(default,'Aroma Repairing Mask','Algo','Algo2',26,0,1,1,'Aromachology-Repairing-Mask-2-300x300.jpg',5);
insert into items values(default,'Aroma Repairing Mask','Algo','Algo2',26,0,1,1,'Aromachology-Repairing-Mask-2-300x300.jpg',5);
insert into items values(default,'Aroma Repairing Mask','Algo','Algo2',26,0,1,1,'Aromachology-Repairing-Mask-2-300x300.jpg',0);
insert into items values(default,'Aroma Repairing Mask','Algo','Algo2',26,0,1,1,'Aromachology-Repairing-Mask-2-300x300.jpg',5);
*/

select * from items;
------------------------------------------------------------------------------------------------------------------------

drop sequence if exists sig_img;
create sequence sig_img;
 create table imagenes(
  idimagen int primary key default nextval('sig_img'),
  nombre character varying (50) not null,
  iditem int not null references items on delete restrict on update cascade
 );

select * from items;
------------------------------------------------------------------------------------------------------------------------
 insert into imagenes values (default,'Aromachology-Repairing-Mask-1.jpg',7);
 insert into imagenes values (default,'Aromachology-Repairing-Mask-2.jpg',7);

------------------------------------------------------------------------------------------------------------------------
drop sequence if exists sig_opinion;
create sequence sig_opinion;

create table opiniones(
 idopinion int primary key default nextval('sig_opinion'),
 opinion character varying(200),
 nombreusuario character varying(16) references usuarios on delete restrict on update restrict,
 idproducto int references items on delete restrict on update restrict,
 fecha date not null default current_date,
 clasificacion int not null
);
------------------------------------------------------------------------------------------------------------------------
 create or replace function add_opinion(text,text,int,int) returns  void as $$
 declare
 promedio float;
 begin  
  insert into opiniones(opinion,nombreusuario,clasificacion,idproducto) values ($1,$2,$3,$4);
  select  avg(clasificacion) into promedio  from opiniones where idproducto=$4;
  update items set rate=promedio where  iditem=$4;
 end
 $$language plpgsql;
------------------------------------------------------------------------------------------------------------------------

select * from opiniones where idproducto=5;
select * from categorias where idcategorias=1;

SELECT * FROM items where idtipo=1 ORDER BY random() LIMIT 3;


drop sequence if exists sig_res;
create sequence sig_res;
create table reservaciones(
 idreserva bigint not null primary key default nextval('sig_res'),
 nombreusuario character varying(16) references usuarios on update cascade on delete restrict, 
 fecha date not null,
 hora time not null,
 total float default 0
);

create or replace function isReserva(date,time) returns boolean as $$
declare 
begin
 if exists (select idreserva from reservaciones where fecha=$1 and hora=$2) then
  return true;
 else
  return false; 
 end if;
end
$$ language plpgsql;

select * from isReserva('2018-08-14','09:00:00');

create table detallereservacion(
 idcompra bigint not null references reservaciones on update cascade on delete restrict,
 idtem int not null references items on update cascade on delete restrict,
 cantidad int not null,
 precio float not null,
 descuento float not null, 
 iva float not null default 12
);

drop sequence if exists sig_venta;
create sequence sig_venta;
create table ventas(
 idventa bigint not null primary key default nextval('sig_venta'),
 nombreusuario character varying(16) references usuarios on update cascade on delete restrict, 
 fecha date not null default current_timestamp,
 total float default 0
);

CREATE OR REPLACE FUNCTION insertarventa(
    text)    
  RETURNS bigint AS
$BODY$
  declare 
   id bigint;
  begin   
   id:=nextval('sig_venta');
   insert into ventas(idventa, nombreusuario,fecha) values(id,$1,default);
   return id;
  end
 $BODY$
  LANGUAGE plpgsql ;

create table detalleventa(
 idventa bigint not null references ventas on update cascade on delete restrict,
 idtem int not null references items on update cascade on delete restrict,
 cantidad int not null,
 precio float not null,
 descuento float not null, 
 iva float not null default 12
);

 

CREATE OR REPLACE FUNCTION insertarreserva(
    text,
    date,
    time without time zone)
  RETURNS bigint AS
$BODY$
  declare 
   id bigint;
  begin   
   id:=nextval('sig_res');
   insert into reservaciones(idreserva, nombreusuario,fecha,hora) values(id,$1,$2,$3);
   return id;
  end
 $BODY$
  LANGUAGE plpgsql ;

create or replace function actualizarTotal(bigint) returns void as
$$
declare
rec record;
suma float:=0;
IVA float:=0;
descuen float:=0;
begin
 for rec in (select precio,descuento from detallereservacion where idcompra = $1) loop 
 suma:=suma+rec.precio;
 descuen:=descuen+(rec.descuento*rec.precio/100);
 IVA:=IVA+(rec.precio*0.12);
 end loop;
 update reservaciones set total = suma - descuen + IVA where idreserva = $1;
 raise notice ' suma % descuento % iva %',suma, descuen, IVA;
end
$$
language plpgsql;


create or replace function actualizarTotal2(bigint) returns void as
$$
declare
rec record;
suma float:=0;
IVA float:=0;
descuen float:=0;
begin
 for rec in (select precio,descuento from detalleventa where idventa = $1) loop 
 suma:=suma+rec.precio;
 descuen:=descuen+(rec.descuento*rec.precio/100);
 IVA:=IVA+(rec.precio*0.12);
 end loop;
 update ventas set total = suma - descuen + IVA where idventa = $1;
 raise notice ' suma % descuento % iva %',suma, descuen, IVA;
end
$$
language plpgsql;

select * from ventas;


select to_char(v.idventa,'000000000')as numerofactura,'BEAUTY CENTER' AS razonsocial,'COMPRA DE ARTICULOS' AS concepto, dv.descuento,
cantidad,dv.precio, i.nombre as descripcion ,(dv.precio*dv.iva/100) as iva, (cantidad*dv.precio) as subtotal, ((cantidad*dv.precio)+(dv.precio*dv.iva/100)) as total , fecha as fechafactura,
nombre1,nombre2,apellidop, apellidon, u.nombreusuario, i.nombre from ventas v 
inner join detalleventa dv on v.idventa=dv.idventa
inner join items i on i.iditem=dv.idtem 
inner join usuarios u on u.nombreusuario=v.nombreusuario ;


