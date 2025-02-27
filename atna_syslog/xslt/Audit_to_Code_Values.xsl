<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

  <xsl:output method="text"/>

  <xsl:template match="/">
    <xsl:text>(</xsl:text>
    <xsl:value-of select="AuditMessage/EventIdentification/EventID/@csd-code"/>
    <xsl:text>:</xsl:text>
    <xsl:value-of select="AuditMessage/EventIdentification/EventID/@codeSystemName"/>
    <xsl:text>)</xsl:text>

    <xsl:text>(</xsl:text>
    <xsl:value-of select="AuditMessage/EventIdentification/EventTypeCode/@csd-code"/>
    <xsl:text>:</xsl:text>
    <xsl:value-of select="AuditMessage/EventIdentification/EventTypeCode/@codeSystemName"/>
    <xsl:text>)</xsl:text>

    <!-- This should return 'true' when the source is the requestor and help us identify client/server for ITI-38 and ITI-55 -->
    <xsl:value-of select="AuditMessage/ActiveParticipant/RoleIDCode[@csd-code = '110153']/../@UserIsRequestor"/>

  </xsl:template>
</xsl:stylesheet>
