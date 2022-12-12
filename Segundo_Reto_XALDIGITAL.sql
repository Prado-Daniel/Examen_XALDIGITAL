create database Vuelos;

USE Vuelos;

create table aerolineas(
id_aerolinea  int primary key,
nombre_aerolinea varchar(15)
);

create table aeropuertos(
id_aeropuerto int primary key,
nombre_aeropuerto varchar(15)
);

create table movimientos(
id_movimiento int primary key,
descripcion varchar(15)
);

create table vuelos(
id_aerolinea int,
id_aeropuerto int,
id_movimiento int,
dia date,
FOREIGN KEY (id_aerolinea) REFERENCES aerolineas(id_aerolinea),
FOREIGN KEY (id_aeropuerto) REFERENCES aeropuertos(id_aeropuerto),
FOREIGN KEY (id_movimiento) REFERENCES movimientos(id_movimiento)
);

INSERT aerolineas(id_aerolinea,nombre_aerolinea)VALUES (1,'Volaris')
INSERT aerolineas(id_aerolinea,nombre_aerolinea)VALUES (2,'Aeromar')
INSERT aerolineas(id_aerolinea,nombre_aerolinea)VALUES (3,'Interjet')
INSERT aerolineas(id_aerolinea,nombre_aerolinea)VALUES (4,'Aeromexico')

INSERT aeropuertos(id_aeropuerto,nombre_aeropuerto)VALUES (1,'Benito Juarez')
INSERT aeropuertos(id_aeropuerto,nombre_aeropuerto)VALUES (2,'Guanajuato')
INSERT aeropuertos(id_aeropuerto,nombre_aeropuerto)VALUES (3,'La paz')
INSERT aeropuertos(id_aeropuerto,nombre_aeropuerto)VALUES (4,'Oaxaca')

INSERT movimientos(id_movimiento,descripcion)VALUES (1,'Salida')
INSERT movimientos(id_movimiento,descripcion)VALUES (2,'Llegada')

INSERT vuelos(id_aerolinea,id_aeropuerto,id_movimiento,dia)VALUES (1,1,1,'2021-05-02')
INSERT vuelos(id_aerolinea,id_aeropuerto,id_movimiento,dia)VALUES (2,1,1,'2021-05-02')
INSERT vuelos(id_aerolinea,id_aeropuerto,id_movimiento,dia)VALUES (3,2,2,'2021-05-02')
INSERT vuelos(id_aerolinea,id_aeropuerto,id_movimiento,dia)VALUES (4,3,2,'2021-05-02')
INSERT vuelos(id_aerolinea,id_aeropuerto,id_movimiento,dia)VALUES (1,3,2,'2021-05-02')
INSERT vuelos(id_aerolinea,id_aeropuerto,id_movimiento,dia)VALUES (2,1,1,'2021-05-02')
INSERT vuelos(id_aerolinea,id_aeropuerto,id_movimiento,dia)VALUES (2,3,1,'2021-05-04')
INSERT vuelos(id_aerolinea,id_aeropuerto,id_movimiento,dia)VALUES (3,4,1,'2021-05-04')
INSERT vuelos(id_aerolinea,id_aeropuerto,id_movimiento,dia)VALUES (3,4,1,'2021-05-04')

select * from vuelos


-- 1. ¿Cuál es el nombre aeropuerto que ha tenido mayor movimiento durante el año?

select count(v.id_movimiento) as 'Numero de vuelos aeropuerto', ap.nombre_aeropuerto from aeropuertos ap
join vuelos v on v.id_aeropuerto = ap.id_aeropuerto
group by v.id_aeropuerto, ap.nombre_aeropuerto order by count(v.id_aeropuerto) DESC --Benito Juarez y La paz

 -- 2. ¿Cuál es el nombre aerolínea que ha realizado mayor número de vuelos durante el año?
select count(v.id_aerolinea) as 'Numero de vuelos aerolinea', al.nombre_aerolinea from aerolineas al
join vuelos v on v.id_aerolinea = al.id_aerolinea 
group by v.id_aerolinea, al.nombre_aerolinea  order by count(v.id_aerolinea) DESC --Aeromar e Interjet

 -- 3. ¿En qué día se han tenido mayor número de vuelos?
select dia, count(dia) as 'numero de movimientos por dia' from vuelos group by dia order by dia --2021-05-02

 -- 4. ¿Cuáles son las aerolíneas que tienen mas de 2 vuelos por día?
select  count(v.id_aerolinea) as 'Numero de vuelos por dia', v.dia, al.nombre_aerolinea from aerolineas al
join vuelos v on v.id_aerolinea = al.id_aerolinea
group by al.nombre_aerolinea, v.dia --ninguno tiene mas de 2 vuelos por día

