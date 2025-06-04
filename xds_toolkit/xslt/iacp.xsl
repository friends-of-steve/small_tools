<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"
  xmlns:soapenv="http://www.w3.org/2003/05/soap-envelope"
  xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd"
  xmlns:saml2="urn:oasis:names:tc:SAML:2.0:assertion"
  xmlns:hl7v3="urn:hl7-org:v3">

  <xsl:output method="text"/>

  <xsl:template match="soapenv:Envelope">
    <xsl:value-of select="normalize-space(soapenv:Header/wsse:Security/saml2:Assertion/@ID)" /><xsl:text>&#009;</xsl:text>
    <xsl:value-of select="normalize-space(soapenv:Header/wsse:Security/saml2:Assertion/@IssueInstant)" /><xsl:text>&#009;</xsl:text>

    <xsl:value-of select="normalize-space(soapenv:Header/wsse:Security/saml2:Assertion/saml2:Issuer)" /><xsl:text>&#009;</xsl:text>

    <!--Subject/NameID-->         <xsl:value-of select="normalize-space(soapenv:Header/wsse:Security/saml2:Assertion/saml2:Subject/saml2:NameID)" /><xsl:text>&#009;</xsl:text>

    <!--Conditions @NotBefore-->  <xsl:value-of select="normalize-space(soapenv:Header/wsse:Security/saml2:Assertion/saml2:Conditions/@NotBefore)" /><xsl:text>&#009;</xsl:text>
    <!--Conditions @NotOnOrAfter-->  <xsl:value-of select="normalize-space(soapenv:Header/wsse:Security/saml2:Assertion/saml2:Conditions/@NotOnOrAfter)" /><xsl:text>&#009;</xsl:text>

    <!--XSPA Organization-->     <xsl:value-of select="normalize-space(soapenv:Header/wsse:Security/saml2:Assertion/saml2:AttributeStatement/saml2:Attribute[@Name='urn:oasis:names:tc:xspa:1.0:subject:organization'])" /><xsl:text>&#009;</xsl:text>
    <!--XSPA Organization ID-->   <xsl:value-of select="normalize-space(soapenv:Header/wsse:Security/saml2:Assertion/saml2:AttributeStatement/saml2:Attribute[@Name='urn:oasis:names:tc:xspa:1.0:subject:organization-id'])" /><xsl:text>&#009;</xsl:text>

    
    <!--HCID (IHE)-->             <xsl:value-of select="normalize-space(soapenv:Header/wsse:Security/saml2:Assertion/saml2:AttributeStatement/saml2:Attribute[@Name='urn:ihe:iti:xca:2010:homeCommunityId'])" /><xsl:text>&#009;</xsl:text>
    <!--HCID (nhin)-->            <xsl:value-of select="normalize-space(soapenv:Header/wsse:Security/saml2:Assertion/saml2:AttributeStatement/saml2:Attribute[@Name='urn:nhin:names:saml:homeCommunityId'])" /><xsl:text>&#009;</xsl:text>
    
    <!--Subject Role @code-->            <xsl:value-of select="normalize-space(soapenv:Header/wsse:Security/saml2:Assertion/saml2:AttributeStatement/saml2:Attribute[@Name='urn:oasis:names:tc:xacml:2.0:subject:role']/saml2:AttributeValue/hl7v3:Role/@code)" /><xsl:text>&#009;</xsl:text>
    <!--Subject Role @codeSystem-->            <xsl:value-of select="normalize-space(soapenv:Header/wsse:Security/saml2:Assertion/saml2:AttributeStatement/saml2:Attribute[@Name='urn:oasis:names:tc:xacml:2.0:subject:role']/saml2:AttributeValue/hl7v3:Role/@codeSystem)" /><xsl:text>&#009;</xsl:text>
    <!--Subject Role @displayName-->            <xsl:value-of select="normalize-space(soapenv:Header/wsse:Security/saml2:Assertion/saml2:AttributeStatement/saml2:Attribute[@Name='urn:oasis:names:tc:xacml:2.0:subject:role']/saml2:AttributeValue/hl7v3:Role/@displayName)" /><xsl:text>&#009;</xsl:text>

    <!--PurposeOfUse @code-->           <xsl:value-of select="normalize-space(soapenv:Header/wsse:Security/saml2:Assertion/saml2:AttributeStatement/saml2:Attribute[@Name='urn:oasis:names:tc:xspa:1.0:subject:purposeofuse']/saml2:AttributeValue/hl7v3:PurposeOfUse/@code)" /><xsl:text>&#009;</xsl:text>
    <!--PurposeOfUse @codeSystem-->            <xsl:value-of select="normalize-space(soapenv:Header/wsse:Security/saml2:Assertion/saml2:AttributeStatement/saml2:Attribute[@Name='urn:oasis:names:tc:xspa:1.0:subject:purposeofuse']/saml2:AttributeValue/hl7v3:PurposeOfUse/@codeSystem)" /><xsl:text>&#009;</xsl:text>
    <!--PurposeOfUse @displayName-->            <xsl:value-of select="normalize-space(soapenv:Header/wsse:Security/saml2:Assertion/saml2:AttributeStatement/saml2:Attribute[@Name='urn:oasis:names:tc:xspa:1.0:subject:purposeofuse']/saml2:AttributeValue/hl7v3:PurposeOfUse/@displayName)" /><xsl:text>&#009;</xsl:text>
  
    <!--Subject Identifier-->      <xsl:value-of select="normalize-space(soapenv:Header/wsse:Security/saml2:Assertion/saml2:AttributeStatement/saml2:Attribute[@Name='urn:oasis:names:tc:xspa:1.0:subject:subject-id']/saml2:AttributeValue)" /><xsl:text>&#009;</xsl:text>
    <!--Policy Identifier-->       <xsl:value-of select="normalize-space(soapenv:Header/wsse:Security/saml2:Assertion/saml2:AttributeStatement/saml2:Attribute[@Name='urn:ihe:iti:xua:2012:acp']/saml2:AttributeValue)" /><xsl:text>&#009;</xsl:text>
    <!--IACP Document ID-->        <xsl:value-of select="normalize-space(soapenv:Header/wsse:Security/saml2:Assertion/saml2:AttributeStatement/saml2:Attribute[@Name='urn:ihe:iti:bppc:2007:docid']/saml2:AttributeValue)" /><xsl:text>&#010;</xsl:text>


  </xsl:template>
</xsl:stylesheet>
