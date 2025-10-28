# Use the official PHP image
FROM php:8.2-apache

# Copy all project files to the web root
COPY . /var/www/html/

# Expose port 80
EXPOSE 80
