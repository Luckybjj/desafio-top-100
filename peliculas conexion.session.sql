-- Desafío Top 100 (Bryan Lagos)

--1. Crear base de datos llamada películas.
CREATE DATABASE peliculas;

-- Creacion tabla peliculas
CREATE TABLE peliculas(id INT NOT NULL, Pelicula VARCHAR(100), Ano_Estreno INT, Director VARCHAR (50), PRIMARY KEY(Id));

-- Creacion Tabla reparto
CREATE TABLE reparto(Id INT NOT NULL, Actor VARCHAR(50), FOREIGN KEY(Id) REFERENCES peliculas(Id));

--2. Cargar ambos archivos a su tabla correspondiente.
-- copiar data  peliculas
\COPY peliculas FROM 'D:\Lucky\lucky\MODULO 05\dia04\Apoyo Desafío - Top 100\peliculas.csv' csv header;
-- Imporando datos del archivo reparto.CSV
COPY reparto FROM 'D:\Lucky\Apoyo Desafio - Top 100\reparto.csv' csv header;

--3. Obtener el ID de la película “Titanic”.
SELECT * FROM peliculas WHERE pelicula = 'Titanic';
-- 4. Listar a todos los actores que aparecen en la película "Titanic".
SELECT * FROM reparto WHERE Id = 2;

-- 5. Consultar en cuántas películas del top 100 participa Harrison Ford.
SELECT * FROM reparto WHERE actor = 'Harrison Ford';
SELECT * FROM peliculas WHERE Id = 48;
SELECT * FROM peliculas WHERE Id = 59;
SELECT * FROM peliculas WHERE Id = 63;
SELECT * FROM peliculas WHERE Id = 67;
SELECT * FROM peliculas WHERE Id = 69;
SELECT * FROM peliculas WHERE Id = 87;
SELECT * FROM peliculas WHERE Id = 88;
SELECT * FROM peliculas WHERE Id = 97;

--6. Indicar las películas estrenadas entre los años 1990 y 1999
-- ordenadas por título de manera ascendente.
SELECT * FROM peliculas WHERE año_estreno >= 1990 AND año_estreno <=1999 ORDER BY Año_estreno ASC;
SELECT * FROM peliculas WHERE año_estreno BETWEEN 1990 and 1999 ORDER BY Año_estreno ASC;

SELECT * FROM peliculas WHERE año_estreno BETWEEN 1990 and 1999 ORDER BY Pelicula ASC;

--7. Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser nombrado para la consulta como “longitud_titulo”.
SELECT Pelicula, LENGTH(Pelicula) AS longitud_titulo FROM peliculas GROUP BY Pelicula ORDER BY Pelicula ASC;
SELECT Pelicula, LENGTH(Pelicula) AS longitud_titulo FROM peliculas GROUP BY Pelicula ORDER BY Pelicula ASC;


--8. Consultar cual es la longitud más grande entre todos los títulos de las películas.
SELECT MAX(LENGTH(Pelicula)) FROM peliculas;
SELECT pelicula, LENGTH(pelicula) AS largo from peliculas WHERE LENGTH(pelicula) = (SELECT MAX(LENGTH(pelicula)) FROM peliculas);

SELECT pelicula, MAX(LENGTH(pelicula)) AS logitud_maxima FROM peliculas GROUP BY pelicula ORDER BY logitud_maxima DESC LIMIT 1;

