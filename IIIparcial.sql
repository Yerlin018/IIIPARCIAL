CREATE DATABASE UHCANDIDATOS1;


*/


CREATE TABLE CANDIDATOS
(

Cedula int identity(1,1)  primary key, -- identity se va a incrementar le asigna un numero distinto a cada uno, yo no lo tengo que digitar 
Nombre varchar(50) UNIQUE NOT NULL,
Apellido varchar(50),
Telefono varchar(8) UNIQUE NOT NULL,
Edad numeric,
Partido varchar(50),
Estado varchar(50) 
)




CREATE TABLE ALMACENAMIENTODATOS
(

Cedula_Vot  varchar(50) primary key, -- identity se va a incrementar le asigna un numero distinto a cada uno, yo no lo tengo que digitar 
Nombre_Vot varchar(50),
Apellido_Vot varchar(50) NOT NULL,
Edad_Vot numeric CHECK (Edad_Vot >=18),
Nombre_elegido varchar(50)
)






/*
Crear la tabla resultados
Donde se realiza el conteo de los datos

*/
CREATE TABLE RESULTADOS
(
    Cedula int PRIMARY KEY,  -- Relaciona con la cédula del candidato
    Nombre varchar(50),
    Apellido varchar(50),
    Votos int DEFAULT 0,      -- Inicialmente cero votos
    Porcentaje decimal(5, 2)  -- Almacenará el porcentaje de votos
)

CREATE TRIGGER TR_CandidatoInsertado
ON CANDIDATOS
AFTER INSERT
AS
BEGIN
    INSERT INTO RESULTADOS (Cedula, Nombre, Apellido, Votos, Porcentaje)
    SELECT Cedula, Nombre, Apellido, 0, 0
    FROM inserted;
END


/*
Agregar un nuevo candidato
Cada vez que se ingresa un nuevo caandidato a 
la tabla cANDIDATO este actualiza en RESULTADOS

*/
CREATE TRIGGER TR_VotoInsertado
ON ALMACENAMIENTODATOS
AFTER INSERT
AS
BEGIN
    DECLARE @totalVotos INT;

    -- Actualizar el conteo de votos del candidato
    UPDATE RESULTADOS
    SET Votos = Votos + 1
    WHERE Nombre = (SELECT Nombre_elegido FROM inserted);

    -- Calcular el total de votos registrados
    SELECT @totalVotos = COUNT(*) FROM ALMACENAMIENTODATOS;

    -- Actualizar el porcentaje para cada candidato
    UPDATE RESULTADOS
    SET Porcentaje = (Votos * 100.0) / @totalVotos;
END
/*
Usuarios y contaseñas para login

*/
CREATE TABLE USUARIOCONTRASEÑA
(
ID INT PRIMARY KEY IDENTITY(100,1),
CLAVE VARCHAR(50) NOT NULL, 
NOMBRE VARCHAR(50) NOT NULL,

)

-- INSERT -INGRESAR

INSERT INTO CANDIDATOS(Nombre, Apellido, Telefono, Edad, Partido, Estado) VALUES ('JOSE','CALVO', '123', 19 , 'Libertad','Soltero')
INSERT INTO CANDIDATOS(Nombre, Apellido, Telefono, Edad, Partido, Estado) VALUES ('MARIA','PEREZ', '993', 19 , 'Renovaciòn','Soltero')
INSERT INTO CANDIDATOS(Nombre, Apellido, Telefono, Edad, Partido, Estado) VALUES ('PEDRO','CHAVES', '133', 19 , 'Movimiento','Soltero')
INSERT INTO CANDIDATOS(Nombre, Apellido, Telefono, Edad, Partido, Estado) VALUES ('JUAN','CAMACHO', '930', 29 , 'MMLL','Casado')


INSERT INTO ALMACENAMIENTODATOS(Cedula_Vot, Nombre_Vot, Apellido_Vot, Edad_Vot, Nombre_elegido) VALUES ('932','LUCIA','CHACON', 21 , 'PEDRO')
INSERT INTO ALMACENAMIENTODATOS(Cedula_Vot, Nombre_Vot, Apellido_Vot, Edad_Vot, Nombre_elegido) VALUES ('234','JUAN','CASTILLO', 40 , 'MARIA')
INSERT INTO ALMACENAMIENTODATOS(Cedula_Vot, Nombre_Vot, Apellido_Vot, Edad_Vot, Nombre_elegido) VALUES ('345','DIANA','CASTILLO', 89 , 'MARIA')
INSERT INTO ALMACENAMIENTODATOS(Cedula_Vot, Nombre_Vot, Apellido_Vot, Edad_Vot, Nombre_elegido) VALUES ('267','MARIO','CASTILLO', 19 , 'MARIA')
INSERT INTO ALMACENAMIENTODATOS(Cedula_Vot, Nombre_Vot, Apellido_Vot, Edad_Vot, Nombre_elegido) VALUES ('217','LIZ','ALVAREZ', 23 , 'JOSE')
INSERT INTO ALMACENAMIENTODATOS(Cedula_Vot, Nombre_Vot, Apellido_Vot, Edad_Vot, Nombre_elegido) VALUES ('197','EMA','QUESADA', 18 , 'JOSE')
INSERT INTO ALMACENAMIENTODATOS(Cedula_Vot, Nombre_Vot, Apellido_Vot, Edad_Vot, Nombre_elegido) VALUES ('901','MARY','VARELA', 22 , 'JOSE')
INSERT INTO ALMACENAMIENTODATOS(Cedula_Vot, Nombre_Vot, Apellido_Vot, Edad_Vot, Nombre_elegido) VALUES ('317','YERLIN','CAMACHO', 29 , 'JUAN')




select*from ALMACENAMIENTODATOS

SELECT COUNT (*) FROM ALMACENAMIENTODATOS -- CUENTA CUANTOS CLIENTES HAY EN LA TABLA CLIENTES


SELECT * FROM USUARIOCONTRASEÑA

INSERT INTO USUARIOCONTRASEÑA(CLAVE, NOMBRE) VALUES ('345','MARY')
INSERT INTO USUARIOCONTRASEÑA(CLAVE, NOMBRE) VALUES ('654','LUIS')
INSERT INTO USUARIOCONTRASEÑA(CLAVE, NOMBRE) VALUES ('345','SERGIO')


select ID, CLAVE, NOMBRE from USUARIOCONTRASEÑA


SELECT * FROM ALMACENAMIENTODATOS;
SELECT * FROM RESULTADOS;
SELECT * FROM CANDIDATOS;
SELECT* FROM USUARIOCONTRASEÑA;

DROP TRIGGER TR_CandidatoInsertado

ALTER TABLE RESULTADOS
ADD CONSTRAINT FK_CANDIDATO_RESULTADO
FOREIGN KEY (Cedula)
REFERENCES CANDIDATOS(Cedula)
ON DELETE CASCADE;

 DELETE CANDIDATOS WHERE CEDULA =2