FROM amazoncorretto:11-alpine3.17
LABEL author="tarun"
LABEL organisation="qualitythought"
ARG DOWNLOAD_LOACATION="https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-2.4.2.jar"
ARG USERNAME='tarun'
ARG HOMEDIR='/tarun'
RUN useradd  adduser -h ${HOMEDIR} -D -s /bin/sh ${USERNAME}
ADD --chown=tarun:tarun https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-2.4.2.jar /tarun/spring-petclinic.jar
USER ${USERNAME}
WORKDIR ${HOMEDIR}
EXPOSE 8080
CMD [ "java", "-jar", "spring-petclinic.jar" ]
