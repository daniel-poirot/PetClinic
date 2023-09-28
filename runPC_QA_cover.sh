#!/bin/bash

# Instrument PetClinic with JaCoCo and Contrast. Both want to be first...
    -javaagent:jacocoagent.jar \


java \
    -javaagent:contrast-agent.jar \
    -Dcontrast.application.name=Petclinic-dtp \
    -Dcontrast.application.tags="Java 8, Spring 1.5.4, Agent v5.2.2, App v1.5.1" \
    -Dcontrast.config.path=./contrast_security.yaml \
    -Dcontrast.server.environment=QA \
    -Dcontrast.server=Petclinic-dtp-QA \
    -jar ./target/spring-petclinic-1.5.1.jar \
    --server.address=0.0.0.0 \
    --server.port=8081

# fire up Playwright to hit the 'common' routes
npx playwright test --ui

# JaCoCo created a data file. It needs to be in ./target/ for processing to run
mv jacoco.exec ./target/

# The pom.xml has a JaCoCo 'plugin' section, which includes the 'report' target. 
# See: https://www.baeldung.com/jacoco for details
mvn jacoco:report

# View the results
firefox ./target/site/jacoco/index.html
