USE [tablero_database]
GO

/****** Object:  StoredProcedure [dbo].[cargar_digitalizacion_tablero]    Script Date: 6/21/2024 6:56:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [dbo].[cargar_digitalizacion_tablero] -- EXEC cargar_digitalizacion_tablero
AS

----- TABLEROS -----
DELETE FROM [CAPNET].destino_database.dbo.tb_citas_dealer WHERE fecha >= GETDATE()-2
INSERT INTO [CAPNET].destino_database.dbo.tb_citas_dealer
SELECT * FROM tb_citas WHERE fecha >= GETDATE()-2

DELETE FROM [CAPNET].destino_database.dbo.tb_citas_header_nw_dealer WHERE fecha >= GETDATE()-2
INSERT INTO [CAPNET].destino_database.dbo.tb_citas_header_nw_dealer
SELECT * FROM tb_citas_header_nw WHERE fecha >= GETDATE()-2
--SELECT *, '' AS aseguradora FROM tb_citas_header_nw WHERE fecha >= GETDATE()-2

DELETE FROM [CAPNET].destino_database.dbo.tb_citas_detenidos_dealer
INSERT INTO [CAPNET].destino_database.dbo.tb_citas_detenidos_dealer
SELECT * FROM tb_citas_detenidos

DELETE FROM [CAPNET].destino_database.dbo.tb_tecnicos_dealer
INSERT INTO [CAPNET].destino_database.dbo.tb_tecnicos_dealer
SELECT * FROM tb_tecnicos

DELETE FROM [CAPNET].destino_database.dbo.tb_asesores_dealer
INSERT INTO [CAPNET].destino_database.dbo.tb_asesores_dealer
SELECT * FROM tb_asesores

DELETE FROM [CAPNET].destino_database.dbo.tb_ausencias_dealer
INSERT INTO [CAPNET].destino_database.dbo.tb_ausencias_dealer
SELECT * FROM tb_ausencias

DELETE FROM [CAPNET].destino_database.dbo.tb_ausencias_asesores_dealer
INSERT INTO [CAPNET].destino_database.dbo.tb_ausencias_asesores_dealer
SELECT * FROM tb_ausencias_asesores
GO
