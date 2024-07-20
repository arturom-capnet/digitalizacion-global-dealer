USE [tablero_database]
GO

/****** Object:  StoredProcedure [dbo].[cargar_digitalizacion_kpis]    Script Date: 6/21/2024 6:56:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [dbo].[cargar_digitalizacion_kpis] --EXEC cargar_digitalizacion_kpis
AS

----- KPIS -----
DELETE FROM [CAPNET].destino_database.dbo.fv_calidad_kpi_dealer
INSERT INTO [CAPNET].destino_database.dbo.fv_calidad_kpi_dealer
SELECT * FROM fv_calidad_kpi WHERE fecha >= GETDATE()-2

DELETE FROM [CAPNET].destino_database.dbo.fv_kpi_promedio_tiempos_express_dealer
INSERT INTO [CAPNET].destino_database.dbo.fv_kpi_promedio_tiempos_express_dealer
SELECT * FROM fv_kpi_promedio_tiempos_express WHERE fecha >= GETDATE()-2

DELETE FROM [CAPNET].destino_database.dbo.fv_lavado_kpi_dealer
INSERT INTO [CAPNET].destino_database.dbo.fv_lavado_kpi_dealer
SELECT * FROM fv_lavado_kpi WHERE fecha >= GETDATE()-2

DELETE FROM [CAPNET].destino_database.dbo.fv_productividad_total_dealer
INSERT INTO [CAPNET].destino_database.dbo.fv_productividad_total_dealer
SELECT * FROM fv_productividad_total WHERE fecha >= GETDATE()-2

DELETE FROM [CAPNET].destino_database.dbo.v_citas_show_noshow_dealer
INSERT INTO [CAPNET].destino_database.dbo.v_citas_show_noshow_dealer
SELECT * FROM v_citas_show_noshow WHERE fecha >= GETDATE()-2

DELETE FROM [CAPNET].destino_database.dbo.v_dif_entrega_dealer
INSERT INTO [CAPNET].destino_database.dbo.v_dif_entrega_dealer
SELECT * FROM v_dif_entrega WHERE fecha >= GETDATE()-2

DELETE FROM [CAPNET].destino_database.dbo.v_hit_bateo_dealer
INSERT INTO [CAPNET].destino_database.dbo.v_hit_bateo_dealer
SELECT * FROM v_hit_bateo WHERE fecha >= GETDATE()-2

DELETE FROM [CAPNET].destino_database.dbo.v_pull_sys_dealer
INSERT INTO [CAPNET].destino_database.dbo.v_pull_sys_dealer
SELECT * FROM v_pull_sys WHERE fecha >= GETDATE()-2

DELETE FROM [CAPNET].destino_database.dbo.v_pull_sys_detalle_dealer
INSERT INTO [CAPNET].destino_database.dbo.v_pull_sys_detalle_dealer
SELECT * FROM v_pull_sys_detalle WHERE fecha >= GETDATE()-2

DELETE FROM [CAPNET].destino_database.dbo.v_pull_sys_ws_dealer
INSERT INTO [CAPNET].destino_database.dbo.v_pull_sys_ws_dealer
SELECT * FROM v_pull_sys_ws WHERE fecha >= GETDATE()-2

DELETE FROM [CAPNET].destino_database.dbo.V_TIEMPO_OPERACION_REAL_dealer
INSERT INTO [CAPNET].destino_database.dbo.V_TIEMPO_OPERACION_REAL_dealer
SELECT * FROM V_TIEMPO_OPERACION_REAL WHERE fecha >= GETDATE()-2

DELETE FROM [CAPNET].destino_database.dbo.V_TIEMPO_OPERACION_REAL_TECNICO_dealer
INSERT INTO [CAPNET].destino_database.dbo.V_TIEMPO_OPERACION_REAL_TECNICO_dealer
SELECT * FROM V_TIEMPO_OPERACION_REAL_TECNICO WHERE fecha >= GETDATE()-2

DELETE FROM [CAPNET].destino_database.dbo.v_uso_tableros_asesor_anfitrion_dealer
INSERT INTO [CAPNET].destino_database.dbo.v_uso_tableros_asesor_anfitrion_dealer
SELECT * FROM v_uso_tableros_asesor_anfitrion WHERE fecha >= GETDATE()-2
GO
