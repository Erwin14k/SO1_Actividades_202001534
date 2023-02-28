*<h1 align="center">Actividad #03</h1>*

# *Problemática ⚙* 

Actualmente existe un bug en la container image de frontend del ejemplo visto en clase. Lo que sucede es que al momento de cargar una URL especifica se obtiene un error 404. La actividad consiste en entender y solucionar el problema. Subir la solución al folder indicado y crear un readme.md file explicando el problema y cual es su solución.

<li><a href="https://github.com/susguzman/so1_containers">Código Fuente</a></li>


El archivo orginal con el problema es el siguiente: 

``` dockerfile

## BUILD
# docker build -t mifrontend:0.1.0-nginx-alpine -f nginx.Dockerfile .
## RUN
# docker run -d -p 3000:80 mifrontend:0.1.0-nginx-alpine
FROM node:18.14.0-buster-slim as compilacion

LABEL developer="jesus guzman" \
      email="susguzman@gmail.com"

ENV REACT_APP_BACKEND_BASE_URL=http://localhost:3800

# Copy app
COPY . /opt/app

WORKDIR /opt/app

# Npm install
RUN npm install

RUN npm run build

# Fase 2
FROM nginx:1.22.1-alpine as runner

COPY --from=compilacion /opt/app/build /usr/share/nginx/html

```

# *Análisis ⚙* 


El problema tiene que ver por la falta de configuración de ngnix, y es que al utilizar ngnix entra en conflicto con react router y las rutas que se utilizan en la aplicación de React.

React Router utiliza el enrutamiento del lado del cliente, lo que significa que se necesita una configuración especial en el servidor para que las rutas funcionen correctamente.

Para solucionar este problema, en el archivo de configuración de nginx (/etc/nginx/nginx.conf), se debe agregar una regla que indique que cualquier solicitud a la aplicación se debe redirigir al archivo index.html. Esto asegura que el enrutamiento del lado del cliente de React Router pueda manejar las rutas correctamente.

La configuración  para el archivo /etc/nginx/nginx.conf que debería funcionar correctamente con React Router, es el siguiente:

``` javascript 
http {
    server {
        listen 80;
        server_name example.com;
        root /usr/share/nginx/html;
        index index.html;

        location / {
            try_files $uri $uri/ /index.html;
        }
    }
}

``` 


# *Solución ⚙* 

El archivo con la solución al problema es el siguiente: 

``` dockerfile
## BUILD
# docker build -t mifrontend:0.1.0-nginx-alpine -f nginx.Dockerfile .
## RUN
# docker run -d -p 3000:80 mifrontend:0.1.0-nginx-alpine
FROM node:18.14.0-buster-slim as compilacion

LABEL developer="jesus guzman" \
      email="susguzman@gmail.com"

ENV REACT_APP_BACKEND_BASE_URL=http://localhost:3800

# Copy app
COPY . /opt/app

WORKDIR /opt/app

# Npm install
RUN npm install

RUN npm run build

# Fase 2
FROM nginx:1.22.1-alpine as runner

# Copiar la configutación ngnix
COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY --from=compilacion /opt/app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

```