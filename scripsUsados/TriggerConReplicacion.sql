-- Crear tabla auditoriaConsorcio con una columna de clave primaria
CREATE TABLE auditoriaConsorcio (
    auditoriaID INT IDENTITY(1,1) PRIMARY KEY, -- Columna de clave primaria autoincremental
    idprovincia int, 
    idlocalidad int, 
    idconsorcio int, 
    nombre VARCHAR(50), 
    direccion VARCHAR(250), 
    idzona int, 
    idconserje int,
    idadmin int,
    fechayhora date,
    usuario varchar(50),
    tipoOperacion varchar(50)
);
GO
-- Trigger para la operación de UPDATE en la tabla consorcio
CREATE TRIGGER trg_auditConsorcio_update
ON consorcio
AFTER UPDATE
AS
BEGIN
    -- Registrar los valores antes de la modificación en la tabla de auditoría
    INSERT INTO auditoriaConsorcio (idprovincia, idlocalidad, idconsorcio, nombre, direccion, idzona, idconserje, idadmin, fechayhora, usuario, tipoOperacion)
    SELECT idprovincia, idlocalidad, idconsorcio, nombre, direccion, idzona, idconserje, idadmin, GETDATE(), SUSER_NAME(), 'Update'
    FROM deleted;
END;
GO
-- Trigger para la operación de DELETE en la tabla consorcio
CREATE TRIGGER trg_auditConsorcio_delete
ON consorcio
AFTER DELETE
AS
BEGIN
    -- Registrar los valores antes de la eliminación en la tabla de auditoría
    INSERT INTO auditoriaConsorcio (idprovincia, idlocalidad, idconsorcio, nombre, direccion, idzona, idconserje, idadmin, fechayhora, usuario, tipoOperacion)
    SELECT idprovincia, idlocalidad, idconsorcio, nombre, direccion, idzona, idconserje, idadmin, GETDATE(), SUSER_NAME(), 'Delete'
    FROM deleted;
END;
GO
-- Eliminar un registro de la tabla consorcio
DELETE FROM consorcio WHERE idconsorcio = 11 -- Reemplaza "idconsorcio" con un valor existente en tu tabla 

-- Consulta para verificar el registro en la tabla de auditoría después del DELETE
SELECT *
FROM auditoriaConsorcio;

