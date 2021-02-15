#!/bin/bash
docker login -u ${docker-credentials_USR} -p ${docker-credentials_PSW}
docker-compose build --parallel