-- Descripción
-- La academia está trabajando en mejorar su plataforma de estudio y planea crear un espacio
-- que sirva como una red social entre estudiantes y docentes, por lo que necesita almacenar
-- en una base de datos los post y comentarios que se generen.
-- ● Parte 1: Creación, inserciones, modificaciones y eliminaciones en la tabla “Posts”.
-- ● Parte 2: Creación e inserciones en la tabla “comentarios”.
-- Parte 1
-- 1. Crear una base de datos con nombre “Posts”. (1 Punto)
    \c ftobarv
    DROP DATABASE posts;
    CREATE DATABASE posts;
    \c posts
-- Definimos el formato para las fechas en; "dmy"
    SET datestyle TO "DMY";
-- 2. Crear una tabla “post”, con los atributos id, nombre de usuario, fecha de creación,
-- contenido y descripción. (1 Punto)
    CREATE TABLE post (
        id SERIAL,
        userName VARCHAR(30),
        createdAt DATE,
        content VARCHAR,
        descripcion VARCHAR,
        PRIMARY KEY (id)
    );
    \dt
-- 3. Insertar 3 post, 2 para el usuario "Pamela" y uno para "Carlos". (0.6 Puntos)
    INSERT INTO post (userName, createdAt, content, descripcion)
    VALUES('Pamela', '08-04-2021', 'asdlkfjasdf e jfasdkfe', 'aasdklfjei esdes');
    INSERT INTO post (userName, createdAt, content, descripcion)
    VALUES('Pamela', '15-08-2021', 'asdlkfjasdf e jfasdkfe', 'aasdklfjei esdes');
    INSERT INTO post (userName, createdAt, content, descripcion)
    VALUES('Pamela', '12-08-2021', 'asdlkfjasdf e jfasdkfe', 'aasdklfjei esdes');
    INSERT INTO post (userName, createdAt, content, descripcion)
    VALUES('Carlos', '08-04-2021', 'asdlkfjasdf e jfasdkfe', 'aasdklfjei esdes');
-- 4. Modificar la tabla post, agregando la columna título. (1 Punto)
    ALTER TABLE post ADD title VARCHAR(20);
-- 5. Agregar título a las publicaciones ya ingresadas. (1 Punto)
    UPDATE post SET title ='La primera' WHERE id =1;
    UPDATE post SET title ='La segunda' WHERE id =2;
    UPDATE post SET title ='La tercera' WHERE id =3;
-- 6. Insertar 2 post para el usuario "Pedro". (0.4 Puntos)
    INSERT INTO post (userName, createdAt, content, descripcion, title)
    VALUES('Pedro', '12-08-2021', 'asdlkfjasdf e jfasdkfe', 'aasdklfjei esdes', 'La cuarta');
    INSERT INTO post (userName, createdAt, content, descripcion, title)
    VALUES('Pedro', '08-04-2021', 'asdlkfjasdf e jfasdkfe', 'aasdklfjei esdes', 'La quinta');
-- 7. Eliminar el post de Carlos. (1 Punto)
    DELETE FROM post WHERE userName ='Carlos';
    
-- 8. Ingresar un nuevo post para el usuario "Carlos". (0.6 Puntos)
    INSERT INTO post (userName, createdAt, content, descripcion, title)
    VALUES('Carlos', '12-08-2021', 'asdlkfjasdf e jfasdkfe', 'aasdklfjei esdes', 'El que sea');
-- Parte 2
-- 1. Crear una nueva tabla llamada “comentarios”, con los atributos id, fecha, hora de
-- creación y contenido, que se relacione con la tabla posts. (1 Punto)
    CREATE TABLE comentarios(
        id SERIAL,
        post_id INT,
        createdAt TIMESTAMP,
        content VARCHAR,
        FOREIGN KEY (post_id) REFERENCES post (id) 
    );
    \dt
-- 2. Crear 2 comentarios para el post de "Pamela" y 4 para "Carlos". (0.4 Puntos)
    INSERT INTO comentarios (post_id, createdAt, content)
    VALUES(1, '05-10-2021 15:16:20', 'añlskdfeinv esde');
    INSERT INTO comentarios (post_id, createdAt, content)
    VALUES(3, '05-12-2021 10:16:20', 'añlskdfeinv esde');
    INSERT INTO comentarios (post_id, createdAt, content)
    VALUES(7, '15-10-2021 15:16:20', 'añlskdfeinv esde');
    INSERT INTO comentarios (post_id, createdAt, content)
    VALUES(7, '03-10-2021 15:16:20', 'añlskdfeinv esde');
    INSERT INTO comentarios (post_id, createdAt, content)
    VALUES(7, '09-10-2021 15:16:20', 'añlskdfeinv esde');
    INSERT INTO comentarios (post_id, createdAt, content)
    VALUES(7, '08-10-2021 15:16:20', 'añlskdfeinv esde');
    SELECT * FROM comentarios;
-- 3. Crear un nuevo post para "Margarita". (1 Punto)
    INSERT INTO post(userName, createdAt, content, descripcion, title)
    VALUES('Margarita', '06-09-2021', 'asdlkfjasdf e jfasdkfe', 'aasdklfjei esdes', 'Margarita nueva');
    SELECT * FROM post;
-- 4. Ingresar 5 comentarios para el post de Margarita. (1 Punto)
    INSERT INTO comentarios (post_id, createdAt, content)
    VALUES(8, '08-10-2021 15:16:20', 'añlskdfeinv esde');
    INSERT INTO comentarios (post_id, createdAt, content)
    VALUES(8, '12-10-2021 23:16:20', 'añlskdfeinv esde');
    INSERT INTO comentarios (post_id, createdAt, content)
    VALUES(8, '31-12-2021 12:16:20', 'añlskdfeinv esde');
    INSERT INTO comentarios (post_id, createdAt, content)
    VALUES(8, '05-06-2021 15:21:20', 'añlskdfeinv esde');
    INSERT INTO comentarios (post_id, createdAt, content)
    VALUES(8, '04-10-2021 15:16:20', 'añlskdfeinv esde');
    SELECT * FROM comentarios;