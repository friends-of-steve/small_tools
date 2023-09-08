<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

  <xsl:output method="text"/>

  <xsl:template match="/">
    <xsl:for-each select="AuditMessage/ActiveParticipant">
      
      <xsl:variable name="RoleIDCodeX" select="RoleIDCode/@csd-code"/>
      <xsl:choose>
        <xsl:when test="(not($RoleIDCodeX = '110152') and not($RoleIDCodeX = '110153'))">
          <xsl:value-of select="@UserID" /><xsl:text>&#009;</xsl:text>
          <xsl:value-of select="@AlternativeUserID" /><xsl:text>&#009;</xsl:text>
          <xsl:value-of select="@UserName" /><xsl:text>&#009;</xsl:text>
          <xsl:value-of select="@UserIsRequestor" /><xsl:text>&#009;</xsl:text>
          <xsl:value-of select="@NetworkAccessPointTypeCode" /><xsl:text>&#009;</xsl:text>
          <xsl:value-of select="@NetworkAccessPointID" /><xsl:text>&#009;</xsl:text>
          <xsl:value-of select="RoleIDCode/@csd-code" /><xsl:text>&#009;</xsl:text>
          <xsl:value-of select="RoleIDCode/@codeSystemName" /><xsl:text>&#009;</xsl:text>
          <xsl:value-of select="RoleIDCode/@originalText" /><xsl:text>&#009;</xsl:text>
          <xsl:text>&#010;</xsl:text>
        </xsl:when>
      </xsl:choose>
    </xsl:for-each>
    
  </xsl:template>
</xsl:stylesheet>
