<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
  
    <xsl:output method="text"/>

    <xsl:template match="/">

      <xsl:value-of select="AuditMessage/AuditSourceIdentification/@AuditSourceID" /><xsl:text>&#009;</xsl:text>
      <xsl:value-of select="AuditMessage/AuditSourceIdentification/@AuditEnterpriseSiteID" /><xsl:text>&#009;</xsl:text>

      <xsl:value-of select="AuditMessage/AuditSourceIdentification/AuditSourceTypeCode/@csd-code" /><xsl:text>&#009;</xsl:text>
      <xsl:value-of select="AuditMessage/AuditSourceIdentification/AuditSourceTypeCode/@codeSystemName" /><xsl:text>&#009;</xsl:text>
      <xsl:value-of select="AuditMessage/AuditSourceIdentification/AuditSourceTypeCode/@originalText" />

    </xsl:template>
</xsl:stylesheet>
