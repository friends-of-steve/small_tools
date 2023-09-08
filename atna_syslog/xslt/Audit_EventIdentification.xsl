<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
  
    <xsl:output method="text"/>
    

    <xsl:template match="/">

          <xsl:value-of select="AuditMessage/EventIdentification/@EventActionCode" /><xsl:text>&#009;</xsl:text>
      <xsl:value-of select="AuditMessage/EventIdentification/@EventDateTime" /><xsl:text>&#009;</xsl:text>
      <xsl:value-of select="AuditMessage/EventIdentification/@EventOutcomeIndicator" /><xsl:text>&#009;</xsl:text>
 
      <xsl:value-of select="AuditMessage/EventIdentification/EventID/@csd-code" /><xsl:text>&#009;</xsl:text>
      <xsl:value-of select="AuditMessage/EventIdentification/EventID/@codeSystemName" /><xsl:text>&#009;</xsl:text>
      <xsl:value-of select="AuditMessage/EventIdentification/EventID/@originalText" />

    </xsl:template>
</xsl:stylesheet>
