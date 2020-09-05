--crear database
CREATE DATABASE normalizacion;

---crear tablas--

-- TABLA LIBROS
CREATE TABLE libros(codigo INT PRIMARY KEY, nombre VARCHAR(100)NOT NULL);

--TABLA AUTORES--
CREATE TABLE autores(id SERIAL PRIMARY KEY, nombre VARCHAR(100) NOT NULL);


--TABLA EDITORIALES--
CREATE TABLE editoriales(id SERIAL PRIMARY KEY, nombre VARCHAR(100)NOT NULL);

--TABLA LECTORES--
CREATE TABLE lectores(id SERIAL PRIMARY KEY, nombre VARCHAR(100) NOT NULL);


--TABLA PRESTAMOS-
CREATE TABLE prestamos(id SERIAL PRIMARY KEY, fecha_devolucion DATE NOT NULL,lector_id INT NOT NULL,libro_cod INT NOT NULL, FOREIGN KEY(lector_id) REFERENCES lectores(id), FOREIGN KEY(libro_cod) REFERENCES libros(codigo));

--TABLA AUTORES_LIBROS
CREATE TABLE autores_libros(libro_cod INT, autor_id INT, FOREIGN KEY(libro_cod) REFERENCES libros(codigo), FOREIGN KEY(autor_id) REFERENCES autores(id));

--TABLA EDITORIALES_LIBROS--
CREATE TABLE editoriales_libros(libro_cod INT UNIQUE, editorial_id INT UNIQUE, FOREIGN KEY(libro_cod) REFERENCES libros(codigo), FOREIGN KEY(editorial_id) REFERENCES editoriales(id));


INSERT INTO libros(codigo,nombre) VALUES
(515,'Ecuaciones diferenciasles para ingenieros y ciéntificos'),
(540,'Química'),
(530,'Física'),
(519,'Estadística'),
(512,'Algebra Linea');

INSERT INTO editoriales_libros(libro_cod,editorial_id) VALUES
(515,1),
(540,2),
(530,3),
(519,3),
(512,4);

INSERT INTO lectores(id, nombre) VALUES
(1,'Pérez Gómez, Juan'),
(2,'Ortega Pereira, Margarita'),
(3,'García Contreras, Rosa'),
(4, 'López Molina, Ana');

INSERT INTO autores(id, nombre) VALUES
(1,'Lambe, C.G y'),
(2,'Christen, Hans Rudolf'),
(3,'Serway, Raymond A'),
(4, 'Murray Spiegel'),
(5,'Voevodin, Valentin V'),
(6,'ranter, C.J.');

INSERT INTO autores_libros(libro_cod,autor_id) VALUES
(515,1),
(515,6),
(540,2),
(530,3),
(519,4),
(512,5);

INSERT INTO editoriales(id, nombre) VALUES
(1,'UTHEA'),
(2,'Reverté'),
(3,'McGrawHill'),
(4,'MIR');

INSERT INTO prestamos(id,fecha_devolucion,lector_id,libro_cod) VALUES
(1,'2019-09-15',1,515),
(2,'2019-08-23',2,540),
(3,'2019-09-24',3,530),
(4,'2019-09-18',4,519),
(5,'2019-09-17',1,512);