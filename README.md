# CARGA DEL PROCESO DE DIGITALIZACIÓN DESDE LA AGENCIA

## Instrucciones

## Git

1. Clonar este repositorio en el servidor de la agencia, en la ruta: C:\capnet\\.

> [!WARNING]  
> Verificar que se clone la versión correcta, comúnmente es la última, pero se puede requerir alguna versión anterior.

> [!TIP]
> Para clonar una versión especifica del proyecto se utiliza el comando: git clone --branch **tag** linkDelProyecto.

## SQL

2. Validar si los scripts de la carpeta **additionals** son necesarios, de ser así, ejecutarlos.

3. Abrir el archivo **cargar_digitalizacion_tablero_historica.sql** y modificar el **nombre de la base de datos LOCAL**, el **nombre de la base de datos de DESTINO** y el nombre de las **tablas de DESTINO**.

4. Al terminar se deben guardar los cambios para alojar este **stored procedure** en la base de datos del **tablero** de la agencia.

5. Ejecutar el **stored procedure**.

6. Repetir los pasos 3 y 4 pero con el archivo **cargar_digitalizacion_tablero.sql**.

7. Ahora, realizaremos la misma dinámica/repetición para los archivos **cargar_digitalizacion_kpis_historica.sql** y **cargar_digitalizacion_kpis.sql**, o sea, repetiremos los pasos 3, 4, 5 y 6.

## Automatización

8. Una vez que todo se haya ejecutado correctamente, editaremos el archivo **cargar_digitalizacion_tablero_marca_NombreAgencia.bat**, se cambian los datos de conexión de la base de datos y guardamos los cambios.

9. Repetir el paso 8 con el archivo **cargar_digitalizacion_kpis_marca_NombreAgencia.bat**.

> [!IMPORTANT]  
> Sustituir la palabra **marca** por la marca de autos que corresponda a la agencia en **minúscula** (ej. hyundai, mazda, toyota). 
> Sustituir la palabra **NombreAgencia** por el nombre **real** de la agencia en **minúscula** (ej. pedregal, campestre, cumbres).

10. Con el archivo **cargar_digitalizacion_tablero_marca_NombreAgencia.bat** se creará una tarea de Windows la cual se ejecutará cada 30 minutos de 7am a 7pm. Esta tarea debe tener el nombre de **CargaDigitalizacionTableroMarcaNombreAgencia**.

11. Con el archivo **cargar_digitalizacion_kpis_marca.bat** se creará una tarea de Windows la cual se ejecutará cada 4 horas de 7am a 7pm. Esta tarea debe tener el nombre de **CargaDigitalizacionKpisMarca** y debe contener la carga de kpis de todas las agencias que estén en el servidor.

> [!IMPORTANT]  
> En caso de usar **SQLAgent**, se solicita estrictamente crear el/los Job(s) con las mismas caracteríasticas que la/las tarea(s) programada(s) de Windows.

> [!NOTE]  
> Los archivos que terminan con el sufijo **_historica**, solo se ejecutan si se requiere nuevamente una carga historica en el distribuidor.
