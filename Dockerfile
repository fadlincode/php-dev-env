FROM php:8.1.5-fpm-alpine

RUN apk add --no-cache \
        libpng-dev \
        libjpeg-turbo-dev \
        libwebp-dev \
        libxpm-dev \
        libzip-dev \
        icu-dev \
    && docker-php-ext-install gd zip intl pdo_mysql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer