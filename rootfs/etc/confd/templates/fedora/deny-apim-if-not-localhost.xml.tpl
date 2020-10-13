<?xml version="1.0" encoding="UTF-8"?>
<Policy xmlns="urn:oasis:names:tc:xacml:1.0:policy"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        PolicyId="deny-apim-if-not-localhost"
        RuleCombiningAlgId="urn:oasis:names:tc:xacml:1.0:rule-combining-algorithm:first-applicable">
  <Description>deny apim access if client ip address is not 127.0.0.1 (or IPv6 equivalent)</Description>
  <Target>
    <Subjects>
      <AnySubject/>
    </Subjects>
    <Resources>
      <AnyResource/>
    </Resources>
    <Actions>
      <Action>
        <ActionMatch MatchId="urn:oasis:names:tc:xacml:1.0:function:string-equal">
          <AttributeValue DataType="http://www.w3.org/2001/XMLSchema#string">urn:fedora:names:fedora:2.1:action:api-m</AttributeValue>
          <ActionAttributeDesignator DataType="http://www.w3.org/2001/XMLSchema#string"
            AttributeId="urn:fedora:names:fedora:2.1:action:api"/>
        </ActionMatch>
      </Action>
    </Actions>
  </Target>
  <Rule RuleId="1" Effect="Deny">
    <Condition FunctionId="urn:oasis:names:tc:xacml:1.0:function:not">
      <Apply FunctionId="urn:oasis:names:tc:xacml:1.0:function:or">
        <Apply FunctionId="urn:oasis:names:tc:xacml:1.0:function:string-at-least-one-member-of">
          <EnvironmentAttributeDesignator AttributeId="urn:fedora:names:fedora:2.1:environment:httpRequest:clientIpAddress" DataType="http://www.w3.org/2001/XMLSchema#string"/>
          <Apply FunctionId="urn:oasis:names:tc:xacml:1.0:function:string-bag">
            <AttributeValue DataType="http://www.w3.org/2001/XMLSchema#string">127.0.0.1</AttributeValue>
            <AttributeValue DataType="http://www.w3.org/2001/XMLSchema#string">::1</AttributeValue>
            <AttributeValue DataType="http://www.w3.org/2001/XMLSchema#string">0:0:0:0:0:0:0:1</AttributeValue>
          </Apply>
        </Apply>
        <Apply FunctionId="urn:oasis:names:tc:xacml:1.0:function:string-at-least-one-member-of">
          <EnvironmentAttributeDesignator AttributeId="urn:fedora:names:fedora:2.1:environment:httpRequest:clientFqdn" DataType="http://www.w3.org/2001/XMLSchema#string"/>
          <Apply FunctionId="urn:oasis:names:tc:xacml:1.0:function:string-bag">
            <AttributeValue DataType="http://www.w3.org/2001/XMLSchema#string">localhost</AttributeValue>
            <AttributeValue DataType="http://www.w3.org/2001/XMLSchema#string">fedora</AttributeValue>
            <AttributeValue DataType="http://www.w3.org/2001/XMLSchema#string">{{getv "/apache/endpoint"}}</AttributeValue>
            <AttributeValue DataType="http://www.w3.org/2001/XMLSchema#string">{{getv "/db/endpoint"}}</AttributeValue>
            <AttributeValue DataType="http://www.w3.org/2001/XMLSchema#string">isle-images</AttributeValue>
            <AttributeValue DataType="http://www.w3.org/2001/XMLSchema#string">{{getv "/image/services/endpoint"}}</AttributeValue>
            <AttributeValue DataType="http://www.w3.org/2001/XMLSchema#string">isle.localdomain</AttributeValue>
            <AttributeValue DataType="http://www.w3.org/2001/XMLSchema#string">images.isle.localdomain</AttributeValue>
          </Apply>
        </Apply>
        <Apply FunctionId="urn:oasis:names:tc:xacml:1.0:function:regexp-string-match">
          <AttributeValue DataType="http://www.w3.org/2001/XMLSchema#string">\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}</AttributeValue>
          <Apply FunctionId="urn:oasis:names:tc:xacml:1.0:function:string-one-and-only">
            <EnvironmentAttributeDesignator AttributeId="urn:fedora:names:fedora:2.1:environment:httpRequest:clientIpAddress" DataType="http://www.w3.org/2001/XMLSchema#string"/>
          </Apply>
        </Apply>
      </Apply>
    </Condition>
  </Rule>
</Policy>
