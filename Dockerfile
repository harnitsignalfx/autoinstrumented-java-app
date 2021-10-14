FROM openjdk:8

COPY jaxrs-quickstart-1.0-SNAPSHOT-jar-with-dependencies.jar ./

COPY splunk-otel-javaagent.jar ./

CMD java -Dotel.javaagent.debug=true -Dotel.instrumentation.grizzly.enabled=true -javaagent:./splunk-otel-javaagent.jar -jar jaxrs-quickstart-1.0-SNAPSHOT-jar-with-dependencies.jar
