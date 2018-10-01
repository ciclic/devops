FROM maven:3.5-jdk-8-alpine as build

COPY pom.xml ./
RUN mvn verify --fail-never

COPY . ./
RUN mvn package

FROM jboss/wildfly:14.0.1.Final

COPY --from=build target/devops-test-0.0.1-SNAPSHOT.war /opt/jboss/wildfly/standalone/deployments/
