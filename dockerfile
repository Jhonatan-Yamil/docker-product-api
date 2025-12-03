FROM httpd:2.4

# Copia todos los archivos de la carpeta al directorio de Apache
COPY ./ /usr/local/apache2/htdocs/

EXPOSE 80
