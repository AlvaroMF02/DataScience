-- Ejercicios basicos

-- Cuantas col tiene la tabla de clientes
select *
from customer;

-- De las 5 primeras filas, ¿cuál es el pais en la ultima fila?
select Country 
from Customer
limit 5;

-- Ordenando la tabla por apellido, cual es el 3 apellido 		bernard
select *
from Customer
ORDER BY Customer.LastName 
limit 3;

-- Cuantas filas hay en la tabla de factura
select COUNT(*)
from Invoice;

-- =======================================================================

-- Facturas son mayores a 20
select count(*)
from Invoice
where Total > 20;

-- Facturas entre 10 y 20
select count(*)
from Invoice
where Total between 10 and 20;

-- Facturas de clientes de Brasil, Argentina y Chile
select count(*) 
from Invoice
where BillingCountry in ('Brazil', 'Argentina', 'Chile');

-- Cantidad de facturas q tiene un pais q empieza por la C
select * 
from Invoice
where BillingCountry LIKE 'C%';

-- Cuantos clientes anuncian su empresa??
select * 
from Customer
where Company not null;


-- =======================================================================

-- Cuantos mepleados tiene chinook
SELECT count(*)
from Employee;

-- Crear una nueva col con sus numero de tlf sin el codigo de area
-- Alter table Employee 
-- add column Phone_without_code varchar(10);
Update Employee
set Phone_without_code = substr(Phone,9); -- se queda un espacio en todos los empleados menos en uno

SELECT *
from Employee;


-- Cuanto mide el apellido mas largo
select max(length(LastName))
from Employee


-- Cuantos empleados nacieron un domingo
SELECT *
FROM Employee
WHERE strftime('%w', BirthDate) = '0';


-- Cuantos años tenia el empleado mas viejo cuando fue contratado
SELECT MAX(
    CAST((julianday(HireDate) - julianday(BirthDate)) / 365.25 AS INTEGER)
) AS edad_mayor_al_contratar
FROM Employee;



-- =======================================================================

-- lista de paises por el valor total de las facturas en orden desc
select i.BillingCountry, sum(i.Total) as Suma
from Invoice i 
group by i.BillingCountry
order by Suma desc

-- Mostrar cuantas partidas de factura hay
select count(i.InvoiceId )	-- q hace el pavo poniendo distinct a un id??? el id de una tabla no se va a repetir o no deberia pq si no es una mierda de tabla gil
from Invoice i 


-- Mostrar cuantos precios distintos hay
select count(distinct Total)
from Invoice i 

-- Cuantas descargas de cada precio se han producido
select distinct Total as Precios, i.CustomerId as Ventas
from Invoice i
group by Precios

-- Rango de fechas de facturacion cubierto por la base de datos
select min (i.InvoiceDate ) as Desde, max (i.InvoiceDate ) as Hasta
from Invoice i 



























