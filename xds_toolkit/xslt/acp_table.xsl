<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"
  xmlns:soapenv="http://www.w3.org/2003/05/soap-envelope"
  xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd"
  xmlns:saml2="urn:oasis:names:tc:SAML:2.0:assertion"
  xmlns:hl7v3="urn:hl7-org:v3">

  <xsl:output method="text"/>

  <xsl:template match="soapenv:Envelope">
    <xsl:text>Asserton @ID&#009;</xsl:text>              <xsl:value-of select="normalize-space(soapenv:Header/wsse:Security/saml2:Assertion/@ID)" /><xsl:text>&#010;</xsl:text>
    <xsl:text>Assertion @IssueInstant&#009;</xsl:text>   <xsl:value-of select="normalize-space(soapenv:Header/wsse:Security/saml2:Assertion/@IssueInstant)" /><xsl:text>&#010;</xsl:text>

    <xsl:text>Assertion/Issuer&#009;</xsl:text>          <xsl:value-of select="normalize-space(soapenv:Header/wsse:Security/saml2:Assertion/saml2:Issuer)" /><xsl:text>&#010;</xsl:text>

    <xsl:text>Subject/NameID&#009;</xsl:text>            <xsl:value-of select="normalize-space(soapenv:Header/wsse:Security/saml2:Assertion/saml2:Subject/saml2:NameID)" /><xsl:text>&#010;</xsl:text>

    <xsl:text>Conditions @NotBefore&#009;</xsl:text>     <xsl:value-of select="normalize-space(soapenv:Header/wsse:Security/saml2:Assertion/saml2:Conditions/@NotBefore)" /><xsl:text>&#010;</xsl:text>
    <xsl:text>Conditions @NotOnOrAfter&#009;</xsl:text>  <xsl:value-of select="normalize-space(soapenv:Header/wsse:Security/saml2:Assertion/saml2:Conditions/@NotOnOrAfter)" /><xsl:text>&#010;</xsl:text>

    <xsl:text>XSPA Organization&#009;</xsl:text>         <xsl:value-of select="normalize-space(soapenv:Header/wsse:Security/saml2:Assertion/saml2:AttributeStatement/saml2:Attribute[@Name='urn:oasis:names:tc:xspa:1.0:subject:organization'])" /><xsl:text>&#010;</xsl:text>
    <xsl:text>XSPA Organization ID&#009;</xsl:text>      <xsl:value-of select="normalize-space(soapenv:Header/wsse:Security/saml2:Assertion/saml2:AttributeStatement/saml2:Attribute[@Name='urn:oasis:names:tc:xspa:1.0:subject:organization-id'])" /><xsl:text>&#010;</xsl:text>

    
    <xsl:text>HCID (IHE)&#009;</xsl:text>                <xsl:value-of select="normalize-space(soapenv:Header/wsse:Security/saml2:Assertion/saml2:AttributeStatement/saml2:Attribute[@Name='urn:ihe:iti:xca:2010:homeCommunityId'])" /><xsl:text>&#010;</xsl:text>
    <xsl:text>HCID (nhin)&#009;</xsl:text>               <xsl:value-of select="normalize-space(soapenv:Header/wsse:Security/saml2:Assertion/saml2:AttributeStatement/saml2:Attribute[@Name='urn:nhin:names:saml:homeCommunityId'])" /><xsl:text>&#010;</xsl:text>
    
    <xsl:text>Subject Role @code&#009;</xsl:text>        <xsl:value-of select="normalize-space(soapenv:Header/wsse:Security/saml2:Assertion/saml2:AttributeStatement/saml2:Attribute[@Name='urn:oasis:names:tc:xacml:2.0:subject:role']/saml2:AttributeValue/hl7v3:Role/@code)" /><xsl:text>&#010;</xsl:text>
    <xsl:text>Subject Role @codeSystem&#009;</xsl:text>  <xsl:value-of select="normalize-space(soapenv:Header/wsse:Security/saml2:Assertion/saml2:AttributeStatement/saml2:Attribute[@Name='urn:oasis:names:tc:xacml:2.0:subject:role']/saml2:AttributeValue/hl7v3:Role/@codeSystem)" /><xsl:text>&#010;</xsl:text>
    <xsl:text>Subject Role @displayName&#009;</xsl:text> <xsl:value-of select="normalize-space(soapenv:Header/wsse:Security/saml2:Assertion/saml2:AttributeStatement/saml2:Attribute[@Name='urn:oasis:names:tc:xacml:2.0:subject:role']/saml2:AttributeValue/hl7v3:Role/@displayName)" /><xsl:text>&#010;</xsl:text>

    <xsl:text>PurposeOfUse @code&#009;</xsl:text>        <xsl:value-of select="normalize-space(soapenv:Header/wsse:Security/saml2:Assertion/saml2:AttributeStatement/saml2:Attribute[@Name='urn:oasis:names:tc:xspa:1.0:subject:purposeofuse']/saml2:AttributeValue/hl7v3:PurposeOfUse/@code)" /><xsl:text>&#010;</xsl:text>
    <xsl:text>PurposeOfUse @codeSystem&#009;</xsl:text>  <xsl:value-of select="normalize-space(soapenv:Header/wsse:Security/saml2:Assertion/saml2:AttributeStatement/saml2:Attribute[@Name='urn:oasis:names:tc:xspa:1.0:subject:purposeofuse']/saml2:AttributeValue/hl7v3:PurposeOfUse/@codeSystem)" /><xsl:text>&#010;</xsl:text>
    <xsl:text>PurposeOfUse @displayName&#009;</xsl:text> <xsl:value-of select="normalize-space(soapenv:Header/wsse:Security/saml2:Assertion/saml2:AttributeStatement/saml2:Attribute[@Name='urn:oasis:names:tc:xspa:1.0:subject:purposeofuse']/saml2:AttributeValue/hl7v3:PurposeOfUse/@displayName)" /><xsl:text>&#010;</xsl:text>
  
    <xsl:text>Subject Identifier&#009;</xsl:text>        <xsl:value-of select="normalize-space(soapenv:Header/wsse:Security/saml2:Assertion/saml2:AttributeStatement/saml2:Attribute[@Name='urn:oasis:names:tc:xspa:1.0:subject:subject-id']/saml2:AttributeValue)" /><xsl:text>&#010;</xsl:text>
    <xsl:text>Policy Identifier&#009;</xsl:text>         <xsl:value-of select="normalize-space(soapenv:Header/wsse:Security/saml2:Assertion/saml2:AttributeStatement/saml2:Attribute[@Name='urn:ihe:iti:xua:2012:acp']/saml2:AttributeValue)" /><xsl:text>&#010;</xsl:text>
    <xsl:text>IACP Document ID&#009;</xsl:text>          <xsl:value-of select="normalize-space(soapenv:Header/wsse:Security/saml2:Assertion/saml2:AttributeStatement/saml2:Attribute[@Name='urn:ihe:iti:bppc:2007:docid']/saml2:AttributeValue)" /><xsl:text>&#010;</xsl:text>

  </xsl:template>
</xsl:stylesheet>
