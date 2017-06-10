FROM maven:3.3-jdk-8

MAINTAINER Javier Cabezas Gívica y Eugenio F. González Martín 

# Copying the contents of the current directory into /usr/src/mymaven/ (i.e. the jar file mainly)

COPY $PWD /usr/src/mymaven/

# Making mymaven our working directory (on which we also have the jar file)

WORKDIR /usr/src/mymaven

# Updating packages

RUN apt-get update

# Installing NPM

RUN apt-get install -y nodejs

RUN apt-get install -y npm

# Installing BOWER

RUN npm install -g bower



