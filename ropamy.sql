drop database if exists ropa;

create database ropa;

use ropa;

create table perfiles (
idperfil int primary key,
descrripcion varchar(30)
 );
 
insert into perfiles values(1,'ADMINISTRADOR');
insert into perfiles values(2,'USUARIO');

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
 dni character varying (50) not null,
 idperfil int not null
);

insert into usuarios values('guisse','qwer123','Guissela','Maria','Jimenez','Balceca','guisse@gmail.com','client_01.jpg','BABAHOYO','1234567890',1);
insert into usuarios values('angie','qwer123','Angie','Gabriela','Astudillo','B','aastudillo@gmail.com','client_02.jpg','BABAHOYO','1234567890',2);


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


create table items(
 iditem int not null primary key auto_increment,
 nombre character varying(50) not null,
 descripcion character varying(100) not null,
 descripcion2 character varying(1000) ,
 precio float,
 descuento float,
 idtipo int not null references tipo on update cascade on delete restrict,
 idcategorias int not null references categorias on update cascade on delete restrict,
 imagen character varying(50),
 stock int,
 rate float default 0
);


insert into items(iditem,nombre,descripcion,descripcion2,precio,descuento,idtipo,idcategorias,imagen,stock,rate) values(default,'Maleta negra','Algo','Algo2',75.00,0.00,1,1,'item-02.jpg',5,default);
insert into items(iditem,nombre,descripcion,descripcion2,precio,descuento,idtipo,idcategorias,imagen,stock,rate) values(default,'Chaqueta azul','Algo','Algo2',36.50,0,1,1,'item-03.jpg',5,default);
insert into items(iditem,nombre,descripcion,descripcion2,precio,descuento,idtipo,idcategorias,imagen,stock,rate) values(default,'Reloj delgado negro','Algo','Algo2',165.90,0,1,1,'item-cart-05.jpg',5,default);
insert into items(iditem,nombre,descripcion,descripcion2,precio,descuento,idtipo,idcategorias,imagen,stock,rate) values(default,'Shorts femenino azul','Algo','Algo2',29.50,40,1,1,'item-07.jpg',5,default);
insert into items(iditem,nombre,descripcion,descripcion2,precio,descuento,idtipo,idcategorias,imagen,stock,rate)values(default,'Maleta negra','Algo','Algo2',75.00,0,1,1,'item-02.jpg',5,default);
insert into items(iditem,nombre,descripcion,descripcion2,precio,descuento,idtipo,idcategorias,imagen,stock,rate)values(default,'Chaqueta azul','Algo','Algo2',36.50,0,1,1,'item-03.jpg',5,default);
insert into items(iditem,nombre,descripcion,descripcion2,precio,descuento,idtipo,idcategorias,imagen,stock,rate) values(default,'Reloj delgado negro','Algo','Algo2',165.90,0,1,1,'item-cart-05.jpg',5,default);
insert into items(iditem,nombre,descripcion,descripcion2,precio,descuento,idtipo,idcategorias,imagen,stock,rate) values(default,'Shorts femenino azul','Algo','Algo2',29.50,45,1,1,'item-07.jpg',5,default);
insert into items(iditem,nombre,descripcion,descripcion2,precio,descuento,idtipo,idcategorias,imagen,stock,rate) values(default,'Shorts femenino azul','Algo','Algo2',29.50,45,1,1,'item-07.jpg',5,default);
insert into items(iditem,nombre,descripcion,descripcion2,precio,descuento,idtipo,idcategorias,imagen,stock,rate) values(default,'Shorts femenino azul','Algo','Algo2',29.50,45,1,1,'item-07.jpg',5,default);
insert into items(iditem,nombre,descripcion,descripcion2,precio,descuento,idtipo,idcategorias,imagen,stock,rate) values(default,'Shorts femenino azul','Algo','Algo2',29.50,45,1,1,'item-07.jpg',5,default);
insert into items(iditem,nombre,descripcion,descripcion2,precio,descuento,idtipo,idcategorias,imagen,stock,rate) values(default,'Shorts femenino azul','Algo','Algo2',29.50,45,1,1,'item-07.jpg',5,default);
insert into items(iditem,nombre,descripcion,descripcion2,precio,descuento,idtipo,idcategorias,imagen,stock,rate) values(default,'Shorts femenino azul','Algo','Algo2',29.50,45,1,1,'item-07.jpg',5,default);
insert into items(iditem,nombre,descripcion,descripcion2,precio,descuento,idtipo,idcategorias,imagen,stock,rate) values(default,'Shorts femenino azul','Algo','Algo2',29.50,45,1,1,'item-07.jpg',5,default);


select * from items;



 create table imagenes(
  idimagen int primary key auto_increment,
  nombre character varying (50) not null,
  iditem int not null references items on delete restrict on update cascade
 );

select * from items;

 insert into imagenes values (default,'Aromachology-Repairing-Mask-1.jpg',7);
 insert into imagenes values (default,'Aromachology-Repairing-Mask-2.jpg',7);

create table opiniones(
 idopinion int primary key auto_increment,
 opinion character varying(200),
 nombreusuario character varying(16) references usuarios on delete restrict on update restrict,
 idproducto int references items on delete restrict on update restrict,
 fecha TIMESTAMP not null default CURRENT_TIMESTAMP,
 clasificacion int not null
);

create table reservaciones(
 idreserva bigint not null primary key ,
 nombreusuario character varying(16) references usuarios on update cascade on delete restrict, 
 fecha date not null,
 hora time not null,
 total float default 0
);


create table detallereservacion(
 idcompra bigint not null references reservaciones on update cascade on delete restrict,
 idtem int not null references items on update cascade on delete restrict,
 cantidad int not null,
 precio float not null,
 descuento float not null, 
 iva float not null default 12
);
 
create table ventas(
 idventa bigint not null primary key auto_increment,
 nombreusuario character varying(16) references usuarios on update cascade on delete restrict, 
 fecha timestamp not null default current_timestamp,
 total float default 0
);

create table detalleventa(
 idventa bigint not null references ventas on update cascade on delete restrict,
 idtem int not null references items on update cascade on delete restrict,
 cantidad int not null,
 precio float not null,
 descuento float not null, 
 iva float not null default 12
);


/*

drop procedure if exists add_opinion;
delimiter //
 create  PROCEDURE add_opinion(p varchar(50),n varchar(50), c int, i int) 
 begin 
   declare promedio float; 
  insert into opiniones(opinion,nombreusuario,clasificacion,idproducto) values (p,n,c,i);
  update items set rate=promedio where  iditem=i;
 end
 //







delimiter //
drop function if exists `ropa.isReserva`;
create  function `ropa.isReserva`(f1 date, f2 time) returns boolean
begin
  declare valor bigint;
  set valor = (select idreserva from reservaciones where fecha=f1 and hora=f2);
 if valor is not null then
  return true;
 else
  return false; 
 end if;
end
 //

 


delimiter //
drop function if exists insertarventa;
CREATE  FUNCTION insertarventa(
   a text)    
  RETURNS bigint  
  begin   
   declare 
   id bigint;
  set  id=(select max(idventa) from ventas)+1;
   insert into ventas(idventa, nombreusuario,fecha) values(id,a,default);
   return id;
  end
 //
 




 

delimiter //
drop function if exists insertarreserva;
CREATE   FUNCTION insertarreserva(
   a text,
   b date,
   c time)
  RETURNS bigint 
  begin   
    declare 
   id bigint;
  set id=(select max(idreserva) from reservaciones)+1;
   insert into reservaciones(idreserva, nombreusuario,fecha,hora) values(id,a,b,c);
   return id;
  end
 //


delimiter //
drop procedure if exists actualizarTotal;
create  procedure actualizarTotal(a bigint)
begin 
DECLARE done INT DEFAULT FALSE;
 declare suma float;
 declare IVA float;
 declare descuen float; 
 DECLARE b float;
 declare c FLOAT;
 declare rec cursor for select precio,descuento from detallereservacion where idcompra = a;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
 set suma =0;
 set IVA =0;
 set descuen =0;
 OPEN rec; 
 read_loop: LOOP
 FETCH  rec into  b,c;
 IF done THEN
      LEAVE read_loop;
    END IF;
 set suma=suma+b;
 set descuen=descuen+(c*b/100);
 set IVA=IVA+(b*0.12);
 end loop;
 update reservaciones set total = suma - descuen + IVA where idreserva =a; 
 CLOSE  rec;
end
//





delimiter //
drop procedure if exists actualizarTotal2;
create  procedure actualizarTotal2(a bigint)
begin 
DECLARE done INT DEFAULT FALSE;
 declare suma float;
 declare IVA float;
 declare descuen float; 
 DECLARE b float;
 declare c FLOAT;
 declare rec cursor for select precio,descuento from detalleventa where idventa = a;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
 set suma =0;
 set IVA =0;
 set descuen =0;
 OPEN rec; 
 read_loop: LOOP
 FETCH  rec into  b,c;
 IF done THEN
      LEAVE read_loop;
    END IF;
 set suma=suma+b;
 set descuen=descuen+(c*b/100);
 set IVA=IVA+(b*0.12);
 end loop;
 update ventas set total = suma - descuen + IVA where idventas =a; 
 CLOSE  rec;
end
//


 select * from ventas;

/*
select to_char(v.idventa,'000000000')as numerofactura,'BEAUTY CENTER' AS razonsocial,'COMPRA DE ARTICULOS' AS concepto, dv.descuento,
cantidad,dv.precio, i.nombre as descripcion ,(dv.precio*dv.iva/100) as iva, (cantidad*dv.precio) as subtotal, ((cantidad*dv.precio)+(dv.precio*dv.iva/100)) as total , fecha as fechafactura,
nombre1,nombre2,apellidop, apellidon, u.nombreusuario, i.nombre from ventas v 
inner join detalleventa dv on v.idventa=dv.idventa
inner join items i on i.iditem=dv.idtem 
inner join usuarios u on u.nombreusuario=v.nombreusuario ;

*/
