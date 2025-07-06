FROM php:8.2.28-fpm-bookworm

RUN apt update -y 
RUN apt install -y git curl unzip

RUN docker-php-ext-install pdo pdo_mysql

RUN pecl install mongodb \
    && docker-php-ext-enable mongodb

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www/html

RUN chown -R www-data:www-data /var/www/html

RUN composer require vlucas/phpdotenv

