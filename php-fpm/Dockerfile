FROM php:7.4-fpm

RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

# Install required php extensions for webasyst
RUN apt-get update -y \ 
    && apt-get install -y libzip-dev zip libwebp-dev libpng-dev libjpeg62-turbo-dev libpng-dev libfreetype6-dev

RUN pecl channel-update pecl.php.net \ 
    && pecl install xdebug-2.8.1 \
    && docker-php-ext-enable xdebug

RUN docker-php-ext-configure zip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \ 
    && docker-php-ext-install mysqli zip gd gettext
