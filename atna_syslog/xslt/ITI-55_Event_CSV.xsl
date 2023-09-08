<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
  
    <xsl:output method="text"/>
    <xsl:template match="AuditMessage/EventIdentification">
      <xsl:text>EventIdentification&#009;@EventActionCode&#009;M&#009;E&#009;</xsl:text>                <xsl:value-of select="@EventActionCode" /><xsl:text>&#010;</xsl:text>
      <xsl:text>EventIdentification&#009;@EventDateTime&#009;M&#009;xsd:dateTime&#009;</xsl:text>       <xsl:value-of select="@EventDateTime" /><xsl:text>&#010;</xsl:text>
      <xsl:text>EventIdentification&#009;@EventOutcomeIndicator&#009;M&#009;{0,4,8,12}&#009;</xsl:text> <xsl:value-of select="@EventOutcomeIndicator" /><xsl:text>&#010;</xsl:text>
      <xsl:text>EventIdentification/EventID&#009;@csd-code&#009;M&#009;110112&#009;</xsl:text>          <xsl:value-of select="EventID/@csd-code" /><xsl:text>&#010;</xsl:text>
      <xsl:text>EventIdentification/EventID&#009;@codeSystemName&#009;M&#009;DCM&#009;</xsl:text>       <xsl:value-of select="EventID/@codeSystemName" /><xsl:text>&#010;</xsl:text>
      <xsl:text>EventIdentification/EventID&#009;@originalText&#009;M&#009;Query&#009;</xsl:text>       <xsl:value-of select="EventID/@originalText" /><xsl:text>&#010;</xsl:text>
      <xsl:text>EventIdentification/EventTypeCode&#009;@csd-code&#009;M&#009;ITI-55&#009;</xsl:text>                              <xsl:value-of select="EventTypeCode/@csd-code" /><xsl:text>&#010;</xsl:text>
      <xsl:text>EventIdentification/EventTypeCode&#009;@codeSystemName&#009;M&#009;IHE Transactions&#009;</xsl:text>              <xsl:value-of select="EventTypeCode/@codeSystemName" /><xsl:text>&#010;</xsl:text>
      <xsl:text>EventIdentification/EventTypeCode&#009;@originalText&#009;M&#009;Cross Gateway Patient Discovery&#009;</xsl:text> <xsl:value-of select="EventTypeCode/@originalText" /><xsl:text>&#010;</xsl:text>
      <xsl:text>XXX</xsl:text>
    </xsl:template>
</xsl:stylesheet>
