# proyecto_inicio

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
# proyecto-1.1

# BACK: Ya estaría en real, sin base interna de Spring usada para el sesteo

1.- Descargar docker:  https://www.docker.com/

2.- Descargar MYSQL: https://downloads.mysql.com/archives/workbench/ Importante versión 8.0.33

Al configurarla puerto 3307

Crear base de datos kindergarten y Schema kindergarten

3.- Descargar maven: https://maven.apache.org/plugins/

4.- Se puede abrir en eclipse o bien en Visual Code

# Para probarla

1.- Descomprimir el fichero y abrirlo en Eclipse o Visual Code o cualquier otro editor

2.- Abrir el docker

3.- En el terminal el siguiente comando: docker run -p 3307:3306 -e MYSQL_ROOT_PASSWORD=ddd -d mysql

4.- MYSQL debe estar abierto y creado con el nombre de la base de datos y el Schema

5.- En el terminal poner los siguientes comandos por orden:  el primero es para ver que todo compila y el segundo arranca Spring-boot

mvn clean compile

./mvnw spring-boot:run


6.- Para probarlo poner la siguiente url en cualquier navegador y accedéis al Swagger.

http://localhost:8080/swagger-ui/index.html

