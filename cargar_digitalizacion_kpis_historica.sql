USE [tablero_database]
GO

/****** Object:  StoredProcedure [dbo].[cargar_digitalizacion_kpis_historica]    Script Date: 6/21/2024 6:56:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [dbo].[cargar_digitalizacion_kpis_historica] -- EXEC cargar_digitalizacion_kpis_historica
AS

----- KPIS -----
DELETE FROM [CAPNET].destino_database.dbo.fv_calidad_kpi_dealer
INSERT INTO [CAPNET].destino_database.dbo.fv_calidad_kpi_dealer
SELECT * FROM fv_calidad_kpi

DELETE FROM [CAPNET].destino_database.dbo.fv_kpi_promedio_tiempos_express_dealer
INSERT INTO [CAPNET].destino_database.dbo.fv_kpi_promedio_tiempos_express_dealer
SELECT * FROM fv_kpi_promedio_tiempos_express

DELETE FROM [CAPNET].destino_database.dbo.fv_lavado_kpi_dealer
INSERT INTO [CAPNET].destino_database.dbo.fv_lavado_kpi_dealer
SELECT * FROM fv_lavado_kpi

DELETE FROM [CAPNET].destino_database.dbo.fv_productividad_total_dealer
INSERT INTO [CAPNET].destino_database.dbo.fv_productividad_total_dealer
SELECT * FROM fv_productividad_total

DELETE FROM [CAPNET].destino_database.dbo.v_citas_show_noshow_dealer
INSERT INTO [CAPNET].destino_database.dbo.v_citas_show_noshow_dealer
SELECT * FROM v_citas_show_noshow

DELETE FROM [CAPNET].destino_database.dbo.v_dif_entrega_dealer
INSERT INTO [CAPNET].destino_database.dbo.v_dif_entrega_dealer
SELECT * FROM v_dif_entrega

DELETE FROM [CAPNET].destino_database.dbo.v_hit_bateo_dealer
INSERT INTO [CAPNET].destino_database.dbo.v_hit_bateo_dealer
SELECT * FROM v_hit_bateo

DELETE FROM [CAPNET].destino_database.dbo.v_pull_sys_dealer
INSERT INTO [CAPNET].destino_database.dbo.v_pull_sys_dealer
SELECT * FROM v_pull_sys

DELETE FROM [CAPNET].destino_database.dbo.v_pull_sys_detalle_dealer
INSERT INTO [CAPNET].destino_database.dbo.v_pull_sys_detalle_dealer
SELECT * FROM v_pull_sys_detalle

DELETE FROM [CAPNET].destino_database.dbo.v_pull_sys_ws_dealer
INSERT INTO [CAPNET].destino_database.dbo.v_pull_sys_ws_dealer
SELECT * FROM v_pull_sys_ws

DELETE FROM [CAPNET].destino_database.dbo.V_TIEMPO_OPERACION_REAL_dealer
INSERT INTO [CAPNET].destino_database.dbo.V_TIEMPO_OPERACION_REAL_dealer
SELECT * FROM V_TIEMPO_OPERACION_REAL

DELETE FROM [CAPNET].destino_database.dbo.V_TIEMPO_OPERACION_REAL_TECNICO_dealer
INSERT INTO [CAPNET].destino_database.dbo.V_TIEMPO_OPERACION_REAL_TECNICO_dealer
SELECT * FROM V_TIEMPO_OPERACION_REAL_TECNICO

DELETE FROM [CAPNET].destino_database.dbo.v_uso_tableros_asesor_anfitrion_dealer
INSERT INTO [CAPNET].destino_database.dbo.v_uso_tableros_asesor_anfitrion_dealer
SELECT * FROM v_uso_tableros_asesor_anfitrion

DELETE FROM [CAPNET].destino_database.dbo.fv_reporte_uso_global_dealer
INSERT INTO [CAPNET].destino_database.dbo.fv_reporte_uso_global_dealer
SELECT * FROM fv_reporte_uso_global
GO
