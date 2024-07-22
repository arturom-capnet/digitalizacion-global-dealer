USE [tablero_database]
GO

/****** Object:  View [dbo].[vV_TIEMPO_OPERACION_REAL]    Script Date: 7/22/2024 10:35:17 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[vV_TIEMPO_OPERACION_REAL]
AS
   WITH CTE as (
	select 
	id,
	CASE
		WHEN DATEPART(dw, a.fecha) = 6 OR DATENAME(dw, a.fecha) IN('Saturday', 'Sábado') THEN 
			ROUND(
				(SELECT DATEDIFF(minute, CAST(Hora_ent_s AS TIME), CAST(hora_sal_s AS TIME)) - MIN_COMER_S FROM dbo.v_Tb_TECNICOS b WHERE b.ID_EMPLEADO = idTecnico)
			/ 60.0, 2)
		ELSE 
			ROUND(
				(SELECT DATEDIFF(minute, CAST(Hora_ent_lv AS TIME), CAST(hora_sal_lv AS TIME)) - MIN_COMER_lv FROM dbo.v_Tb_TECNICOS b WHERE b.ID_EMPLEADO = idTecnico) 
			/ 60.0, 2)
    END Disponible,
	CASE
		WHEN DATEPART(dw, a.fecha) = 6 OR DATENAME(dw, a.fecha) IN('Saturday', 'Sábado') THEN 
			(SELECT cast(HORA_COMER_S as time) FROM dbo.v_Tb_TECNICOS b WHERE b.ID_EMPLEADO = idTecnico)
		ELSE 
			(SELECT cast(HORA_COMER as time) FROM dbo.v_Tb_TECNICOS b WHERE b.ID_EMPLEADO = idTecnico)
    END ComidaInicio,
	CASE
		WHEN DATEPART(dw, a.fecha) = 6 OR DATENAME(dw, a.fecha) IN('Saturday', 'Sábado') THEN 
			(SELECT cast(dateadd(minute,min_comer_s,cast(HORA_COMER_S as datetime)) as time) FROM dbo.v_Tb_TECNICOS b WHERE b.ID_EMPLEADO = idTecnico)
		ELSE 
			(SELECT cast(dateadd(minute,min_comer_lv,cast(HORA_COMER as datetime)) as time) FROM dbo.v_Tb_TECNICOS b WHERE b.ID_EMPLEADO = idTecnico)
    END ComidaFin,
	CASE
		WHEN DATEPART(dw, a.fecha) = 6 OR DATENAME(dw, a.fecha) IN('Saturday', 'Sábado') THEN 
			(SELECT top 1 min_comer_s FROM dbo.v_Tb_TECNICOS b WHERE b.ID_EMPLEADO = idTecnico)
		ELSE 
			(SELECT top 1 min_comer_lv FROM dbo.v_Tb_TECNICOS b WHERE b.ID_EMPLEADO = idTecnico)
    END TComida
	from tb_citas a
)
SELECT
    A.FECHA FECHA,
    RIGHT('0'+CAST(DATEPART(month, a.fecha) AS    VARCHAR), 2)+' '+DATENAME(MONTH, a.fecha) AS mes,
    YEAR(a.fecha) year,
    RIGHT('0'+ CAST(DATEPART(dd, a.fecha) as VARCHAR), 2) DIA,
    idasesor ID_ASESOR,
    NOORDEN,
    IDTECNICO,
	isnull((SELECT nombre_empleado FROM dbo.v_Tb_TECNICOS WHERE ID_EMPLEADO = IDTECNICO), 'Inválido') TECNICO,
    servicioCapturado,
    CASE
        WHEN conCita = 1
        THEN 'Cita'
        ELSE 'Sin CIta'
    END CON_CITA,
    fecha_Hora_ini_Oper,
    Fecha_Hora_Fin_Oper,
    CONVERT(  float, ISNULL(Tmp_original, cast(SERVICIO as float))) / 60.00 TIEMPO_ASIGNADO,
	cast(case
		-- No reiniciado | Reiniciado y no finalizado
		when (fecha_hora_paro is not null and fecha_hora_reinicio is null) or
			(fecha_hora_paro is not null and fecha_hora_reinicio is not null and fecha_hora_fin_oper is null) then
			datediff(mi, fecha_hora_ini_oper, fecha_hora_paro) - 
			case when cast(fecha_Hora_ini_Oper as time) <= b.ComidaInicio and cast(fecha_hora_paro as time) >= b.ComidaFin then
				b.TComida
			else
				0
			end
		-- No detenido
		when (fecha_hora_paro is null and fecha_hora_reinicio is null) then
			datediff(mi, fecha_hora_ini_oper, fecha_hora_fin_oper) -
			case when cast(fecha_Hora_ini_Oper as time) <= b.ComidaInicio and cast(fecha_hora_fin_oper as time) >= b.ComidaFin then
				b.TComida
			else
				0
			end
		-- Detenido, reiniciado y finalizado
		else
			datediff(mi, fecha_hora_ini_oper, fecha_hora_paro) + datediff(mi, fecha_hora_reinicio, fecha_hora_fin_oper) -
			case when cast(fecha_Hora_ini_Oper as time) <= b.ComidaInicio and cast(fecha_hora_paro as time) >= b.ComidaFin then
				b.TComida
			else
				0
			end -
			case when cast(fecha_hora_reinicio as time) <= b.ComidaInicio and cast(fecha_hora_fin_oper as time) >= b.ComidaFin then
				b.TComida
			else
				0
			end
	end as float)/60.0 TIEMPO_OPERACION,
    Fecha_Hora_Paro,
    Fecha_Hora_Reinicio,
    CASE
	--WHEN DATEPART(dw, a.fecha) = 6 OR DATENAME(dw, a.fecha) IN('Saturday', 'Sábado') THEN 
		WHEN DATENAME(dw, a.fecha) IN('Saturday', 'Sábado') THEN 
			ROUND(
				(SELECT DATEDIFF(minute, CAST(Hora_ent_s AS TIME), CAST(hora_sal_s AS TIME)) - MIN_COMER_S FROM dbo.v_Tb_TECNICOS b WHERE b.ID_EMPLEADO = idTecnico)
			/ 60.0, 2)
		ELSE 
			ROUND(
				(SELECT DATEDIFF(minute, CAST(Hora_ent_lv AS TIME), CAST(hora_sal_lv AS TIME)) - MIN_COMER_lv FROM dbo.v_Tb_TECNICOS b WHERE b.ID_EMPLEADO = idTecnico) 
			/ 60.0, 2)
    END Tiempo_disponible_bahia,
    DATEDIFF(mi, CONVERT(DATETIME, a.fecha+cast(horaRampa as datetime)), fecha_Hora_ini_Oper) TMP_diff_ini,
    CASE
		WHEN DATEDIFF(mi, a.fecha+cast(horaCita as datetime), fecha_Hora_ini_Oper) IS NULL
		THEN 'No Iniciada'
		WHEN DATEDIFF(mi, a.fecha+cast(horaCita as datetime), fecha_Hora_ini_Oper) < 0
		THEN 'Anticipada'
		WHEN DATEDIFF(mi, a.fecha+cast(horaCita as datetime), fecha_Hora_ini_Oper) BETWEEN 0 AND 10
		THEN 'A Tiempo'
		ELSE 'Tardia'
    END Status_Inicio,
    cast(Servicio as float) - cast(Tmp_original as float) TMP_DIFF_FIN,
    cast(SERVICIO as float) / Tmp_original DIFF_FIN_por,
    cast(Tmp_original as float) Tmp_original,
    cast(SERVICIO as float) servicio,
    horaRampa,
    CASE
        WHEN Fecha_Hora_Paro IS NOT NULL THEN 
		'Detenida'
        ELSE 
		CASE
            WHEN Fecha_Hora_Fin_Oper IS NULL AND Fecha_Hora_Paro IS NULL THEN 
			'No Finalizada'
            WHEN cast(servicio as float) / Tmp_original < .90 THEN 
			'Anticipada'
            WHEN cast(servicio as float) / Tmp_original > 1.10 THEN 
			'Tardia'
            ELSE 
			'En Tiempo'
        END
    END Estatus_Fin,
    1 cantidad
FROM tb_citas a join CTE b on a.id = b.id
WHERE 
serviciocapturado <> 'Lavado'
and datediff(year,fecha,getdate())<=2 and fecha<=getdate()
and idTecnico not in (select id_empleado from dbo.v_Tb_TECNICOS where nombre_empleado like 'No Show' or nombre_empleado like 'TOT')
and NOORDEN<>'0'
and fecha<GETDATE()
GO
