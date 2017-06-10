FROM maven:3.3-jdk-8

MAINTAINER Javier Cabezas Gívica y Eugenio F. González Martín 

# Updating packages

RUN apt-get update

# Installing NPM

RUN apt-get install -y nodejs

RUN apt-get install -y npm

# Installing BOWER

RUN npm install -g bower



