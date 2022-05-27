#!/bin/bash

sudo docker build -t maestro1-service-openjdk13:v1.0.10 .
sudo docker tag maestro1-service-openjdk13:v1.0.10 maestro1-service-openjdk:latest

sudo docker tag maestro1-service-openjdk13:v1.0.10 prasadtalasila/maestro1-service-openjdk13:v1.0.10
sudo docker tag maestro1-service-openjdk13:latest prasadtalasila/maestro1-service-openjdk13:latest

sudo docker login -u prasadtalasila --password-stdin
sudo docker push -a prasadtalasila/maestro1-service-openjdk13