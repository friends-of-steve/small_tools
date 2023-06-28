<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
  <!--
    <xsl:output method="html" omit-xml-declaration="yes" indent="no"/>
    -->

    <xsl:template match="/">
      <html>
        <body>
        <table border="2" cellspacing="5">
          <tr><th>Element</th><th>Key</th><th>Value</th></tr>
          <tr><td>EventIdentification</td><td>EventActionCode</td><td><xsl:value-of select="AuditMessage/EventIdentification/@EventActionCode" /></td></tr>
          <tr><td>EventIdentification</td><td>EventDateTime</td><td><xsl:value-of select="AuditMessage/EventIdentification/@EventDateTime" /></td></tr>
          <tr><td>EventIdentification</td><td>EventOutcomeIndicator</td><td><xsl:value-of select="AuditMessage/EventIdentification/@EventOutcomeIndicator" /></td></tr>
 
          <tr><td>EventIdentification.EventID</td><td>csd-code</td><td><xsl:value-of select="AuditMessage/EventIdentification/EventID/@csd-code" /></td></tr>
          <tr><td>EventIdentification.EventID</td><td>codeSystemName</td><td><xsl:value-of select="AuditMessage/EventIdentification/EventID/@codeSystemName" /></td></tr>
          <tr><td>EventIdentification.EventID</td><td>originalText</td><td><xsl:value-of select="AuditMessage/EventIdentification/EventID/@originalText" /></td></tr>
          
          <tr><td>EventIdentification.EventTypeCode</td><td>csd-code</td><td><xsl:value-of select="AuditMessage/EventIdentification/EventID/@csd-code" /></td></tr>
          
        </table>
        </body>
      </html>
    </xsl:template>
</xsl:stylesheet>
