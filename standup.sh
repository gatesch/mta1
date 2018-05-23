#!/bin/bash
docker build -t db ./db
docker build -t tomcat ./tomcat
docker network create atsea
docker run -d --network atsea -p 8080:8080 --name tomcat tomcat
docker run -d --network atsea --name db db
