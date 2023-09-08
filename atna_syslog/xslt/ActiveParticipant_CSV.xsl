<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
  
    <xsl:output method="text"/>
    <xsl:template match="AuditMessage/ActiveParticipant">
      <xsl:text>ActiveParticipant&#009;@UserID&#009;M&#009;xxx&#009;</xsl:text>                      <xsl:value-of select="@UserID" /><xsl:text>&#010;</xsl:text>
      <xsl:text>ActiveParticipant&#009;@AlternativeUserID&#009;M&#009;xxx&#009;</xsl:text>           <xsl:value-of select="@AlternativeUserID" /><xsl:text>&#010;</xsl:text>
      <xsl:text>ActiveParticipant&#009;@UserName&#009;M&#009;xxx&#009;</xsl:text>                    <xsl:value-of select="@UserName" /><xsl:text>&#010;</xsl:text>
      <xsl:text>ActiveParticipant&#009;@UserIsRequestor&#009;M&#009;xxx&#009;</xsl:text>             <xsl:value-of select="@UserIsRequestor" /><xsl:text>&#010;</xsl:text>
      <xsl:text>ActiveParticipant&#009;@NetworkAccessPointID&#009;M&#009;xxx&#009;</xsl:text>        <xsl:value-of select="@NetworkAccessPointID" /><xsl:text>&#010;</xsl:text>
      <xsl:text>ActiveParticipant&#009;@NetworkAccessPointTypeCode&#009;M&#009;xxx&#009;</xsl:text>   <xsl:value-of select="@NetworkAccessPointTypeCode" /><xsl:text>&#010;</xsl:text>
    </xsl:template>
</xsl:stylesheet>
