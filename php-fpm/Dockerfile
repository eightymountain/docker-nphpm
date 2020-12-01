# step 1
FROM php:7.4-fpm
# step 2
WORKDIR /root
RUN apt-get update            
RUN apt-get install -y curl
# step 3
RUN curl -sS https://getcomposer.org/installer | php  
RUN mv composer.phar /usr/bin/composer
# step 4
RUN apt-get install -y zlib1g-dev && apt-get install -y libzip-dev
RUN docker-php-ext-install zip pdo_mysql
# step 5 (laravel installer)
#RUN composer global require laravel/installer
#RUN ["/bin/bash", "-c", "echo PATH=$PATH:~/.composer/vendor/bin/ >> ~/.bashrc"]
#RUN ["/bin/bash", "-c", "source ~/.bashrc"]
# step 6
ARG PHP_FPM_INSTALL_XDEBUG=false
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

# Copy xdebug configuration for remote debugging
COPY ./xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

RUN sed -i "s/xdebug.remote_autostart=0/xdebug.remote_autostart=1/" /usr/local/etc/php/conf.d/xdebug.ini && \
    sed -i "s/xdebug.remote_enable=0/xdebug.remote_enable=1/" /usr/local/etc/php/conf.d/xdebug.ini && \
    sed -i "s/xdebug.cli_color=0/xdebug.cli_color=1/" /usr/local/etc/php/conf.d/xdebug.ini
# step 7
EXPOSE 9000
CMD ["php-fpm"]