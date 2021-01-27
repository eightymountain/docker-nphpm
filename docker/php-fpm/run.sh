#!/bin/bash

# Install composer packages.
# composer install

# If the DOCKER_ENV env is production mode, run on production mode.
if [ "${PHP_FPM_INSTALL_XDEBUG}" == false ]; then
    echo ">>>>disabled xdebug"

    php-fpm

# Otherwise, run on development mode.
else
    echo ">>>>enable xdebug"

    # Set Xdebug
    docker-php-ext-enable xdebug

    echo "xdebug.remote_host=host.docker.internal" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
    echo "xdebug.remote_connect_back=0" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
    echo "xdebug.remote_port=9009" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
    echo "xdebug.idekey=PHPSTORM" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

    echo "xdebug.remote_autostart=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
    echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
    echo "xdebug.cli_color=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
    echo "xdebug.profiler_enable=0" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
    echo "xdebug.profiler_output_dir=\"~/xdebug/phpstorm/tmp/profiling\"" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

    echo "xdebug.remote_handler=dbgp" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
    echo "xdebug.remote_mode=req" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

    echo "xdebug.var_display_max_children=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
    echo "xdebug.var_display_max_data=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
    echo "xdebug.var_display_max_depth=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

    echo "xdebug.default_enable=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
    echo "xdebug.remote_log=/usr/local/etc/php/xdebug.log" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

    echo ">>>>enabled xdebug"

fi