<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"
  xmlns:soapenv="http://www.w3.org/2003/05/soap-envelope"
  xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd"
  xmlns:saml2="urn:oasis:names:tc:SAML:2.0:assertion"
  xmlns:hl7v3="urn:hl7-org:v3">

  <!-- Output tab delimited line with vaues of interest for Exchange Purpose testing -->
  <xsl:output method="text"/>

  <xsl:template match="soapenv:Envelope">
    <xsl:value-of select="normalize-space(soapenv:Header/wsse:Security/saml2:Assertion/@ID)" /><xsl:text>&#009;</xsl:text>
    <xsl:value-of select="normalize-space(soapenv:Header/wsse:Security/saml2:Assertion/@IssueInstant)" /><xsl:text>&#009;</xsl:text>

    <xsl:value-of select="normalize-space(soapenv:Header/wsse:Security/saml2:Assertion/saml2:Issuer)" /><xsl:text>&#009;</xsl:text>

    <!--Subject/NameID-->         <xsl:value-of select="normalize-space(soapenv:Header/wsse:Security/saml2:Assertion/saml2:Subject/saml2:NameID)" /><xsl:text>&#009;</xsl:text>

    <!--PurposeOfUse @code-->           <xsl:value-of select="normalize-space(soapenv:Header/wsse:Security/saml2:Assertion/saml2:AttributeStatement/saml2:Attribute[@Name='urn:oasis:names:tc:xspa:1.0:subject:purposeofuse']/saml2:AttributeValue/hl7v3:PurposeOfUse/@code)" /><xsl:text>&#009;</xsl:text>
    <!--PurposeOfUse @codeSystem-->            <xsl:value-of select="normalize-space(soapenv:Header/wsse:Security/saml2:Assertion/saml2:AttributeStatement/saml2:Attribute[@Name='urn:oasis:names:tc:xspa:1.0:subject:purposeofuse']/saml2:AttributeValue/hl7v3:PurposeOfUse/@codeSystem)" /><xsl:text>&#009;</xsl:text>
    <!--PurposeOfUse @displayName-->            <xsl:value-of select="normalize-space(soapenv:Header/wsse:Security/saml2:Assertion/saml2:AttributeStatement/saml2:Attribute[@Name='urn:oasis:names:tc:xspa:1.0:subject:purposeofuse']/saml2:AttributeValue/hl7v3:PurposeOfUse/@displayName)" /><xsl:text>&#009;</xsl:text>
  
  </xsl:template>
</xsl:stylesheet>
