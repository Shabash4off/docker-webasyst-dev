FROM php:5.6-fpm

# Set timezone
RUN printf '[PHP]\ndate.timezone = "${TIMEZONE}"\n' > /usr/local/etc/php/conf.d/timezone.ini

RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

RUN sed -i '/always_populate_raw_post_data/s/^;//g' /usr/local/etc/php/php.ini

# Install required php extensions for webasyst
RUN apt-get update -y \ 
    && apt-get install -y libzip-dev zip libwebp-dev libpng-dev libjpeg62-turbo-dev libpng-dev libfreetype6-dev


RUN docker-php-ext-configure zip --with-libzip \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/ \ 
    && docker-php-ext-install mysqli zip gd gettext