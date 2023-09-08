<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
  
    <xsl:output method="text"/>
<!--    <xsl:include href="ITI-55_Event_CSV.xsl"/>
    <xsl:include href="ActiveParticipant_CSV.xsl"/>-->

    <xsl:template match="/">
      <xsl:text>EventIdentification/EventID&#009;@csd-code&#009;M&#009;110112&#009;</xsl:text>          <xsl:value-of select="AuditMessage/EventIdentification/EventID/@csd-code" /><xsl:text>&#010;</xsl:text>
      <xsl:text>EventIdentification/EventID&#009;@codeSystemName&#009;M&#009;DCM&#009;</xsl:text>       <xsl:value-of select="AuditMessage/EventIdentification/EventID/@codeSystemName" /><xsl:text>&#010;</xsl:text>
      <xsl:text>EventIdentification/EventID&#009;@originalText&#009;M&#009;Query&#009;</xsl:text>       <xsl:value-of select="AuditMessage/EventIdentification/EventID/@originalText" /><xsl:text>&#010;</xsl:text>

      <xsl:text>Label&#009;Modifier&#009;Optionality&#009;Expected&#009;Provided</xsl:text><xsl:text>&#010;</xsl:text>
      <xsl:text>EventIdentification&#009;@EventActionCode&#009;M&#009;E&#009;</xsl:text>                <xsl:value-of select="AuditMessage/EventIdentification/@EventActionCode" /><xsl:text>&#010;</xsl:text>
      <xsl:text>EventIdentification&#009;@EventDateTime&#009;M&#009;xsd:dateTime&#009;</xsl:text>       <xsl:value-of select="AuditMessage/EventIdentification/@EventDateTime" /><xsl:text>&#010;</xsl:text>
      <xsl:text>EventIdentification&#009;@EventOutcomeIndicator&#009;M&#009;{0,4,8,12}&#009;</xsl:text> <xsl:value-of select="AuditMessage/EventIdentification/@EventOutcomeIndicator" /><xsl:text>&#010;</xsl:text>
      
 
      <xsl:text>EventIdentification/EventTypeCode&#009;@csd-code&#009;M&#009;ITI-55&#009;</xsl:text>                              <xsl:value-of select="AuditMessage/EventIdentification/EventTypeCode/@csd-code" /><xsl:text>&#010;</xsl:text>
      <xsl:text>EventIdentification/EventTypeCode&#009;@codeSystemName&#009;M&#009;IHE Transactions&#009;</xsl:text>              <xsl:value-of select="AuditMessage/EventIdentification/EventTypeCode/@codeSystemName" /><xsl:text>&#010;</xsl:text>
      <xsl:text>EventIdentification/EventTypeCode&#009;@originalText&#009;M&#009;Cross Gateway Patient Discovery&#009;</xsl:text> <xsl:value-of select="AuditMessage/EventIdentification/EventTypeCode/@originalText" /><xsl:text>&#010;</xsl:text>
      
      <xsl:for-each select="AuditMessage/ActiveParticipant">
        <xsl:text>ActiveParticipant</xsl:text>                                                                                         <xsl:text>&#010;</xsl:text>
        <xsl:text>ActiveParticipant&#009;@UserID&#009;?&#009;xxx&#009;</xsl:text>                      <xsl:value-of select="@UserID" /><xsl:text>&#010;</xsl:text>
        <xsl:text>ActiveParticipant&#009;@AlternativeUserID&#009;?&#009;xxx&#009;</xsl:text>           <xsl:value-of select="@AlternativeUserID" /><xsl:text>&#010;</xsl:text>
        <xsl:text>ActiveParticipant&#009;@UserName&#009;?&#009;xxx&#009;</xsl:text>                    <xsl:value-of select="@UserName" /><xsl:text>&#010;</xsl:text>
        <xsl:text>ActiveParticipant&#009;@UserIsRequestor&#009;?&#009;xxx&#009;</xsl:text>             <xsl:value-of select="@UserIsRequestor" /><xsl:text>&#010;</xsl:text>
        <xsl:text>ActiveParticipant&#009;@NetworkAccessPointID&#009;?&#009;xxx&#009;</xsl:text>        <xsl:value-of select="@NetworkAccessPointID" /><xsl:text>&#010;</xsl:text>
        <xsl:text>ActiveParticipant&#009;@NetworkAccessPointTypeCode&#009;?&#009;xxx&#009;</xsl:text>   <xsl:value-of select="@NetworkAccessPointTypeCode" /><xsl:text>&#010;</xsl:text>

        <xsl:text>ActiveParticipant/RoleIDCode&#009;@csd-code&#009;?&#009;{110152,110153}&#009;</xsl:text>                            <xsl:value-of select="RoleIDCode/@csd-code" /><xsl:text>&#010;</xsl:text>
        <xsl:text>ActiveParticipant/RoleIDCode&#009;@codeSystemName&#009;?&#009;DCM&#009;</xsl:text>                                  <xsl:value-of select="RoleIDCode/@codeSystemName" /><xsl:text>&#010;</xsl:text>
        <xsl:text>ActiveParticipant/RoleIDCode&#009;@originalText&#009;?&#009;{Destination Role ID,Source Role ID}&#009;</xsl:text>   <xsl:value-of select="RoleIDCode/@originalText" /><xsl:text>&#010;</xsl:text>
      </xsl:for-each>
      
      <xsl:text>ParticipantObjectIdentification&#009;@ParticipantObjectTypeCode&#009;M&#009;2&#009;</xsl:text>                <xsl:value-of select="AuditMessage/ParticipantObjectIdentification/@ParticipantObjectTypeCode" /><xsl:text>&#010;</xsl:text>
      <xsl:text>ParticipantObjectIdentification&#009;@ParticipantObjectTypeCodeRole&#009;M&#009;24&#009;</xsl:text>           <xsl:value-of select="AuditMessage/ParticipantObjectIdentification/@ParticipantObjectTypeCodeRole" /><xsl:text>&#010;</xsl:text>
      <xsl:text>ParticipantObjectIdentification&#009;@ParticipantObjectDataLifeCycle&#009;U&#009;xxx&#009;</xsl:text>         <xsl:value-of select="AuditMessage/ParticipantObjectIdentification/@PParticipantObjectDataLifeCycle" /><xsl:text>&#010;</xsl:text>

      <xsl:text>ParticipantObjectIdentification/ParticipantObjectIDTypeCode&#009;@csd-code&#009;M&#009;ITI-55&#009;</xsl:text>                                 <xsl:value-of select="AuditMessage/ParticipantObjectIdentification/ParticipantObjectIDTypeCode/@csd-code" /><xsl:text>&#010;</xsl:text>
      <xsl:text>ParticipantObjectIdentification/ParticipantObjectIDTypeCode&#009;@codeSystemName&#009;M&#009;IHE Transactions&#009;</xsl:text>                 <xsl:value-of select="AuditMessage/ParticipantObjectIdentification/ParticipantObjectIDTypeCode/@codeSystemName" /><xsl:text>&#010;</xsl:text>
      <xsl:text>ParticipantObjectIdentification/ParticipantObjectIDTypeCode&#009;@originalText&#009;M&#009;Cross Gateway Patient Discovery&#009;</xsl:text>    <xsl:value-of select="AuditMessage/ParticipantObjectIdentification/ParticipantObjectIDTypeCode/@originalText" /><xsl:text>&#010;</xsl:text>
      
      <xsl:text>ParticipantObjectIdentification/ParticipantObjectSensitivity&#009;XXX&#009;U&#009;xxx&#009;</xsl:text>                                         <xsl:text>&#010;</xsl:text>
      <xsl:text>ParticipantObjectIdentification/ParticipantObjectID&#009;XXX&#009;U&#009;xxx&#009;</xsl:text>                                                  <xsl:text>&#010;</xsl:text>
      <xsl:text>ParticipantObjectIdentification/ParticipantObjectName&#009;XXX&#009;U&#009;xxx&#009;</xsl:text>                                                <xsl:text>&#010;</xsl:text>

      <xsl:text>ParticipantObjectIdentification/ParticipantObjectQuery&#009;&#009;M&#009;base64 --decode&#009;</xsl:text>               <xsl:value-of select="AuditMessage/ParticipantObjectIdentification/ParticipantObjectQuery" /><xsl:text>&#010;</xsl:text>

      <xsl:text>ParticipantObjectIdentification/ParticipantObjectDetail&#009;@type&#009;M&#009;ihe:homeCommunityID&#009;</xsl:text>     <xsl:value-of select="AuditMessage/ParticipantObjectIdentification/ParticipantObjectDetail/@type" /><xsl:text>&#010;</xsl:text>
      <xsl:text>ParticipantObjectIdentification/ParticipantObjectDetail&#009;@value&#009;U&#009;base64 --decode&#009;</xsl:text>        <xsl:value-of select="AuditMessage/ParticipantObjectIdentification/ParticipantObjectDetail/@value" /><xsl:text>&#010;</xsl:text>
      


    </xsl:template>

</xsl:stylesheet>
