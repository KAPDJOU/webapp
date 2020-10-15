FROM ubuntu
MAINTAINER NK (narcisse.kapdjou@yahoo.com)
#RUN apt-get source nginx
RUN apt-get update -y && apt-get -y upgrade
## DEBIAN_FRONTEND=noninteractive : don't pose any question
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y nginx git
EXPOSE 80
#ADD static-website-example/ /var/www/html/
RUN rm -Rf /var/www/html/*
RUN git clone https://github.com/diranetafen/static-website-example.git /var/www/html/
ENTRYPOINT ["/usr/sbin/nginx","-g","daemon off;"]
