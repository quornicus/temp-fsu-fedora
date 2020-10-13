<?xml version="1.0" encoding="UTF-8" ?>
<!-- $Id$ -->
<!DOCTYPE log4j:configuration SYSTEM "log4j.dtd">
<log4j:configuration xmlns:log4j="http://jakarta.apache.org/log4j/">

  <appender name="STDOUT" class="org.apache.log4j.ConsoleAppender">
    <layout class="org.apache.log4j.PatternLayout">
      <param name="ConversionPattern" value="%p %d (%c{1}) %m%n"/>
    </layout>
  </appender>
  <logger name="dk.defxws.fedoragsearch" additivity="false">
    <level value="{{getv "/gsearch/dk/defxws/fedoragsearch/log"}}" />
    <appender-ref ref="STDOUT"/>
  </logger>
  <logger name="dk.defxws.fgszebra" additivity="false">
    <level value="{{getv "/gsearch/dk/defxws/fgszebra/log"}}" />
    <appender-ref ref="STDOUT"/>
  </logger>
  <logger name="dk.defxws.fgslucene" additivity="false">
    <level value="{{getv "/gsearch/dk/defxws/fgslucene/log"}}" />
    <appender-ref ref="STDOUT"/>
  </logger>
  <logger name="dk.defxws.fgssolr" additivity="false">
    <level value="{{getv "/gsearch/dk/defxws/fgssolr/log"}}" />
    <appender-ref ref="STDOUT"/>
  </logger>
  <root>
    <level value="{{getv "/gsearch/root/log"}}" />
    <appender-ref ref="STDOUT"/>
  </root>
</log4j:configuration>