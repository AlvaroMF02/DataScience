-- GRAMATICA QUE DEBE USARSE, EJEMPLO CON TODO LO QUE SE VERÁ EN ESTOS APUNTES:
SELECT
    c.CustomerId,
    c.FirstName,
    c.LastName,
    c.Country,
    COUNT(i.InvoiceId)                           AS total_invoices,
    ROUND(AVG(i.Total), 2)                        AS avg_invoice,
    MAX(i.Total)                                  AS max_invoice,
    -- Subquery en el SELECT (media global)
    (
        SELECT ROUND(AVG(Total), 2)
        FROM Invoice
    )                                             AS global_avg,
    CASE
        WHEN AVG(i.Total) < (
            SELECT AVG(Total)
            FROM Invoice
        ) THEN 'Below Average'
        WHEN AVG(i.Total) BETWEEN 4 AND 8 THEN 'Medium Value'
        ELSE 'High Value'
    END                                           AS customer_segment
FROM Customer AS c
LEFT JOIN Invoice AS i
    ON c.CustomerId = i.CustomerId
WHERE c.Country IN ('Germany', 'USA', 'Canada')
-- Subquery en el WHERE
AND c.CustomerId IN (
    SELECT CustomerId
    FROM Invoice
    GROUP BY CustomerId
    HAVING COUNT(InvoiceId) > 2
)
GROUP BY
    c.CustomerId,
    c.FirstName,
    c.LastName,
    c.Country
HAVING AVG(i.Total) > (
    SELECT AVG(Total)
    FROM Invoice
)
ORDER BY avg_invoice DESC;





-- COMENTARIO BASICO
Select 
	Title, AlbumId  
FROM 
	Album;

-- CREAR TABLAS
CREATE TABLE if not exists Album_Simplified as
Select 
	Title  
FROM 
	Album;

-- No se ha creado la tabla es una vista creo gil
Select *
From Album_Simplified;
-- Pasando

-- ORDER BY
Select *
from Invoice
order by BillingCountry desc;

-- contar todos los registro de la tabla/columnas
select count(*)
from Invoice;


-- WHERE
select *
from Artist
where Artist.Name = 'AC/DC';

select *
from Invoice
where Total > 10;

select *
from Invoice
where Total > 10 and BillingCity = 'Boston' or BillingCity =  'Stuttgart';


-- IN (hace mas facil los where en algunos casos)
select *
from Invoice
where BillingCity in ('Boston','Stuttgart');



-- BETWEEN 
select *
from Invoice
where Total BETWEEN 6 and 15;


-- LIKE (IMPORTANTE)
select *
from Invoice
where BillingAddress like '%Microsoft%' -- Porcentajes rodeando la palabra (Lambda?)


-- NOT
select *
from Invoice
where Total NOT BETWEEN 6 and 15;


-- NULL
select * -- count(*)
from Invoice
where BillingState IS NULL;

-- DISTINCT
-- paises que hay en total pero solo un valor de cada uno
select distinct Country
from Customer;

select count(distinct Country) as total_paises
from Customer;


-- FUNCIONES DE AGREGACION
select avg(Total) -- avg, sum, count, min, max
from Invoice i;

select min(Total)
from Invoice i 
where i.BillingCountry = 'Germany';


-- GROUP BY
select round(avg(Total),2) as maximos, i.BillingCountry as Pais
from Invoice i 
-- where
group by i.BillingCountry
-- having max(Total) > 13
order by maximos desc;


-- HAVING
select round(avg(Total),2) as maximos, i.BillingCountry as Pais
from Invoice i 
-- where		where no funciona en este caso pq no se puede ejecutar el avg y el alias no existe todavia
group by i.BillingCountry
having maximos > 5.37		-- como el where pero se ejecuta de los ultimos
order by maximos desc


-- CASE		(if/SWITCH)
select i.CustomerId, Total,
	CASE 
		WHEN Total <= 2 THEN 'Bajo valor'
		WHEN Total BETWEEN 2 AND  5 THEN 'Medio valor'
		WHEN Total > 5 THEN 'Alto valor'
		ELSE 'Revisar'
	END	as Total_class
from Invoice i 



-- JOIN
-- al hacer right o left trae todas las filas de la tabla y las que no coincidan con la otra tabla se rellenarán como NULL (se usa mas left)
select c.FirstName, i.* 
from Invoice i JOIN Customer c ON i.CustomerId = c.CustomerId 
-- si fuese Customer join Invoice
-- al hacer left join se incluirian personas que no tienen facturas (NULL)

-- outer join trae todo de las dos tablas rellenando con nulls, se suele usar con where ya que habria muchos nulos



-- SUBQUERYS
-- select
SELECT
    i.InvoiceId,
    i.Total,
    (
        SELECT ROUND(AVG(Total), 2)
        FROM Invoice
    ) AS global_avg
FROM Invoice AS i;

-- Where
SELECT
    c.CustomerId,
    c.FirstName,
    c.LastName
FROM Customer AS c
WHERE c.CustomerId IN (
    SELECT i.CustomerId
    FROM Invoice AS i
    GROUP BY i.CustomerId
    HAVING AVG(i.Total) > (
        SELECT AVG(Total)
        FROM Invoice
    )
);





















