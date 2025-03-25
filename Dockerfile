FROM php:7.4-apache

WORKDIR /var/www/html

RUN apt-get update && apt-get upgrade -y

RUN apt-get install sudo nano

RUN docker-php-ext-install mysqli bcmath pdo pdo_mysql

RUN apt-get install zlib1g-dev g++ git libicu-dev zip libzip-dev zip libxslt1-dev -y

RUN docker-php-ext-install intl \
    && docker-php-ext-configure zip \
    && docker-php-ext-install zip \
    && docker-php-ext-install xsl \
    && docker-php-ext-install opcache

RUN apt-get install libbz2-dev -y

RUN docker-php-ext-install bz2 \
    && docker-php-ext-install calendar \
    && docker-php-ext-install exif \
    && docker-php-ext-install gettext

RUN apt-get install libgmp-dev -y

RUN docker-php-ext-install gmp \
    && docker-php-ext-install pcntl \
    && docker-php-ext-install xsl \
    && docker-php-ext-install shmop

RUN apt-get install librabbitmq-dev libssh-dev -y

RUN pecl install amqp

RUN docker-php-ext-enable amqp \
    && apt-get install -y libxml2-dev \
    && docker-php-ext-install soap

RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

RUN apt-get install cups-bsd -y

RUN apt-get install cups-client

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

RUN mkdir -p /etc/cups && echo "ServerName cups:631" > /etc/cups/client.conf

#COPY simrs/ .
