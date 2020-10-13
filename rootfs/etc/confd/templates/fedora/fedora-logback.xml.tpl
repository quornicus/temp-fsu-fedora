<?xml version="1.0" encoding="UTF-8"?>
<configuration scan="true" scanPeriod="60 seconds">
  <appender name="STDOUT" class="ch.qos.logback.core.ConsoleAppender">
    <encoder>
      <pattern>%p %d{yyyy-MM-dd' 'HH:mm:ss.SSS} [%t] \(%c{0}\) %m%n</pattern>
    </encoder>
  </appender>
  <logger name="org.fcrepo" additivity="false" level="{{getv "/fedora/org/fcrepo/log"}}">
    <appender-ref ref="STDOUT"/>
  </logger>
  <logger name="org.apache.cxf" additivity="false" level="{{getv "/fedora/org/apache/cxf/log"}}">
    <appender-ref ref="STDOUT"/>
  </logger>
  <logger name="org.fcrepo.server.security.jaas" additivity="false" level="{{getv "/fedora/org/fcrepo/server/security/jaas/log"}}">
    <appender-ref ref="STDOUT"/>
  </logger>
  <logger name="org.fcrepo.server.security.xacml" additivity="false" level="{{getv "/fedora/org/fcrepo/server/security/xacml/log"}}">
    <appender-ref ref="STDOUT"/>
  </logger>
   <root additivity="false" level="{{getv "/fedora/root/log"}}">
    <appender-ref ref="STDOUT"/>
  </root>
</configuration>