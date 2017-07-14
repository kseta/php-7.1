FROM ubuntu:16.04

RUN apt-get update
RUN apt-get upgrade -y

ADD ondrej-ubuntu-php-xenial.list /etc/apt/sources.list.d/
RUN apt-get update -y --fix-missing

RUN apt-get install -y --allow-unauthenticated php7.1 php7.1-cli php7.1-common php7.1-curl php7.1-dev php7.1-fpm php7.1-gd php7.1-gmp php7.1-intl php7.1-json php7.1-mbstring php7.1-mcrypt php7.1-mysql php7.1-opcache php7.1-readline php7.1-xml php7.1-xsl php7.1-zip php-apcu php-imagick php-memcached

RUN apt-get install ruby git nodejs npm composer -y --allow-unauthenticated
RUN composer global require hirak/prestissimo

RUN adduser foo
RUN chown -R foo /home/foo

RUN npm cache clean --force
RUN npm install n -g
RUN n 8.0.0
RUN apt-get purge -y nodejs npm
RUN npm install -g bower

RUN gem install bundler
RUN gem install checkstyle_filter-git
RUN gem install saddler
RUN gem install saddler-reporter-github
