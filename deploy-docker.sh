#!/bin/bash

# Cargar variables del archivo .env
export $(grep -v '^#' .env | xargs)

echo "Iniciando sesión en Docker Hub..."
echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin

echo "Etiquetando la imagen como v1..."
docker tag hello-nginx:latest $DOCKER_USERNAME/hello-world:v5

echo "Pusheando la imagen v5 a Docker Hub..."
docker push $DOCKER_USERNAME/hello-world:v5

echo "Ejecutando contenedor hello-v5 desde la imagen v5..."
docker run -d --name hello-v5 -p 8080:80 $DOCKER_USERNAME/hello-world:v5

echo "Todo listo. Contenedor hello-v5 corriendo en el puerto 8080."
echo "Puedes acceder a la aplicación en http://localhost:8080"
