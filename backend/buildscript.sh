#!/bin/bash

mvn compile jib:build "-Ddocker.jib-maven-plugin.version=latest" \
            "-Dproject.version=latest" \
            "-Ddocker.image.prefix=mustaphaa" \
            "-Dproject.artifactId=spring-petclinic-rest"