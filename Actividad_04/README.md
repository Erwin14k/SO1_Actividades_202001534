*<h1 align="center">Actividad #04</h1>*

# *Problemática ⚙* 

Crear un systemd unit de tipo servicio para ejecutrar un script que imprima un saludo y la fecha actual.





# *Solución ⚙* 

Para darle solución a esta actividad, se crearon 2 archivos, un archivo ".sh", el cuál contiene el script y un archivo ".service", el cual contiene el servicio. para ver los archivos creados puedes hacerlo presionando los siguientes enlaces:

<li><a href="https://github.com/Erwin14k/SO1_Actividades_202001534/tree/main/Actividad_04/script.sh">Script</a></li>
<li><a href="https://github.com/Erwin14k/SO1_Actividades_202001534/tree/main/Actividad_04/service.service">Service</a></li>

``` bash
# Copiar el servicio al sistema
sudo cp service.service /etc/systemd/system/

#Iniciar el servicio
sudo systemctl start service

#Revisar estado del servicio
sudo systemctl status service

#Detener el servicio
sudo systemctl stop service

```