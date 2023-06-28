<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
  
    <xsl:output method="text"/>
    

    <xsl:template match="/">
        <xsl:text>(</xsl:text>
        <xsl:value-of select="AuditMessage/EventIdentification/EventID/@csd-code" /><xsl:text>:</xsl:text>
        <xsl:value-of select="AuditMessage/EventIdentification/EventID/@codeSystemName" /><xsl:text>)</xsl:text>
        
        <xsl:text>(</xsl:text>
        <xsl:value-of select="AuditMessage/EventIdentification/EventTypeCode/@csd-code" /><xsl:text>:</xsl:text>
        <xsl:value-of select="AuditMessage/EventIdentification/EventTypeCode/@codeSystemName" /><xsl:text>)</xsl:text><xsl:text>&#x09;</xsl:text>
        
        <xsl:value-of select="AuditMessage/EventIdentification/PurposeOfUse/@csd-code" /><xsl:text>&#x09;</xsl:text>
        
        <xsl:value-of select="AuditMessage/EventIdentification/PurposeOfUse/@codeSystemName" /><xsl:text>&#x09;</xsl:text>
        <xsl:value-of select="AuditMessage/EventIdentification/PurposeOfUse/@originalText" /><xsl:text>&#x09;</xsl:text>
        <xsl:value-of select="AuditMessage/ActiveParticipant/RoleIDCode[@csd-code='110153']/../@UserID" /><xsl:text>&#x09;</xsl:text>
        <xsl:value-of select="AuditMessage/ActiveParticipant/RoleIDCode[@csd-code='110152']/../@UserID" /><xsl:text>&#x09;</xsl:text>
        <!--
        <xsl:value-of select="AuditMessage/ActiveParticipant/RoleIDCode[@csd-code='110152']/../../ActiveParticipant[1]/@UserID" /><xsl:text>&#x09;</xsl:text>
        -->
    </xsl:template>
</xsl:stylesheet>
