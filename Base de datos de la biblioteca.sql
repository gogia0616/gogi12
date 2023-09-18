CREATE DATABASE BD_BIBLIOTECA_ESCOLAR
USE BD_BIBLIOTECA_ESCOLAR
DROP DATABASE BD_BIBLIOTECA_ESCOLAR


CREATE TABLE AUTOR
(
  Cve_Autor VARCHAR (3),
  Nombre_autor VARCHAR (20),
  Edad VARCHAR (3),
  Nacionalidad VARCHAR (15),
  CONSTRAINT pk_CAut PRIMARY KEY (Cve_Autor)
)
CREATE TABLE CATEGORIA
(
  Cve_Categoria VARCHAR (3),
  Nombre_Categoria VARCHAR (15),
  CONSTRAINT pk_CCat PRIMARY KEY (Cve_Categoria)
)
CREATE TABLE ESTANTE
(
  Cve_EStante VARCHAR (3),
  Nombre_Estante VARCHAR(10),
  CONSTRAINT pk_CEsta PRIMARY KEY (Cve_EStante)
)
CREATE TABLE ALUMNO
(
  Cve_Alumno VARCHAR(3),
  Nombre_alu VARCHAR (20),
  Telefono VARCHAR(12),
  Direccion VARCHAR(50),
  Semestre VARCHAR(10),
  Edad VARCHAR (3),
  Cve_Prestamo1 VARCHAR (3),
  CONSTRAINT pk_CAlu PRIMARY KEY (Cve_Alumno)
)

CREATE TABLE lIBRO
(
  Cve_Libro VARCHAR(3),
  Nombre_libro VARCHAR (20),
  Cantidad INT(200),
  Año_Publicado VARCHAR(5),
  Cve_Categoria1 VARCHAR(3),
  Cve_Autor2 VARCHAR (3),
  Cve_EStante3 VARCHAR(3),
  Cve_Alumno4 VARCHAR(3),
  CONSTRAINT pk_CLib PRIMARY KEY (Cve_Libro),
  CONSTRAINT fk_Ccat1 FOREIGN KEY (Cve_Categoria1) REFERENCES categoria (Cve_Categoria),
  CONSTRAINT fkCaut2 FOREIGN KEY (Cve_Autor2) REFERENCES autor (Cve_Autor),
  CONSTRAINT fk_Cesta3 FOREIGN KEY (Cve_Estante3) REFERENCES ESTANTE (Cve_EStante),
  CONSTRAINT fk_CAlu4 FOREIGN KEY (Cve_Alumno4) REFERENCES ALUMNO (Cve_Alumno)
)
CREATE TABLE PRESTAMO
(
  Cve_Prestamo VARCHAR (3),
  Fecha_Prestamo  VARCHAR (15),
  Fecha_Entrega VARCHAR (15),
  Cve_Libro1 VARCHAR (3),
  Cve_Alumno2 VARCHAR(3),
  CONSTRAINT pk_cvep1 PRIMARY KEY (Cve_Prestamo),
  CONSTRAINT fk_lb1 FOREIGN KEY (Cve_Libro1) REFERENCES lIBRO (Cve_Libro),
  CONSTRAINT fk_al2 FOREIGN KEY (Cve_Alumno2) REFERENCES ALUMNO (Cve_Alumno)
)

INSERT INTO autor VALUES 
('AT1','Edgar','35','Mexico'),
('AT2','Jane','22 ','Uruguay'),
('AT3','Miguel','70 ','Argentina'),
('AT4','Paulo','45 ','China'),
('AT5','Charles','30 ','Estados Unidos'),
('AT6','ken','28 ','Indonecia'),
('AT7','Federico','41 ','Brasil'),
('AT8','Agatha','38 ','Arabia'),
('AT9','Marzio','65 ','India'),
('AT0','Mariela','46 ','Armenia')
SELECT * FROM autor


INSERT INTO categoria VALUES
('Ca1','Ciencia'),
('Ca2','Literatura'),
('Ca3','Romance'),
('Ca4','Terror'),
('Ca5','Aventura'),
('Ca6','Ciencia Ficcion'),
('Ca7','Matematicas'),
('Ca8','Español'),
('Ca9','Ingles'),
('Ca0','Accion')
SELECT * FROM categoria

INSERT INTO prestamo VALUES 
('Pr1','17/06/2006','25/06/2016','Li5','AL0'),
('Pr2','01/09/2018','10/09/2018','Li4','AL9'),
('Pr3','19/02/2001','30/02/2001','Li3','AL8'),
('Pr4','25/07/2010','01/08/2010','Li2','AL7'),
('Pr5','30/04/2011','15/05/2011','Li1','AL6'),
('Pr6','15/03/2012','28/03/2012','Li6','AL5'),
('Pr7','21/11/2013','27/11/2013','Li7','AL4'),
('Pr8','29/12/2019','29/12/2019','Li8','AL3'),
('Pr9','17/01/2022','17/01/2022','Li9','AL2'),
('Pr0','16/08/2023','16/08/2023','Li0','AL1')  

SELECT * FROM prestamo


INSERT INTO estante VALUES
('ES1','Uno'),
('ES2','Dos'),
('ES3','Tres'),
('ES4','Cuatro'),
('ES5','Cinco'),
('ES6','Seis'),
('ES7','Siete'),
('ES8','Ocho'),
('ES9','Nuevo'),
('ES0','Cero')

SELECT * FROM estante 

INSERT INTO alumno VALUES
('AL1','Pancho','789','Pinal','5 Semestre','16 años','Pr1'),
('AL2','Karol','987','Derramadero','4 Semestre','15 años','Pr3'),
('AL3','Isaac','2345','Puerto de Amoles','2 Semestre','18 años','Pr5'),
('AL4','Carlos','5678','LA Escondida','1 Semestre','19 años','Pr2'),
('AL5','Gustavo','8765','Piedra Grande','3 Semestre','14 años','Pr4'),
('AL6','Ana','1234','Bucareli','5 Semestre','21 años','Pr6'),
('AL7','Josue','4321','Potrerillos','6 Semestre','18 años','Pr8'),
('AL8','Cruz','5467','Ranchito','2 Semestre','17 años','Pr7'),
('AL9','Daniela','9182','Epazotes','6 Semestre','16 años','Pr9'),
('AL0','Fatima','3429','Magueisitos','3 Semestre','15 años','Pr0')

SELECT * FROM alumno

INSERT INTO libro VALUES
('Li1','Blanca Nieves','100','1990','Ca3','AT0','ES9','AL1'),
('Li2','El Oso y la Pulga','23','1845','Ca4','AT1','ES3','AL4'),
('Li3','Mar Rojo','90','1985','Ca2','AT4','ES2','AL2'),
('Li4','Viaje al Univero','87','1919','Ca5','AT7','ES0','AL3'),
('Li5','Asesinos','45','1875','Ca1','AT9','ES1','AL5'),
('Li6','Corre Corazon','37','2000','Ca7','AT3','ES4','AL7'),
('Li7','La Monja','87','2005','Ca6','AT8','ES7','AL8'),
('Li8','Adas','22','1999','Ca9','AT2','ES6','AL6'),
('Li9','Corre o Muere ','33','2020','Ca8','AT5','ES5','AL9'),
('Li0','El Principito','42','2015','Ca0','AT6','ES8','AL0')

SELECT * FROM libro

/*Queremos saber ah que categoria pertenece el libro La Monja*/
SELECT  Nombre_libro, Nombre_Categoria
FROM libro INNER JOIN categoria
ON libro.Cve_Categoria1 = categoria.Cve_Categoria
WHERE Nombre_libro = 'La Monja'

/*Queremos saber el alumno que tiene prestados libros y que libros tiene pretados*/
SELECT Nombre_alu, Nombre_libro
FROM libro INNER JOIN alumno  
ON libro.Cve_Alumno4 = alumno.Cve_Alumno
/*Alumno, libro, Categoria, Editorial, Autor y estante en el que esta*/
SELECT Nombre_alu, Nombre_libro, Año_Publicado, Nombre_autor, Nombre_Estante
FROM libro INNER JOIN alumno 
ON libro.Cve_Alumno4 = alumno.Cve_Alumno
INNER JOIN categoria
ON libro.Cve_Categoria1 = categoria.Cve_Categoria
INNER JOIN autor
ON libro.Cve_Autor2 = autor.Cve_Autor
INNER JOIN estante 
ON libro.Cve_Estante3 = estante.Cve_EStante
WHERE Cve_libro = 'Li8'



/*Libros que han sido prestados desde enero asta junio*/
SELECT Nombre_libro, Fecha_Prestamo
FROM libro INNER JOIN prestamo 
ON libro.Cve_Libro = prestamo.Cve_Libro1



/*Libro, Categoria, Autor, Estante y Alumno que tiene el libro*/
SELECT Nombre_libro, Nombre_Categoria, Nombre_autor, Nombre_Estante, Nombre_alu
FROM lIBRO INNER JOIN categoria 
ON lIBRO.Cve_Categoria1 = categoria.Cve_Categoria
INNER JOIN autor 
ON lIBRO.Cve_Autor2 = autor.Cve_Autor
INNER JOIN estante 
ON lIBRO.Cve_Estante3 = estante.Cve_Estante
INNER JOIN alumno
ON lIBRO.Cve_Alumno4=alumno.Cve_Alumno
WHERE Cve_Libro = 'Li4'

