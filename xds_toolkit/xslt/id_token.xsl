<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"
  xmlns:soapenv="http://www.w3.org/2003/05/soap-envelope"
  xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd"
  xmlns:saml2="urn:oasis:names:tc:SAML:2.0:assertion"
  xmlns:hl7v3="urn:hl7-org:v3">

  <xsl:output method="text"/>
  <xsl:template match="soapenv:Envelope">
    <xsl:value-of select="normalize-space(soapenv:Header/wsse:Security/saml2:Assertion/saml2:AttributeStatement/saml2:Attribute[@Name='id_token']/saml2:AttributeValue)" />

  </xsl:template>
</xsl:stylesheet>
