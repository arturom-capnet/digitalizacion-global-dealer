USE [tablero_database]
GO

/****** Object:  View [dbo].[vv_hit_bateo]    Script Date: 7/19/2024 6:37:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[vv_hit_bateo]
AS

SELECT a.fecha,
    YEAR(a.fecha) Year,
    RIGHT('0'+CAST(DATEPART(month, a.fecha) AS VARCHAR), 2)+' '+DATENAME(MONTH, a.fecha) AS mes,
    RIGHT('0'+CAST(DATEPART(dd, a.fecha) as VARCHAR), 2) DIA,
    ISNULL((SELECT TOP 1 Nombre FROM dbo.SccUsuarios WHERE(A.idasesor = cveAsesor)), 'INVALIDO') AS Asesor,
    A.idasesor,
    COUNT(*) AS cantidad,
	(SELECT COUNT(*) FROM Tb_CITAS_HEADER_NW b WHERE b.fecha = a.fecha) total,
    MAX(DATEDIFF(dd, A.Horallegada, A.Fecha_hora_Status)) AS TIEMPO,
    CASE
        WHEN DATEDIFF(dd, horallegada, Fecha_hora_Status) = 0
        THEN '00 DIAS'
        WHEN DATEDIFF(dd, horallegada, Fecha_hora_Status) = 1
        THEN '01 DIAS'
        WHEN DATEDIFF(dd, horallegada, Fecha_hora_Status) = 2
        THEN '02 DIAS'
        WHEN DATEDIFF(dd, horallegada, Fecha_hora_Status) = 3
        THEN '03 DIAS'
        WHEN DATEDIFF(dd, horallegada, Fecha_hora_Status) = 4
        THEN '04 DIAS'
        WHEN DATEDIFF(dd, horallegada, Fecha_hora_Status) BETWEEN 5 AND 10
        THEN '05 A 10 DIAS'
        WHEN DATEDIFF(dd, horallegada, Fecha_hora_Status) BETWEEN 11 AND 20
        THEN '11 A 20 DIAS'
        WHEN DATEDIFF(dd, horallegada, Fecha_hora_Status) > 20
        THEN '21 MAS DIAS'
        ELSE 'INDEFINIDO'
    END AS RANGO
FROM dbo.Tb_CITAS_HEADER_NW AS A
WHERE(ISNULL(A.HoraRetiro, '00:00') <> '00:00')
and fecha <= getdate() and datediff(year,fecha,getdate())<=2
and fecha < GETDATE()
GROUP BY A.fecha,
	A.idasesor,
    CASE
        WHEN DATEDIFF(dd, horallegada, Fecha_hora_Status) = 0
        THEN '00 DIAS'
        WHEN DATEDIFF(dd, horallegada, Fecha_hora_Status) = 1
        THEN '01 DIAS'
        WHEN DATEDIFF(dd, horallegada, Fecha_hora_Status) = 2
        THEN '02 DIAS'
        WHEN DATEDIFF(dd, horallegada, Fecha_hora_Status) = 3
        THEN '03 DIAS'
        WHEN DATEDIFF(dd, horallegada, Fecha_hora_Status) = 4
        THEN '04 DIAS'
        WHEN DATEDIFF(dd, horallegada, Fecha_hora_Status) BETWEEN 5 AND 10
        THEN '05 A 10 DIAS'
        WHEN DATEDIFF(dd, horallegada, Fecha_hora_Status) BETWEEN 11 AND 20
        THEN '11 A 20 DIAS'
        WHEN DATEDIFF(dd, horallegada, Fecha_hora_Status) > 20
        THEN '21 MAS DIAS'
        ELSE 'INDEFINIDO'
    END;
GO
