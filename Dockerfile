FROM php:8.2-apache

# Enable mod_rewrite and allow .htaccess overrides
RUN a2enmod rewrite \
 && sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf

# Install mysqli if needed
RUN docker-php-ext-install mysqli

# Copy project into web root
COPY . /var/www/html/

EXPOSE 80
