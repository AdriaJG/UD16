use actividades;
/*1.1-------------------------------------------*/
select nombre from articulos;
/*1.2*/
select nombre, precio from articulos;
/*1.3*/
select nombre from articulos where precio <= 200;
/*1.4*/
select * from articulos where precio <= 60 and precio >= 120;
/*1.5*/
select nombre, (precio * 166.386) from articulos;
/*1.6*/
select avg(precio) from articulos;
/*1.7*/
select avg(precio) from articulos where fabricante = 2;
/*1.8*/
select count(nombre) from articulos where precio > 180;
/*1.9*/
select nombre, precio
	from articulos
	where precio > 180
    order by precio desc;
select nombre, precio
	from articulos
	where precio > 180
    order by nombre ASC;
/*1.10*/
select articulos.*, fabricantes.*
	from articulos
    left join fabricantes
    on fabricantes.codigo = articulos.fabricante;
/*1.11*/
select a.nombre, a.precio, f.nombre
	from articulos AS a
    left join fabricantes as f
    on f.codigo = a.fabricante;
/*1.12*/
select fabricante, avg(precio)
	from articulos
    group by fabricante;
/*1.13*/
select avg(a.precio), f.nombre
	from articulos AS a
    left join fabricantes as f
    on f.codigo = a.fabricante
    group by f.nombre;
/*1.14*/
select f.nombre
	from articulos AS a
    left join fabricantes as f
    on f.codigo = a.fabricante
    group by f.nombre
    having avg(a.precio) >= 150;
/*1.15*/
select nombre, precio
	from articulos
    where precio = (select min(precio) from articulos);
/*1.16*/
select max(a.precio), f.nombre
	from articulos AS a
    left join fabricantes as f
    on f.codigo = a.fabricante
    group by f.nombre;
/*1.17*/
insert into articulos values(99,'Altavoces', 70, 2);
/*1.18*/
update articulos set nombre='Impresora laser' where codigo = 8;
/*1.19*/
update articulos set precio=precio*0.90;
/*1.20*/
update articulos set precio=precio - 10 where precio >= 120;
/*2.1-------------------------------------------*/
select apellidos from empleados;
/*2.2*/
select distinct apellidos from empleados;
/*2.3*/
select * from empleados where apellidos like 'Lopez';
/*2.4*/
select * from empleados where apellidos like 'Lopez' or apellidos like 'Perez';
/*2.5*/
select * from empleados where departamento = 14;
/*2.6*/
select *
	from empleados
    where departamento = 37 or departamento = 77;
/*2.7*/
select * from empleados where apellidos  like 'P%';
/*2.8*/
select sum(presupuesto) from departamentos;
/*2.9*/
select departamento, count(*)
	from empleados
    group by departamento;
/*2.10*/
select e.*, d.*
	from empleados as e
	inner join departamentos as d
    on e.departamento = d.codigo;
/*2.11*/
select e.nombre, e.apellidos, d.nombre, d.presupuesto
	from empleados as e
	inner join departamentos as d
    on e.departamento = d.codigo;
/*2.12*/
select e.nombre, e.apellidos
	from empleados as e
	inner join departamentos as d
    on e.departamento = d.codigo
    where d.presupuesto > 60000;
/*2.13*/
select nombre
	from departamentos
	where presupuesto > (
		select avg(presupuesto) from departamentos)
	order by nombre;
/*2.14*/
select d.nombre
	from empleados as e
	inner join departamentos as d
    on e.departamento = d.codigo
    group by d.nombre
    having count(e.nombre) > 2;
/*2.15*/
insert into departamentos values (11,'Calidad',40000);
insert into empleados values (89267109, 'Esther', 'Vázquez', 11);
/*2.16*/
update departamentos set presupuesto=presupuesto*0.9;
/*2.17*/
update empleados set departamento=14 where departamento=77;
/*2.18*/
delete from empleados where departamento = 14;
/*2.19*/
delete e
	from empleados as e
	inner join departamentos as d
    on e.departamento = d.codigo
    where d.presupuesto > 60000;
/*2.20*/
delete from empleados;

/*3.1-------------------------------------------*/
select * from almacenes;
/*3.2*/
select * from cajas where valor > 150;
/*3.3*/
select distinct contenido from cajas;
/*3.4*/
select avg(valor) from cajas;
/*3.5*/
select avg(almacen) from cajas group by almacen;
/*3.6*/
select almacen
	from cajas
    group by almacen
    having avg(valor) > 150;
/*3.7*/
select c.numreferencia, a.lugar
	from cajas as c
    inner join almacenes as a
    on c.almacen = a.codigo;
/*3.8*/
select a.lugar, count(c.numreferencia)
	from cajas as c
    inner join almacenes as a
    on c.almacen = a.codigo
    group by c.almacen;
/*(REVISAR)3.9*/
select a.codigo, count(c.numreferencia)
	from almacenes as a
    right join cajas as c
    on c.almacen = a.codigo
    group by a.codigo
    having count(*) > a.capacidad;
    
/*3.10*/
select c.numreferencia
	from cajas as c
    inner join almacenes as a
    on c.almacen = a.codigo
    where a.lugar like 'Bilbao';
/*3.11*/
INSERT INTO almacenes VALUES(99,'Barcelona', 3);
/*3.12*/
insert into cajas values('H5RT', 'Papel', 200, 2);
/*3.13*/
update cajas set valor=valor*0.85;
/*3.14*/
select avg(valor)
	into @valor
    from cajas;
update cajas
	set valor=valor*0.80
    where valor < @valor;
/*3.15*/
delete from cajas where valor < 100;
/*3.16*/

/*4.1-------------------------------------------*/
SELECT nombre FROM peliculas;
/*4.2*/
SELECT distinct calificacionedad FROM peliculas;
/*4.3*/
select nombre from peliculas where calificacionedad is null;
/*4.4*/
SELECT nombre from salas where pelicula IS NULL;
/*4.5*/
select salas.* , peliculas.*
	from salas
    left join peliculas
    on peliculas.codigo = salas.pelicula;

/*4.6*/
select salas.* , peliculas.*
	from salas
    right join peliculas
    on peliculas.codigo = salas.pelicula;

/*4.7*/
select peliculas.nombre
	from peliculas
    right join salas
    on salas.pelicula is null;
/*4.8*/
insert into peliculas values(55,'Uno, Dos, Tres', '7');
/*4.10*/
SET SQL_SAFE_UPDATES = 0;
delete from peliculas where calificacionedad LIKE 'PG';
SET SQL_SAFE_UPDATES = 1;
select * from peliculas;