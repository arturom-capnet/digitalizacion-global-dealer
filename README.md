# CARGA DEL PROCESO DE DIGITALIZACIÓN DESDE LA AGENCIA

## Instrucciones

1. Clonar este repositorio en el servidor de la agencia, en la ruta: C:\capnet\.

2. Abrir el archivo **cargar_digitalizacion_historica.sql** y modificar el **nombre de la base de datos LOCAL**, el **nombre de la base de datos de DESTINO** y el nombre de las **tablas de DESTINO**.

3. Al terminar se deben guardar los cambios para alojar este **stored procedure** en la base de datos del **tablero** de la agencia.

4. Ejecutar el **stored procedure**.

5. Repetir los pasos 1, 2, 3, y 4, pero con el archivo **cargar_digitalizacion.sql**.

6. Una vez que todo se haya ejecutado correctamente, editaremos el archivo **cargar_digitalizacion_NombreAgencia.bat**, se cambian los datos de conexión de la base de datos y guardamos los cambios.

> [!IMPORTANT]  
> Sustituir la palabra **NombreAgencia** por el nombre **real** de la agencia en **minúscula**.

7. Con el archivo **cargar_digitalizacion_NombreAgencia.bat** se creará una tarea de Windows la cual se ejecutará cada 30 minutos de 7am a 7pm. Esta tarea debe tener el nombre de **CargaDigitalizacionNombreAgencia**.

> [!IMPORTANT]  
> En caso de usar **SQLAgent**, se solicita crear el/los Job(s) con las mismas caracteríasticas que la/las tarea(s) programada(s) de Windows.
> [!NOTE]  
> Los archivos que terminan con el sufijo **_historica**, solo se ejecutan si se requiere nuevamente una carga historica en el distribuidor.
