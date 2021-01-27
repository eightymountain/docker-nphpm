# step 1
FROM php:7.4-fpm
# step 2
WORKDIR /root
# step 3
RUN apt-get update            
# step 4
RUN apt-get install -y curl
# step 5
RUN curl -sS https://getcomposer.org/installer | php  
# step 6
RUN mv composer.phar /usr/bin/composer
# step 7
RUN apt-get install -y zlib1g-dev && apt-get install -y libzip-dev
# step 8
RUN docker-php-ext-install zip pdo_mysql
# step 9
ARG PHP_FPM_INSTALL_XDEBUG=false
# step 10
RUN if [ ${PHP_FPM_INSTALL_XDEBUG} = true ]; then \
  # Install the xdebug extension
  if [ $(php -r "echo PHP_MAJOR_VERSION;") = "5" ]; then \
    pecl install xdebug-2.5.5; \
  else \
    if [ $(php -r "echo PHP_MINOR_VERSION;") = "0" ]; then \
      pecl install xdebug-2.9.0; \
    else \
      pecl install xdebug; \
    fi \
  fi && \
  docker-php-ext-enable xdebug \
;fi

# step 11
# Copy xdebug configuration for remote debugging
COPY ./xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

# step 12
RUN sed -i "s/xdebug.remote_autostart=0/xdebug.remote_autostart=1/" /usr/local/etc/php/conf.d/xdebug.ini && \
    sed -i "s/xdebug.remote_enable=0/xdebug.remote_enable=1/" /usr/local/etc/php/conf.d/xdebug.ini && \
    sed -i "s/xdebug.cli_color=0/xdebug.cli_color=1/" /usr/local/etc/php/conf.d/xdebug.ini

# step 13
EXPOSE 9000
# step 14
CMD ["php-fpm"]