#!/bin/bash

JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export JAVA_HOME


java \
    -javaagent:jacocoagent.jar \
    -javaagent:contrast-agent.jar \
    -Dcontrast.application.name=Petclinic-dtp \
    -Dcontrast.application.tags="Java 8, Spring 1.5.4, Agent v5.2.3, App v1.5.1" \
    -Dcontrast.config.path=contrast_security.yaml \
    -Dcontrast.server.environment=Development \
    -Dcontrast.server=Petclinic-dtp-Dev \
    -jar ./target/spring-petclinic-1.5.1.jar \
    --server.address=0.0.0.0 \
    --server.port=8080 

