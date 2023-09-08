<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

  <xsl:output method="text"/>

  <xsl:template match="/">
    <xsl:value-of select="AuditMessage/ParticipantObjectIdentification[@ParticipantObjectTypeCode = '1']/@ParticipantObjectTypeCode" /><xsl:text>&#009;</xsl:text>
    <xsl:value-of select="AuditMessage/ParticipantObjectIdentification[@ParticipantObjectTypeCode = '1']/@ParticipantObjectTypeCodeRole" /><xsl:text>&#009;</xsl:text>
    <xsl:value-of select="AuditMessage/ParticipantObjectIdentification[@ParticipantObjectTypeCode = '1']/@ParticipantObjectDataLifeCycle" /><xsl:text>&#009;</xsl:text>

    <xsl:value-of select="AuditMessage/ParticipantObjectIdentification[@ParticipantObjectTypeCode = '1']/ParticipantObjectIDTypeCode/@csd-code" /><xsl:text>&#009;</xsl:text>
    <xsl:value-of select="AuditMessage/ParticipantObjectIdentification[@ParticipantObjectTypeCode = '1']/ParticipantObjectIDTypeCode/@codeSystemName" /><xsl:text>&#009;</xsl:text>
    <xsl:value-of select="AuditMessage/ParticipantObjectIdentification[@ParticipantObjectTypeCode = '1']/ParticipantObjectIDTypeCode/@originalText" /><xsl:text>&#009;</xsl:text>
    
    <xsl:value-of select="AuditMessage/ParticipantObjectIdentification[@ParticipantObjectTypeCode = '1']/@ParticipantObjectSensitivity" /><xsl:text>&#009;</xsl:text>
    <xsl:value-of select="AuditMessage/ParticipantObjectIdentification[@ParticipantObjectTypeCode = '1']/@ParticipantObjectID" /><xsl:text>&#009;</xsl:text>
    <xsl:value-of select="AuditMessage/ParticipantObjectIdentification[@ParticipantObjectTypeCode = '1']/ParticipantObjectName" /><xsl:text>&#009;</xsl:text>
    <xsl:value-of select="AuditMessage/ParticipantObjectIdentification[@ParticipantObjectTypeCode = '1']/ParticipantObjectQuery" /><xsl:text>&#009;</xsl:text>

    <xsl:value-of select="AuditMessage/ParticipantObjectIdentification[@ParticipantObjectTypeCode = '1']/ParticipantObjectDetail[1]/@type" /><xsl:text>&#009;</xsl:text>
    <xsl:value-of select="AuditMessage/ParticipantObjectIdentification[@ParticipantObjectTypeCode = '1']/ParticipantObjectDetail[1]/@value" /><xsl:text>&#009;</xsl:text>
    <xsl:value-of select="AuditMessage/ParticipantObjectIdentification[@ParticipantObjectTypeCode = '1']/ParticipantObjectDetail[2]/@type" /><xsl:text>&#009;</xsl:text>
    <xsl:value-of select="AuditMessage/ParticipantObjectIdentification[@ParticipantObjectTypeCode = '1']/ParticipantObjectDetail[2]/@value" /><xsl:text>&#009;</xsl:text>




    <xsl:value-of select="AuditMessage/ParticipantObjectIdentification[@ParticipantObjectTypeCode = '2']/@ParticipantObjectTypeCode" /><xsl:text>&#009;</xsl:text>
    <xsl:value-of select="AuditMessage/ParticipantObjectIdentification[@ParticipantObjectTypeCode = '2']/@ParticipantObjectTypeCodeRole" /><xsl:text>&#009;</xsl:text>
    <xsl:value-of select="AuditMessage/ParticipantObjectIdentification[@ParticipantObjectTypeCode = '2']/@ParticipantObjectDataLifeCycle" /><xsl:text>&#009;</xsl:text>
    
    <xsl:value-of select="AuditMessage/ParticipantObjectIdentification[@ParticipantObjectTypeCode = '2']/ParticipantObjectIDTypeCode/@csd-code" /><xsl:text>&#009;</xsl:text>
    <xsl:value-of select="AuditMessage/ParticipantObjectIdentification[@ParticipantObjectTypeCode = '2']/ParticipantObjectIDTypeCode/@codeSystemName" /><xsl:text>&#009;</xsl:text>
    <xsl:value-of select="AuditMessage/ParticipantObjectIdentification[@ParticipantObjectTypeCode = '2']/ParticipantObjectIDTypeCode/@originalText" /><xsl:text>&#009;</xsl:text>

    <xsl:value-of select="AuditMessage/ParticipantObjectIdentification[@ParticipantObjectTypeCode = '2']/@ParticipantObjectSensitivity" /><xsl:text>&#009;</xsl:text>
    <xsl:value-of select="AuditMessage/ParticipantObjectIdentification[@ParticipantObjectTypeCode = '2']/@ParticipantObjectID" /><xsl:text>&#009;</xsl:text>
    <xsl:value-of select="AuditMessage/ParticipantObjectIdentification[@ParticipantObjectTypeCode = '2']/ParticipantObjectName" /><xsl:text>&#009;</xsl:text>
    <xsl:value-of select="AuditMessage/ParticipantObjectIdentification[@ParticipantObjectTypeCode = '2']/ParticipantObjectQuery" /><xsl:text>&#009;</xsl:text>

    <xsl:value-of select="AuditMessage/ParticipantObjectIdentification[@ParticipantObjectTypeCode = '2']/ParticipantObjectDetail[1]/@type" /><xsl:text>&#009;</xsl:text>
    <xsl:value-of select="AuditMessage/ParticipantObjectIdentification[@ParticipantObjectTypeCode = '2']/ParticipantObjectDetail[1]/@value" /><xsl:text>&#009;</xsl:text>
    <xsl:value-of select="AuditMessage/ParticipantObjectIdentification[@ParticipantObjectTypeCode = '2']/ParticipantObjectDetail[2]/@type" /><xsl:text>&#009;</xsl:text>
    <xsl:value-of select="AuditMessage/ParticipantObjectIdentification[@ParticipantObjectTypeCode = '2']/ParticipantObjectDetail[2]/@value" /><xsl:text>&#009;</xsl:text>
    
    <xsl:text>&#010;</xsl:text>

  </xsl:template>
</xsl:stylesheet>
