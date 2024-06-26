# CARGA DEL PROCESO DE DIGITALIZACIÓN DESDE LA AGENCIA

## Instrucciones

1. Descargar este repositorio o su carpeta a la ruta: C:\capnet\.
2. Abrir el archivo **cargar_digitalizacion_historica.sql** y modificar el **nombre de la base de datos** correspondiente, así como las **tablas de destino**.
3. Al terminar se deben guardar los cambios para alojar este **stored procedure** en dicha base de datos.
4. Ejecutar el **stored procedure**.
5. Repetir los pasos 1, 2, 3, y 4, pero con el archivo **cargar_digitalizacion.sql**.
6. Una vez que todo se haya ejecutado correctamente, editaremos el archivo **cargar_digitalizacion.bat**, se cambian los datos de conexión de la base de datos y guardamos los cambios.
7. Repetir el paso 6 con el archivo **cargar_digitalizacion_historica.bat**.
8. Con el archivo **cargar_digitalizacion.bat** se creará una tarea de Windows la cual se ejecutará cada 1 hora de 7am a 7pm. Esta tarea debe tener el nombre de **CargaDigitalizacion**.

> Nota: Los archivos que terminan con el sufijo **_historica**, solo se ejecutan si se requiere nuevamente una carga historica en el distribuidor.
