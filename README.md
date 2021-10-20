# autoinstrumented-java-app
An autoinstrumented java app for testing


This app listens on endpoint of 'ping' on port 6001 and returns the text "Service online".
The Dockerfile includes version 1.4.0 of the splunk-otel-java jar file.

It uses jax-rs and grizzly. The autoinstrumentation requires a special flag to autoinstrument grizzly.

Startup commands for the docker file - 

```SPLUNK_ACCESS_TOKEN=<token> OTEL_PROPAGATORS=b3multi OTEL_RESOURCE_ATTRIBUTES=deployment.environment=standalone,service.name=test-java-listener OTEL_TRACES_EXPORTER=jaeger-thrift-splunk OTEL_EXPORTER_JAEGER_ENDPOINT=https://ingest.<realm>.signalfx.com/v2/trace java -Dotel.javaagent.debug=true -Dotel.instrumentation.grizzly.enabled=true -javaagent:./splunk-otel-javaagent.jar -jar jaxrs-quickstart-1.0-SNAPSHOT-jar-with-dependencies.jar```
