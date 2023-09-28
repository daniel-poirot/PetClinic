#!/bin/bash

JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export JAVA_HOME

java \
    -javaagent:contrast-agent.jar \
    -Dcontrast.agent.java.standalone_app_name=Petclinic-DTP-Prod \
    -Dcontrast.application.name=Petclinic-DTP-Prod \
    -Dcontrast.config.path=contrast_security.yaml \
    -Dcontrast.server.environment=Production \
    -Dcontrast.server=Petclinic-DTP-Prod \
    -jar ./target/spring-petclinic-1.5.1.jar \
    --server.address=0.0.0.0 \
    --server.port=8080 
