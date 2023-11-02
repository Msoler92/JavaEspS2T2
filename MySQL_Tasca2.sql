-- TIENDA:
-- 1-Llista el nom de tots els productes que hi ha en la taula producto.
SELECT nombre FROM tienda.producto;
-- 2-Llista els noms i els preus de tots els productes de la taula producto.
SELECT nombre, precio FROM tienda.producto;
-- 3-Llista totes les columnes de la taula producto.
SHOW COLUMNS FROM tienda.producto;
-- 4-Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (USD).
SELECT nombre, precio, precio*1.06  FROM tienda.producto;
-- 5-Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (USD). Utilitza els següents àlies per a les columnes: nom de producto, euros, dòlars.
SELECT nombre AS 'nom de producto', precio AS 'euros', FORMAT(precio*1.06, 2) AS 'dòlars' FROM tienda.producto;
-- 6-Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a majúscula.
SELECT UPPER(nombre), precio FROM tienda.producto;
-- 7-Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a minúscula.
SELECT LOWER(nombre), precio FROM tienda.producto;
-- 8-Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.
SELECT nombre, UPPER(SUBSTR(nombre, 1, 2)) FROM tienda.fabricante;
-- 9-Llista els noms i els preus de tots els productes de la taula producto, arrodonint el valor del preu.
SELECT nombre, ROUND(precio) FROM tienda.producto;
-- 10Llista els noms i els preus de tots els productes de la taula producto, truncant el valor del preu per a mostrar-lo sense cap xifra decimal.
SELECT nombre, FLOOR(precio) FROM tienda.producto;
-- 11-Llista el codi dels fabricants que tenen productes en la taula producto.
SELECT fabricante.codigo FROM tienda.fabricante INNER JOIN tienda.producto ON tienda.producto.codigo_fabricante = tienda.fabricante.codigo;
-- 12-Llista el codi dels fabricants que tenen productes en la taula producto, eliminant els codis que apareixen repetits.
SELECT DISTINCT fabricante.codigo FROM tienda.fabricante INNER JOIN tienda.producto ON tienda.producto.codigo_fabricante = tienda.fabricante.codigo;
-- 13-Llista els noms dels fabricants ordenats de manera ascendent.
SELECT nombre FROM tienda.fabricante ORDER BY nombre ASC;
-- 14-Llista els noms dels fabricants ordenats de manera descendent.
SELECT nombre FROM tienda.fabricante ORDER BY nombre DESC;
-- 15-Llista els noms dels productes ordenats, en primer lloc, pel nom de manera ascendent i, en segon lloc, pel preu de manera descendent.
SELECT nombre, precio FROM tienda.producto ORDER BY nombre ASC, precio DESC;
-- 16-Retorna una llista amb les 5 primeres files de la taula fabricante.
SELECT * FROM tienda.fabricante LIMIT 5;
-- 17-Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. La quarta fila també s'ha d'incloure en la resposta.
SELECT * FROM tienda.fabricante LIMIT 3, 2;
-- 18-Llista el nom i el preu del producte més barat. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MIN(preu), necessitaria GROUP BY.
SELECT nombre, precio FROM tienda.producto ORDER BY precio ASC LIMIT 1;
-- 19-Llista el nom i el preu del producte més car. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MAX(preu), necessitaria GROUP BY.
SELECT nombre, precio FROM tienda.producto ORDER BY precio DESC LIMIT 1;
-- 20-Llista el nom de tots els productes del fabricant el codi de fabricant del qual és igual a 2.
SELECT producto.nombre FROM tienda.producto INNER JOIN tienda.fabricante ON codigo_fabricante = fabricante.codigo WHERE fabricante.codigo = 2;
-- 21-Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.
SELECT producto.nombre, precio, fabricante.nombre FROM tienda.producto LEFT JOIN tienda.fabricante ON codigo_fabricante = fabricante.codigo;
-- 22-Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordena el resultat pel nom del fabricant, per ordre alfabètic.
SELECT producto.nombre, precio, fabricante.nombre FROM tienda.producto LEFT JOIN tienda.fabricante ON codigo_fabricante = fabricante.codigo ORDER BY fabricante.nombre;
-- 23-Retorna una llista amb el codi del producte, nom del producte, codi del fabricador i nom del fabricador, de tots els productes de la base de dades.
SELECT producto.codigo, producto.nombre, fabricante.codigo, fabricante.nombre FROM tienda.producto LEFT JOIN tienda.fabricante ON codigo_fabricante = fabricante.codigo;
-- 24-Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.
SELECT producto.nombre, precio, fabricante.nombre FROM tienda.producto LEFT JOIN tienda.fabricante ON codigo_fabricante = fabricante.codigo ORDER BY precio ASC LIMIT 1;
-- 25-Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.
SELECT producto.nombre, precio, fabricante.nombre FROM tienda.producto LEFT JOIN tienda.fabricante ON codigo_fabricante = fabricante.codigo ORDER BY precio DESC LIMIT 1;
-- 26-Retorna una llista de tots els productes del fabricant Lenovo.
SELECT producto.nombre FROM tienda.producto INNER JOIN tienda.fabricante ON codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Lenovo';
-- 27-Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200 €.
SELECT producto.nombre FROM tienda.producto INNER JOIN tienda.fabricante ON codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Crucial' AND precio > 200;
-- 28-Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packardy Seagate. Sense utilitzar l'operador IN.
SELECT producto.nombre FROM tienda.producto INNER JOIN tienda.fabricante ON codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Asus' OR fabricante.nombre = 'Hewlett-Packard' OR fabricante.nombre = 'Seagate';
-- 29-Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packardy Seagate. Fent servir l'operador IN.
SELECT producto.nombre FROM tienda.producto INNER JOIN tienda.fabricante ON codigo_fabricante = fabricante.codigo WHERE fabricante.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');
-- 30-Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.
SELECT producto.nombre, precio FROM tienda.producto INNER JOIN tienda.fabricante ON codigo_fabricante = fabricante.codigo WHERE RIGHT(fabricante.nombre, 1) = 'e';
-- 31-Retorna un llistat amb el nom i el preu de tots els productes el nom de fabricant dels quals contingui el caràcter w en el seu nom.
SELECT producto.nombre, precio FROM tienda.producto INNER JOIN tienda.fabricante ON codigo_fabricante = fabricante.codigo WHERE LOCATE('w', LOWER(fabricante.nombre)) != 0;
-- 32-Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180 €. Ordena el resultat, en primer lloc, pel preu (en ordre descendent) i, en segon lloc, pel nom (en ordre ascendent).
SELECT producto.nombre, precio, fabricante.nombre FROM tienda.producto INNER JOIN tienda.fabricante ON codigo_fabricante = fabricante.codigo WHERE precio >= 180 ORDER BY precio ASC, producto.nombre DESC;
-- 33-Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.
SELECT DISTINCT fabricante.codigo, fabricante.nombre FROM tienda.fabricante INNER JOIN tienda.producto ON codigo_fabricante = fabricante.codigo;
-- 34-Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.
SELECT fabricante.nombre, producto.nombre FROM tienda.fabricante LEFT JOIN tienda.producto ON codigo_fabricante = fabricante.codigo;
-- 35-Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat.
SELECT fabricante.nombre FROM tienda.fabricante LEFT JOIN tienda.producto ON codigo_fabricante = fabricante.codigo WHERE ISNULL(producto.codigo);
-- 36-Retorna tots els productes del fabricador Lenovo. (Sense utilitzar INNER JOIN).
SELECT producto.nombre FROM tienda.producto, tienda.fabricante WHERE codigo_fabricante = fabricante.codigo AND fabricante.nombre = 'Lenovo';
-- 37-Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricant Lenovo. (Sense usar INNER JOIN).
SELECT * FROM tienda.producto WHERE precio = (SELECT MAX(precio) FROM tienda.producto, tienda.fabricante WHERE codigo_fabricante = fabricante.codigo AND fabricante.nombre = 'Lenovo');
-- 38-Llista el nom del producte més car del fabricant Lenovo.
SELECT producto.nombre FROM tienda.producto INNER JOIN tienda.fabricante ON codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Lenovo' ORDER BY precio DESC LIMIT 1;
-- 39-Llista el nom del producte més barat del fabricant Hewlett-Packard.
SELECT producto.nombre FROM tienda.producto INNER JOIN tienda.fabricante ON codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Hewlett-Packard' ORDER BY precio ASC LIMIT 1;
-- 40-Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricant Lenovo.
SELECT * FROM tienda.producto WHERE precio >= (SELECT MAX(precio) FROM tienda.producto INNER JOIN tienda.fabricante ON codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Lenovo');
-- 41-Llesta tots els productes del fabricant Asus que tenen un preu superior al preu mitjà de tots els seus productes.
SELECT * FROM tienda.producto INNER JOIN tienda.fabricante ON codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Asus' AND precio > (SELECT AVG(precio) FROM tienda.producto INNER JOIN tienda.fabricante ON codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Asus');
-- UNIVERSIDAD:
-- 1-Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els/les alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.
SELECT apellido1, apellido2, nombre FROM universidad.persona WHERE tipo = 'alumno' ORDER BY apellido1, apellido2, nombre ASC;
-- 2-Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades.
SELECT nombre, apellido1, apellido2 FROM universidad.persona WHERE tipo = 'alumno' AND telefono IS NULL;
-- 3-Retorna el llistat dels alumnes que van néixer en 1999.
SELECT * FROM universidad.persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = '1999';
-- 4-Retorna el llistat de professors/es que no han donat d'alta el seu número de telèfon en la base de dades i a més el seu NIF acaba en K.
SELECT * FROM universidad.persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE '%K';
-- 5-Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.
SELECT asignatura.nombre FROM universidad.asignatura INNER JOIN universidad.grado ON id_grado = grado.id WHERE grado.id = 7 AND cuatrimestre = 1;
-- 6- Retorna un llistat dels professors/es juntament amb el nom del departament al qual estan vinculats. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.
SELECT apellido1, apellido2, persona.nombre, departamento.nombre FROM universidad.persona INNER JOIN universidad.profesor ON persona.id = id_profesor INNER JOIN universidad.departamento ON id_departamento = departamento.id ORDER BY apellido1, apellido2, persona.nombre;
-- 7-Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne/a amb NIF 26902806M.
SELECT asignatura.nombre, anyo_inicio, anyo_fin FROM universidad.alumno_se_matricula_asignatura INNER JOIN universidad.asignatura ON id_asignatura = asignatura.id INNER JOIN universidad.curso_escolar ON id_curso_escolar = curso_escolar.id INNER JOIN universidad.persona ON id_alumno = persona.id WHERE nif = '26902806M';
-- 8-Retorna un llistat amb el nom de tots els departaments que tenen professors/es que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).
SELECT DISTINCT departamento.nombre FROM universidad.departamento INNER JOIN universidad.profesor ON departamento.id = id_departamento INNER JOIN universidad.asignatura ON profesor.id_profesor = asignatura.id_profesor INNER JOIN universidad.grado ON asignatura.id_grado = grado.id WHERE grado.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
-- 9-Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.
SELECT apellido1, apellido2, persona.nombre FROM universidad.persona INNER JOIN universidad.alumno_se_matricula_asignatura ON id = id_alumno;
-- Resol les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.
-- 1-Retorna un llistat amb els noms de tots els professors/es i els departaments que tenen vinculats. El llistat també ha de mostrar aquells professors/es que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor/a. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.
SELECT departamento.nombre, apellido1, apellido2, persona.nombre FROM universidad.persona LEFT JOIN universidad.profesor ON persona.id = id_profesor LEFT JOIN universidad.departamento ON id_departamento = departamento.id WHERE tipo = 'profesor' ORDER BY departamento.nombre, apellido1, apellido2, persona.nombre;
-- 2-Retorna un llistat amb els professors/es que no estan associats a un departament.
SELECT apellido1, apellido2, persona.nombre FROM universidad.persona LEFT JOIN universidad.profesor ON persona.id = id_profesor WHERE tipo = 'profesor' AND id_departamento IS NULL ORDER BY apellido1, apellido2, persona.nombre;
-- 3-Retorna un llistat amb els departaments que no tenen professors/es associats.
SELECT departamento.nombre FROM universidad.departamento LEFT JOIN universidad.profesor ON id = id_departamento WHERE id_profesor IS NULL;
-- 4-Retorna un llistat amb els professors/es que no imparteixen cap assignatura.
SELECT apellido1, apellido2, persona.nombre FROM universidad.persona LEFT JOIN universidad.asignatura ON persona.id = asignatura.id_profesor WHERE persona.tipo = 'profesor' AND asignatura.id IS NULL;
-- 5-Retorna un llistat amb les assignatures que no tenen un professor/a assignat.
SELECT asignatura.nombre, persona.nombre FROM universidad.persona RIGHT JOIN universidad.asignatura ON persona.id = asignatura.id_profesor WHERE persona.id IS NULL;
-- 6-Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.
SELECT departamento.nombre FROM universidad.departamento LEFT JOIN universidad.profesor ON departamento.id = id_departamento LEFT JOIN universidad.asignatura ON asignatura.id_profesor = profesor.id_profesor LEFT JOIN universidad.alumno_se_matricula_asignatura ON asignatura.id = id_asignatura GROUP BY departamento.nombre HAVING COUNT(id_curso_escolar) = 0;
-- Consultes resum:
-- 1-Retorna el nombre total d'alumnes que hi ha.
SELECT COUNT(*) FROM universidad.persona WHERE tipo = 'alumno' GROUP BY tipo;
-- 2-Calcula quants alumnes van néixer en 1999.
SELECT COUNT(*), YEAR(fecha_nacimiento) FROM universidad.persona WHERE tipo = 'alumno'AND fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31' GROUP BY YEAR(fecha_nacimiento);
-- 3-Calcula quants professors/es hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors/es que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors/es associats i haurà d'estar ordenat de major a menor pel nombre de professors/es.
SELECT departamento.nombre, COUNT(id_profesor) FROM universidad.departamento INNER JOIN universidad.profesor ON departamento.id = id_departamento GROUP BY departamento.id ORDER BY COUNT(id_profesor) DESC;
-- 4-Retorna un llistat amb tots els departaments i el nombre de professors/es que hi ha en cadascun d'ells. Tingui en compte que poden existir departaments que no tenen professors/es associats. Aquests departaments també han d'aparèixer en el llistat.
SELECT departamento.nombre, COUNT(id_profesor) FROM universidad.departamento LEFT JOIN universidad.profesor ON departamento.id = id_departamento GROUP BY departamento.id ORDER BY COUNT(id_profesor) DESC;
-- 5-Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Tingues en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.
SELECT grado.nombre, COUNT(asignatura.id) FROM universidad.grado LEFT JOIN universidad.asignatura ON grado.id = id_grado GROUP BY grado.id ORDER BY COUNT(asignatura.id) DESC;
-- 6-Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades.
SELECT grado.nombre, COUNT(asignatura.id) FROM universidad.grado LEFT JOIN universidad.asignatura ON grado.id = id_grado GROUP BY grado.id HAVING COUNT(asignatura.id) > 40 ORDER BY COUNT(asignatura.id) DESC;
-- 7-Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus.
SELECT grado.nombre, asignatura.tipo, SUM(asignatura.creditos) FROM universidad.grado INNER JOIN universidad.asignatura ON asignatura.id_grado = grado.id GROUP BY grado.nombre, asignatura.tipo;
-- 8-Retorna un llistat que mostri quants alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars. El resultat haurà de mostrar dues columnes, una columna amb l'any d'inici del curs escolar i una altra amb el nombre d'alumnes matriculats.
SELECT anyo_inicio, COUNT(id_alumno) FROM universidad.curso_escolar LEFT JOIN universidad.alumno_se_matricula_asignatura ON id = id_curso_escolar GROUP BY anyo_inicio;
-- 9-Retorna un llistat amb el nombre d'assignatures que imparteix cada professor/a. El llistat ha de tenir en compte aquells professors/es que no imparteixen cap assignatura. El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures. El resultat estarà ordenat de major a menor pel nombre d'assignatures.
SELECT persona.id, persona.nombre, apellido1, apellido2, COUNT(asignatura.id) FROM universidad.persona LEFT JOIN universidad.asignatura ON persona.id = id_profesor WHERE persona.tipo = 'profesor' GROUP BY persona.id, persona.nombre, apellido1, apellido2 ORDER BY COUNT(asignatura.id) DESC; 
-- 10-Retorna totes les dades de l'alumne/a més jove.
SELECT * FROM universidad.persona WHERE tipo = 'alumno' ORDER BY fecha_nacimiento DESC limit 1;
-- 11-Retorna un llistat amb els professors/es que tenen un departament associat i que no imparteixen cap assignatura.
SELECT apellido1, apellido2, persona.nombre, id_departamento FROM universidad.persona INNER JOIN universidad.profesor ON persona.id = profesor.id_profesor LEFT JOIN universidad.asignatura ON profesor.id_profesor = asignatura.id_profesor WHERE id_departamento IS NOT NULL AND asignatura.id IS NULL;