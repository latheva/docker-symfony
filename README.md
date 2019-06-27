## Docker image for symfony project 
_(Docker ready to use)_


This docker image is tested for symfony 3 and 4 projects
along with other database supporting docker images such as 
<a target="_blank" href="https://hub.docker.com/_/mysql">mysql:5.7</a>, 
<a target="_blank" href="https://hub.docker.com/r/phpmyadmin/phpmyadmin">phpmyadmin/phpmyadmin</a>


Image tags reference : [theva/docker-symfony](https://cloud.docker.com/repository/docker/theva/docker-symfony)

# How to use

## Simple usage (without ssl)

1. Create your <code>docker-compose.yml</code> as simple as you see in [<code>docker-symfony/docker-compose/simple/docker-compose.yml</code>](https://github.com/latheva/docker-symfony/blob/master/docker-compose/simple/docker-compose.yml)

2. Execute docker-compose.yml in the terminal
       
       docker-compose up -d --build
       
3. if there is no build error and if the containers are created, then you can access your site
at http://app.local

## Enable SSL

if you are need of your docker container (local server) be supported for ssl, do a slight changes on your own Dockerfile
as follows

1. Add these files somewhere in to your project directory
    1. docker-symfony/certs/cert.key
    2. docker-symfony/certs/cert.pem
    3. docker-symfony/conf/app.conf
    
2. Change these lines in the file conf/app.conf according to your project
     * ServerName app.local           ##line-2
     * DocumentRoot /var/www/public   ##line-3
     * <Directory "/var/www/public">  ##line-10
     * DocumentRoot /var/www/public   ##line-24
    
3. Create a Dockerfile and use theva/docker-symfony as base image Add some additional commands

      ##### Sample <code>Dockerfile</code> looks like

       FROM theva/docker-symfony
       
       WORKDIR /var/www
       RUN mkdir -p /etc/apache2/external
       
       COPY $FILE_PATH/certs/*  /etc/apache2/external/
       COPY $FILE_PATH/conf/* /etc/apache2/sites-enabled/
        
       RUN rm /etc/apache2/sites-enabled/000-default.conf
       RUN a2enmod ssl  #enable ssl
    
       EXPOSE 80
       EXPOSE 443
       
 4. Create your <code>docker-compose.yml</code> as you see in [<code>docker-symfony/docker-compose/ssl/docker-compose.yml</code>](https://github.com/latheva/docker-symfony/blob/master/docker-compose/ssl/docker-compose.yml)
    
 5. Execute docker-compose.yml in the terminal
           
           docker-compose up -d --build
 
 6. if there is no build error and if the containers are created, then you can access your site
    at https://app.local or http://app.local

