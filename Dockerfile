FROM php:8.2-apache

# Enable mod_rewrite and allow .htaccess in /var/www/html
RUN a2enmod rewrite && \
    sed -i 's|AllowOverride None|AllowOverride All|g' /etc/apache2/apache2.conf && \
    echo '<Directory /var/www/html/>\n\
        Options Indexes FollowSymLinks\n\
        AllowOverride All\n\
        Require all granted\n\
    </Directory>' > /etc/apache2/conf-available/allow-htaccess.conf && \
    a2enconf allow-htaccess

# Optional: install mysqli if connecting to a DB
RUN docker-php-ext-install mysqli

# Copy project into web root
COPY . /var/www/html/

EXPOSE 80
