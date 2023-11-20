Use base_consorcio;
GO

CREATE PROCEDURE SP_insercion_admin
AS
BEGIN
    
	Insert into administrador(apeynom,viveahi,tel,sexo,fechnac) values ('Canteros Ramon', 'N', '10632854', 'M', '19561107');
	Insert into administrador(apeynom,viveahi,tel,sexo,fechnac) values ('FretteA Adela', 'S', '63524789', 'F', '19500122');
	Insert into administrador(apeynom,viveahi,tel,sexo,fechnac) values ('Alderete Yamila', 'S', '38456123', 'F','19941121');
	Insert into administrador(apeynom,viveahi,tel,sexo,fechnac) values ('Alderete Silvina', 'N', '36589741', 'F', '19930505');
	Insert into administrador(apeynom,viveahi,tel,sexo,fechnac) values ('Chaves Roberto Andres', 'S', '30568741', 'M', '19821116');
	Insert into administrador(apeynom,viveahi,tel,sexo,fechnac) values ('Portela Diego Alberto', 'N', '3624240689', 'M', '19821018');
	Insert into administrador(apeynom,viveahi,tel,sexo,fechnac) values ('Balbuena Mauro', 'N', '3624241689', 'M', '19820101');
	
END;