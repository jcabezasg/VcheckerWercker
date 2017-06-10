FROM ubuntu:14.04
MAINTAINER Javier Cabezas <jcabezasgivica@gmail.com> y Eugenio F. González <eugeniofidel@gmail.com>

# Environment variable describing the repositories to be verified on : Github,Bower,NPN,Archiva and Maven
 
ENV REPOSITORIES config.json

# Environment variable with java jar file

ENV JAVAJAR VCheckerApp-0.0.1-SNAPSHOT-jar-wercker.jar

# Copying the contents of the current directory into /usr/src/mymaven/ (i.e. the jar file mainly)

COPY $PWD /usr/src/mymaven/

# Making mymaven our working directory (on which we also have the jar file)

WORKDIR /usr/src/mymaven

#
# Set up of required permissions to execute the jar file  
#

RUN chmod 777 $JAVAJAR

# Updating packages
# Installing Java
# Installing NPM
# Installing BOWER

RUN sudo apt-get update \
        && sudo apt-get -y install openjdk-7-jre-headless \
        && sudo apt-get install -y nodejs \
        && sudo apt-get install -y npm \
        && sudo npm install -g bower

# Creating the entrypoint for the Docker

ENTRYPOINT java -jar $JAVAJAR $REPOSITORIES 
