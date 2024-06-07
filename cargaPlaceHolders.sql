use tpi;

Insert into Dim_Pais(pais_nac, iso) values ('ARG', 'ISO');
insert into Dim_Provincia(id_pais, provincia) values (1,'Chaco');
insert into Dim_Ciudad(id_provincia, id_pais, nombre, poblacion, codpostal) values (1, 1, 'Resistencia', 999, '3500');
insert into Dim_Operacion(desc_op, id_operacion) values ('Test', '1');
insert into Dim_Cliente(id_ciudad, id_provincia, id_pais, cbu, fecha_nacimiento, genero, profesion, ingresos) values (1,1,1, 2312313213123, GETDATE(), 'M', 'Capo 1', 111);
insert into Dim_Cliente(id_ciudad, id_provincia, id_pais, cbu, fecha_nacimiento, genero, profesion, ingresos) values (1,1,1, 2312313213123, GETDATE(), 'M', 'Capo 2', 111);
insert into Dim_Cliente(id_ciudad, id_provincia, id_pais, cbu, fecha_nacimiento, genero, profesion, ingresos) values (1,1,1, 2312313213123, GETDATE(), 'M', 'Capo 3', 111);
insert into Dim_Cliente(id_ciudad, id_provincia, id_pais, cbu, fecha_nacimiento, genero, profesion, ingresos) values (1,1,1, 2312313213123, GETDATE(), 'M', 'Capo 4', 111);
insert into Dim_Cuenta(id_cuenta, tipoCuenta) values (1, 'Test');
insert into Dim_Cuenta(id_cuenta, tipoCuenta) values (2, 'Test');
insert into Dim_Cuenta(id_cuenta, tipoCuenta) values (3, 'Test');
insert into Dim_Cuenta(id_cuenta, tipoCuenta) values (4, 'Test');
insert into Dim_Terminal(id_terminal, id_ciudad, id_provincia, id_pais, entidad_financiera) values (1, 1, 1, 1, 'TEST entidad');

USE [tpi]
GO

INSERT INTO [dbo].[Titular]
           ([id_cliente]
           ,[id_cuenta]
           ,[id_ciudad]
           ,[id_provincia]
           ,[id_pais])
     VALUES
           (1,1,1,1,1)
GO

INSERT INTO [dbo].[Titular]
           ([id_cliente]
           ,[id_cuenta]
           ,[id_ciudad]
           ,[id_provincia]
           ,[id_pais])
     VALUES
           (2,2,1,1,1)
GO

INSERT INTO [dbo].[Titular]
           ([id_cliente]
           ,[id_cuenta]
           ,[id_ciudad]
           ,[id_provincia]
           ,[id_pais])
     VALUES
           (3,3,1,1,1)
GO

INSERT INTO [dbo].[Titular]
           ([id_cliente]
           ,[id_cuenta]
           ,[id_ciudad]
           ,[id_provincia]
           ,[id_pais])
     VALUES
           (4,4,1,1,1)
GO




