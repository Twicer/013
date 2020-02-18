#Set the base image for the installation
FROM ubuntu:latest

MAINTAINER grace.goma88@gmail.com

# Apache ENVs
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2/apache2.pid
ENV APACHE_SERVER_NAME localhost

RUN apt-get update -y \
&& DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata \  
&& apt-get install -y  apache2 php php-common php-cli php-mysql  wget unzip \  
&& rm -rf /var/cache/* \
&& rm -rf /var/lib/apt/lists/*   

# Need to add files
#ADD mysql_setup.sql /tmp/
ADD wordpress.conf /etc/apache2/sites-available/


# Application Installation
RUN wget -P /var/www/html https://wordpress.org/latest.zip && \
unzip /var/www/html/latest.zip -d /var/www/html/ && \
rm -rf /var/www/html/latest.zip

# Copy the WP-condif file
RUN cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php 

# Edit the wp-config.php
RUN sed -ie 's/wordpress_db/wordpress/g' /var/www/html/wordpress/wp-config.php && \
sed -ie 's/wordpress_admin/wpuser/g' /var/www/html/wordpress/wp-config.php && \
sed -ie 's/admin123456/Wordpress/g' /var/www/html/wordpress/wp-config.php

# Set Permission
RUN chown -R $USER:$USER /var/www/html/wordpress && \
chmod 775 /var/www/html/wordpress

# Expose necessary port
EXPOSE 80

#ENTRYPOINT service mysql start && /bin/bash
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
#CMD ["bash"]
