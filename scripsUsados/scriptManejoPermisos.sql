
create login logDBA with password='12345'
use base_consorcio
create login logRO with password='54321'
use base_consorcio

create user usuarioDBA for login logDBA;	-- creacion de usuario que tendra rol de DBa

create user usuarioReadOnly for login logRO;-- creacion de usuario que tendra solo rol de solo lectura




create role DBA_Role -- creacion de rol de DBA

-- Permiso de administración de base de datos
grant control to DBA_Role

-- Permiso para crear, modificar y eliminar tablas
GRANT CREATE TABLE TO DBA_Role;
GRANT ALTER TO DBA_Role;
GRANT DELETE TO DBA_Role;

-- Permiso para gestionar roles de base de datos
GRANT ALTER ANY ROLE TO DBA_Role;
GRANT ALTER ANY USER TO DBA_Role;

-- Asignar el rol de DBA a el usuario creado al efecto
EXEC sp_addrolemember 'DBA_Role', 'usuarioDBA';

------CREACION DE ROL DE SOLO LECTURA(ONLYREAD)-------------	
CREATE ROLE ReadOnly_Role;
-- Otorgar permiso SELECT  para consorcio
GRANT SELECT TO ReadOnly_Role;
GRANT SELECT  TO ReadOnly_Role;

-- Otorgar permiso VIEW DEFINITION para ver la definición de objetos
GRANT VIEW DEFINITION TO ReadOnly_Role;

-- Asignar el rol al usuario
EXEC sp_addrolemember 'ReadOnly_Role', 'usuarioReadOnly';

--se le otorga al readOnly permiso usar  el procedimiento almacenado
GRANT EXECUTE ON dbo.SP_insercion_admin TO usuarioReadOnly;









