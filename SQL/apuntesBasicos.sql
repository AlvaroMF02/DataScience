-- ========================================
-- 1️ SELECT (CONSULTAR DATOS)
-- ========================================

-- Seleccionar columnas concretas
SELECT Title, AlbumId
FROM Album;

-- Seleccionar todo
SELECT *
FROM Album;

-- Alias de columnas
SELECT Title AS titulo
FROM Album;



-- ========================================
-- 2️ WHERE (FILTRAR)
-- ========================================

-- Filtro simple
SELECT *
FROM Invoice
WHERE BillingCountry = 'Spain';

-- Operadores
-- =  <>  >  <  >=  <=
-- AND  OR  NOT

-- IN
SELECT *
FROM Invoice
WHERE BillingCountry IN ('Spain', 'France');

-- BETWEEN
SELECT *
FROM Invoice
WHERE Total BETWEEN 5 AND 20;

-- LIKE (búsqueda por patrón)
SELECT *
FROM Album
WHERE Title LIKE 'A%';

-- IS NULL
SELECT *
FROM Invoice
WHERE ShippedDate IS NULL;



-- ========================================
-- 3️ ORDER BY (ORDENAR)
-- ========================================

SELECT *
FROM Invoice
ORDER BY BillingCountry DESC;

-- ASC es por defecto
SELECT *
FROM Invoice
ORDER BY Total ASC;



-- ========================================
-- 4️ FUNCIONES AGREGADAS
-- ========================================

SELECT COUNT(*) FROM Invoice;
SELECT SUM(Total) FROM Invoice;
SELECT AVG(Total) FROM Invoice;
SELECT MAX(Total) FROM Invoice;
SELECT MIN(Total) FROM Invoice;



-- ========================================
-- 5️ GROUP BY (AGRUPAR)
-- ========================================

SELECT BillingCountry, COUNT(*) AS total_facturas
FROM Invoice
GROUP BY BillingCountry;

-- HAVING (filtrar después del GROUP BY)
SELECT BillingCountry, COUNT(*) AS total
FROM Invoice
GROUP BY BillingCountry
HAVING COUNT(*) > 10;



-- ========================================
-- 6️ JOIN (UNIR TABLAS)
-- ========================================

-- INNER JOIN (solo coincidencias)
SELECT Album.Title, Artist.Name
FROM Album
INNER JOIN Artist
    ON Album.ArtistId = Artist.ArtistId;

-- LEFT JOIN (mantiene todos los registros de la izquierda)
SELECT Album.Title, Artist.Name
FROM Album
LEFT JOIN Artist
    ON Album.ArtistId = Artist.ArtistId;

-- RIGHT JOIN (mantiene todos los registros de la derecha)
SELECT Album.Title, Artist.Name
FROM Album
RIGHT JOIN Artist
    ON Album.ArtistId = Artist.ArtistId;



-- ========================================
-- 7️ CREATE TABLE
-- ========================================

-- Crear tabla manualmente
CREATE TABLE nueva_tabla (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    precio DECIMAL(10,2)
);

-- Crear tabla a partir de otra
CREATE TABLE Album_Simplified AS
SELECT Title
FROM Album;



-- ========================================
-- 8️ VIEW (VISTA)
-- ========================================

-- Crear vista (no guarda datos físicamente)
CREATE VIEW Album_View AS
SELECT Title
FROM Album;

-- Consultar vista
SELECT *
FROM Album_View;



-- ========================================
-- 9️ BORRAR / ELIMINAR
-- ========================================

-- Borrar tabla
DROP TABLE Album_Simplified;

-- Borrar vista
DROP VIEW Album_View;

-- Eliminar registros
DELETE FROM Invoice
WHERE InvoiceId = 1;
