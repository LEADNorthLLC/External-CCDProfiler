Class LEADNorth.CDAProfiler.XSLT.CDAParser Extends %Persistent
{

XData MetadataXSLT
{
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:hl7="urn:hl7-org:v3" exclude-result-prefixes="hl7">
    <xsl:output method="xml" indent="yes"/>

  
    <xsl:template match="/hl7:ClinicalDocument">
        <Metadata>
            <PatientID>
                <xsl:value-of select="hl7:recordTarget/hl7:patientRole/hl7:id/@extension"/>
            </PatientID>
            <DocumentDate>
                <xsl:value-of select="hl7:effectiveTime/@value"/>
            </DocumentDate>
            <DocumentTitle>
            	<xsl:value-of select="@title"/>
            </DocumentTitle>
            <DocumentTypeCode>
            	<xsl:value-of select="hl7:code/@code"/>
            </DocumentTypeCode>
            <DocumentTypeCodeSystem>
            	<xsl:value-of select="hl7:code/@codeSystem"/>
            </DocumentTypeCodeSystem>
            <DocumentTypeCodeDisplay>
            	<xsl:value-of select="hl7:code/@displayName"/>
            </DocumentTypeCodeDisplay>
            <DocumentIDExtension>
            	<xsl:value-of select="hl7:id/@extension"/>
            </DocumentIDExtension>
            <DocumentIDRoot>
            	<xsl:value-of select="hl7:id/@root"/>
            </DocumentIDRoot>
            <DocumentConfidentialityCode>
            	<xsl:value-of select="hl7:confidentialityCode/@code"/>
            </DocumentConfidentialityCode>
            <DocumentConfidentialityCodeSystem>
            	<xsl:value-of select="hl7:confidentialityCode/@codeSystem"/>
            </DocumentConfidentialityCodeSystem>
            <DocumentConfidentialityCodeDisplay>
            	<xsl:value-of select="hl7:confidentialityCode/@displayName"/>
            </DocumentConfidentialityCodeDisplay>
            <AllSections>
			    <xsl:for-each select="hl7:component/hl7:structuredBody/hl7:component/hl7:section">
			      <xsl:if test="position() &gt; 1">,</xsl:if>
			      <xsl:value-of select="hl7:code/@displayName"/>
			    </xsl:for-each>
			</AllSections>

        </Metadata>
    </xsl:template>
    
</xsl:stylesheet>
}

XData AllergyXSLT [ XMLNamespace = "http://www.w3.org/1999/XSL/Transform" ]
{
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:hl7="urn:hl7-org:v3" exclude-result-prefixes="hl7">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/hl7:ClinicalDocument">
    <AllergySection>
        <xsl:for-each select="hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code/@code='48765-2']/hl7:entry/hl7:act">
            <Allergy>
                <AllergyCode>
                    <xsl:value-of select="hl7:value/@code | hl7:entryRelationship/hl7:observation/hl7:participant[@typeCode='CSM']/hl7:participantRole/hl7:playingEntity/hl7:code/@code"/>
                </AllergyCode>
                <AllergyCodeSystem>
                    <xsl:value-of select="hl7:value/@codeSystem | hl7:entryRelationship/hl7:observation/hl7:participant/hl7:participantRole/hl7:playingEntity/hl7:code/@codeSystem"/>
                </AllergyCodeSystem>
                <AllergyCodeSystemName>
                    <xsl:value-of select="hl7:value/@codeSystemName | hl7:entryRelationship/hl7:observation/hl7:participant/hl7:participantRole/hl7:playingEntity/hl7:code/@codeSystemName"/>
                </AllergyCodeSystemName>
                <AllergyDisplayName>
                    <xsl:value-of select="hl7:value/@displayName | hl7:entryRelationship/hl7:observation/hl7:participant/hl7:participantRole/hl7:playingEntity/hl7:code/@displayName"/>
                </AllergyDisplayName>
                <CategoryCode>
                    <xsl:value-of select="hl7:entryRelationship/hl7:observation/hl7:value/@code"/>
                </CategoryCode>
                <CategoryCodeSystem>
                    <xsl:value-of select="hl7:entryRelationship/hl7:observation/hl7:value/@codeSystem"/>
                </CategoryCodeSystem>
                <CategoryCodeSystemName>
                    <xsl:value-of select="hl7:entryRelationship/hl7:observation/hl7:value/@codeSystemName"/>
                </CategoryCodeSystemName>
                <CategoryDisplayName>
                    <xsl:value-of select="hl7:entryRelationship/hl7:observation/hl7:value/@displayName"/>
                </CategoryDisplayName>
                <ReactionCode>
                    <xsl:value-of select="hl7:entryRelationship/hl7:observation/hl7:entryRelationship/hl7:observation[hl7:code/@code='ASSERTION']/hl7:code/@code"/>
                </ReactionCode>
                <ReactionCodeSystem>
                    <xsl:value-of select="hl7:entryRelationship/hl7:observation/hl7:entryRelationship/hl7:observation[hl7:code/@code='ASSERTION']/hl7:code/@codeSystem"/>
                </ReactionCodeSystem>
                <ReactionCodeSystemName>
                    <xsl:value-of select="hl7:entryRelationship/hl7:observation/hl7:entryRelationship/hl7:observation[hl7:code/@code='ASSERTION']/hl7:code/@codeSystemName"/>
                </ReactionCodeSystemName>
                <xsl:variable name="reactionDis" select="substring-after(hl7:text/hl7:reference/@value, '#')" />
                <xsl:variable name="reactionDis2" select="substring-after(hl7:entryRelationship/hl7:observation/hl7:entryRelationship/hl7:observation/hl7:text/hl7:reference/@value, '#')" />
                <ReactionDisplayName>
                    <xsl:value-of select="hl7:entryRelationship/hl7:observation/hl7:entryRelationship/hl7:observation[hl7:code/@code='ASSERTION']/hl7:code/@displayName | ../../hl7:text/hl7:table/hl7:tbody/hl7:tr[@ID=$reactionDis]/hl7:td/hl7:content[@ID=$reactionDis2]"/>
                </ReactionDisplayName>
                <SeverityCode>
                    <xsl:value-of select="hl7:entryRelationship/hl7:observation/hl7:entryRelationship/hl7:observation[hl7:code/@code='SEV']/hl7:value/@code"/>
                </SeverityCode>
                <SeverityCodeSystem>
                    <xsl:value-of select="hl7:entryRelationship/hl7:observation/hl7:entryRelationship/hl7:observation[hl7:code/@code='SEV']/hl7:value/@codeSystem"/>
                </SeverityCodeSystem>
                <SeverityCodeName>
                    <xsl:value-of select="hl7:entryRelationship/hl7:observation/hl7:entryRelationship/hl7:observation[hl7:code/@code='SEV']/hl7:value/@codeSystemName"/>
                </SeverityCodeName>
                <xsl:variable name="sevDis" select="substring-after(hl7:text/hl7:reference/@value, '#')" />
                <xsl:variable name="sevDis2" select="substring-after(hl7:entryRelationship/hl7:observation/hl7:entryRelationship/hl7:observation[hl7:code/@code='SEV']/hl7:text/hl7:reference/@value, '#')" />
                <SeverityDisplayName>
                    <xsl:value-of select="hl7:entryRelationship/hl7:observation/hl7:entryRelationship/hl7:observation[hl7:code/@code='SEV']/hl7:value/@displayName | ../../hl7:text/hl7:table/hl7:tbody/hl7:tr[@ID=$sevDis]/hl7:td/hl7:content[@ID=$sevDis2]"/>
                </SeverityDisplayName>
                <Provider>
                    <xsl:value-of select="hl7:author/hl7:assignedAuthor/hl7:id/@extension"/>
                </Provider>
                <ActIdExtension>
                    <xsl:value-of select="hl7:id/@extension"/>
                </ActIdExtension>
                <ActIdRoot>
                    <xsl:value-of select="hl7:id/@root"/>
                </ActIdRoot>
                <ActClassCode>
                    <xsl:value-of select="@classCode"/>
                </ActClassCode>
                <ActMoodCode>
                    <xsl:value-of select="@moodCode"/>
                </ActMoodCode>
                <ActStatusCode>
                    <xsl:value-of select="hl7:statusCode/@code"/>
                </ActStatusCode>
                <EffectiveTimeLow>
                    <xsl:value-of select="hl7:effectiveTime/hl7:low/@value"/>
                </EffectiveTimeLow>
                <EffectiveTimeHigh>
                    <xsl:value-of select="hl7:effectiveTime/hl7:high/@value"/>
                </EffectiveTimeHigh>
                <ObservationCode>
                    <xsl:value-of select="hl7:entryRelationship/hl7:observation/hl7:code/@code"/>
                </ObservationCode>
                <ObservationCodeSystem>
                    <xsl:value-of select="hl7:entryRelationship/hl7:observation/hl7:code/@codeSystem"/>
                </ObservationCodeSystem>
                <ObservationDisplayName>
                    <xsl:value-of select="hl7:entryRelationship/hl7:observation/hl7:code/@displayName"/>
                </ObservationDisplayName>
                <ObservationStatusCode>
                    <xsl:value-of select="hl7:entryRelationship/hl7:observation/hl7:statusCode/@code"/>
                </ObservationStatusCode>
                <ObservationEffectiveTimeLow>
                    <xsl:value-of select="hl7:entryRelationship/hl7:observation/hl7:effectiveTime/hl7:low/@value"/>
                </ObservationEffectiveTimeLow>
                <ObservationEffectiveTimeHigh>
                    <xsl:value-of select="hl7:entryRelationship/hl7:observation/hl7:effectiveTime/hl7:high/@value"/>
                </ObservationEffectiveTimeHigh>
                <StatusCode>
                    <xsl:value-of select="hl7:statusCode/@code"/>
                </StatusCode>
                <StatusCodeSystem>
                    <xsl:value-of select="hl7:statusCode/@codeSystem"/>
                </StatusCodeSystem>
                <StatusCodeSystemName>
                    <xsl:value-of select="hl7:statusCode/@codeSystemName"/>
                </StatusCodeSystemName>
                <StatusDisplayName>
                    <xsl:value-of select="hl7:statusCode/@displayName"/>
                </StatusDisplayName>
                <ReferenceAllergyId>
                    <xsl:value-of select="hl7:text/hl7:reference/@value"/>
                </ReferenceAllergyId>
                <ReferenceReactionId>
                    <xsl:value-of select="hl7:entryRelationship/hl7:observation/hl7:text/hl7:reference/@value"/>
                </ReferenceReactionId>
                <ReferenceSeverityId>
                    <xsl:value-of select="hl7:entryRelationship/hl7:observation/hl7:entryRelationship/hl7:observation/hl7:text/hl7:reference/@value"/>
                </ReferenceSeverityId>
                <ReferenceStatusId>
                    <xsl:value-of select="hl7:entryRelationship/hl7:observation/hl7:entryRelationship/hl7:observation/hl7:statusCode/@code"/>
                </ReferenceStatusId>
                <RepresentedOrganization>
                    <xsl:value-of select="hl7:author/hl7:assignedAuthor/hl7:representedOrganization/hl7:name | hl7:entryRelationship/hl7:observation/hl7:author/hl7:assignedAuthor/hl7:representedOrganization/hl7:name"/>
                </RepresentedOrganization>
            </Allergy>
        </xsl:for-each>
    </AllergySection>
</xsl:template>
</xsl:stylesheet>
}

XData MedicationsXSLT
{
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:hl7="urn:hl7-org:v3" exclude-result-prefixes="hl7">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/hl7:ClinicalDocument">
        <Medications>
            <xsl:for-each select="hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code/@code='10160-0']/hl7:entry/hl7:substanceAdministration">
                <Medication>
                    <DrugName>
                        <xsl:value-of select="hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial/hl7:code/@displayName"/>
                    </DrugName>
                    <GenericName>
                        <xsl:value-of select="hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial/hl7:code/hl7:translation/@displayName"/>
                    </GenericName>
                    <Dose>
                        <xsl:value-of select="hl7:doseQuantity/@value"/>
                    </Dose>
                    <DoseUnits>
                        <xsl:value-of select="hl7:doseQuantity/@unit"/>
                    </DoseUnits>
                    <Instructions>
                        <xsl:value-of select="hl7:entryRelationship/hl7:act/hl7:text/reference/@value"/>
                    </Instructions>
                    <StartDate>
                        <xsl:value-of select="hl7:effectiveTime/hl7:low/@value"/>
                    </StartDate>
                    <EndDate>
                        <xsl:value-of select="hl7:effectiveTime/hl7:high/@value"/>
                    </EndDate>
                    <Frequency>
                        <xsl:value-of select="hl7:effectiveTime/hl7:period/@value"/>
                    </Frequency>
                    <Route>
                        <xsl:value-of select="hl7:routeCode/@displayName"/>
                    </Route>
                    <Site>
                        <xsl:value-of select="hl7:approachSiteCode/@displayName"/>
                    </Site>
                    <AdministrationUnit>
                        <xsl:value-of select="hl7:administrationUnitCode/@displayName"/>
                    </AdministrationUnit>
                    <Provider>
                        <xsl:value-of select="hl7:author/hl7:assignedAuthor/hl7:assignedPerson/hl7:name"/>
                    </Provider>
                    <NDC>
                        <xsl:value-of select="hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial/hl7:code/@code"/>
                    </NDC>
                    <RxNormCode>
                        <xsl:value-of select="hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial/hl7:code/@code"/>
                    </RxNormCode>
                    <GPI>
                        <xsl:value-of select="hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial/hl7:code/hl7:translation[@codeSystem='2.16.840.1.113883.6.68']/@code"/>
                    </GPI>
                    <Status>
                        <xsl:value-of select="hl7:statusCode/@code"/>
                    </Status>
                </Medication>
            </xsl:for-each>
        </Medications>
    </xsl:template>
</xsl:stylesheet>
}

XData ProblemsXSLT
{
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:hl7="urn:hl7-org:v3" exclude-result-prefixes="hl7">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/hl7:ClinicalDocument">
    <Problems>
        <xsl:for-each select="hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code/@code='11450-4']/hl7:entry/hl7:act">
            <Problem>
                <ProblemID>
                    <xsl:value-of select="hl7:id/@root"/>
                </ProblemID>
                <ProblemClassCode>
                    <xsl:value-of select="@classCode"/>
                </ProblemClassCode>
                <MoodCode>
                    <xsl:value-of select="@moodCode"/>
                </MoodCode>
                <StatusCode>
                    <xsl:value-of select="hl7:statusCode/@code"/>
                </StatusCode>
                <EffectiveTimeLow>
                    <xsl:value-of select="hl7:effectiveTime/hl7:low/@value"/>
                </EffectiveTimeLow>
                <EffectiveTimeHigh>
                    <xsl:value-of select="hl7:effectiveTime/hl7:high/@value"/>
                </EffectiveTimeHigh>
                <ProblemTypeCode>
                    <xsl:value-of select="hl7:entryRelationship/hl7:observation/hl7:code/@code"/>
                </ProblemTypeCode>
                <ProblemTypeName>
                    <xsl:value-of select="hl7:entryRelationship/hl7:observation/hl7:code/@displayName"/>
                </ProblemTypeName>
                <ValueCode>
                    <xsl:value-of select="hl7:entryRelationship/hl7:observation/hl7:value/@code"/>
                </ValueCode>
                <ValueDisplayName>
                    <xsl:value-of select="hl7:entryRelationship/hl7:observation/hl7:value/@displayName"/>
                </ValueDisplayName>
                <CodeSystem>
                    <xsl:value-of select="hl7:entryRelationship/hl7:observation/hl7:code/@codeSystem"/>
                </CodeSystem>
                <CodeSystemName>
                    <xsl:value-of select="hl7:entryRelationship/hl7:observation/hl7:code/@codeSystemName"/>
                </CodeSystemName>
                <AuthorTime>
                    <xsl:value-of select="hl7:entryRelationship/hl7:observation/hl7:author/hl7:time/@value"/>
                </AuthorTime>
                <Author>
                    <xsl:value-of select="hl7:entryRelationship/hl7:observation/hl7:author/hl7:assignedAuthor/hl7:representedOrganization/hl7:name"/>
                </Author>
            </Problem>
        </xsl:for-each>
    </Problems>
    </xsl:template>
</xsl:stylesheet>
}

XData DiagnosisXSLT
{
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:hl7="urn:hl7-org:v3" exclude-result-prefixes="hl7">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/hl7:ClinicalDocument">
    <Diagnoses>
        <xsl:for-each select="hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code/@code='46240-8']/hl7:entry/hl7:encounter/hl7:entryRelationship/hl7:act[hl7:code/@code='29308-4']">
            <Diagnosis>
            <DiagnosisID>
            <xsl:value-of select="hl7:entryRelationship/hl7:observation/hl7:id/@root"/>
            </DiagnosisID>
            <DiagnosisTypeCode>
            <xsl:value-of select="hl7:code/@code"/>
            </DiagnosisTypeCode>
            <DiagnosisTypeCodeSystem>
            <xsl:value-of select="hl7:code/@codeSystem"/>
            </DiagnosisTypeCodeSystem>
            <DiagnosisTypeCodeSystemName>
            <xsl:value-of select="hl7:code/@codeSystemName"/>
            </DiagnosisTypeCodeSystemName>
            <DiagnosisTypeDisplayName>
            <xsl:value-of select="hl7:code/@displayName"/>
            </DiagnosisTypeDisplayName>
            <DiagnosisEffectiveTimeLow>
            <xsl:value-of select="hl7:entryRelationship/hl7:observation/hl7:effectiveTime/hl7:low/@value"/>
            </DiagnosisEffectiveTimeLow>
            <DiagnosisEffectiveTimeHigh>
            <xsl:value-of select="hl7:entryRelationship/hl7:observation/hl7:effectiveTime/hl7:high/@value"/>
            </DiagnosisEffectiveTimeHigh>
            <DiagnosisCode>
            <xsl:value-of select="hl7:entryRelationship/hl7:observation/hl7:value/@code"/>
            </DiagnosisCode>
            <DiagnosisCodeSystem>
            <xsl:value-of select="hl7:entryRelationship/hl7:observation/hl7:value/@codeSystem"/>
            </DiagnosisCodeSystem>
            <DiagnosisCodeSystemName>
            <xsl:value-of select="hl7:entryRelationship/hl7:observation/hl7:value/@codeSystemName"/>
            </DiagnosisCodeSystemName>
            <DiagnosisCodeDisplayName>
            <xsl:value-of select="hl7:entryRelationship/hl7:observation/hl7:value/@displayName"/>
            </DiagnosisCodeDisplayName>
            <DiagnosisStatusCode>
            <xsl:value-of select="hl7:entryRelationship/hl7:observation/hl7:statusCode/@code"/>
            </DiagnosisStatusCode>
            <DiagnosisEncounterNumber>
            <xsl:value-of select="../../hl7:id/@extension | ../../hl7:id/@root"/>
            </DiagnosisEncounterNumber>
            </Diagnosis>
        </xsl:for-each>
    </Diagnoses>
    </xsl:template>
</xsl:stylesheet>
}

XData ProceduresXSLT
{
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:hl7="urn:hl7-org:v3" exclude-result-prefixes="hl7">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/hl7:ClinicalDocument">
    <Procedures>
        <xsl:for-each select="hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code/@code='47519-4']/hl7:entry/hl7:procedure">
            <Procedure>
                <ProcedureCode>
                    <xsl:value-of select="hl7:code/@code"/>
                </ProcedureCode>
                <ProcedureClassCode>
                    <xsl:value-of select="@classCode"/>
                </ProcedureClassCode>
                <MoodCode>
                    <xsl:value-of select="@moodCode"/>
                </MoodCode>
                <Status>
                    <xsl:value-of select="hl7:statusCode/@code"/>
                </Status>
                <CodeDisplayName>
                    <xsl:value-of select="hl7:code/@displayName"/>
                </CodeDisplayName>
                <CodeSystem>
                    <xsl:value-of select="hl7:code/@codeSystem"/>
                </CodeSystem>
                <CodeSystemName>
                    <xsl:value-of select="hl7:code/@codeSystemName"/>
                </CodeSystemName>
                <EffectiveTimeLow>
                    <xsl:value-of select="hl7:effectiveTime/hl7:low/@value | hl7:effectiveTime/@value"/>
                </EffectiveTimeLow>
                <EffectiveTimeHigh>
                    <xsl:value-of select="hl7:effectiveTime/hl7:high/@value | hl7:effectiveTime/@value"/>
                </EffectiveTimeHigh>
                <PerformerID>
                    <xsl:value-of select="hl7:performer/hl7:assignedEntity/hl7:id/@extension | hl7:author/hl7:assignedAuthor/hl7:assignedPerson/hl7:id/@extension"/>
                </PerformerID>
                <PerformerName>
                    <xsl:value-of select="hl7:performer/hl7:assignedEntity/hl7:assignedPerson/hl7:name/hl7:family | hl7:author/hl7:assignedAuthor/hl7:assignedPerson/hl7:name"/>
                </PerformerName>
                <PerformerOrganization>
                    <xsl:value-of select="hl7:performer/hl7:assignedEntity/hl7:representedOrganization/hl7:name | hl7:author/hl7:assignedAuthor/hl7:representedOrganization/hl7:name"/>
                </PerformerOrganization>
                <PerformerAddress>
                    <xsl:value-of select="hl7:performer/hl7:assignedEntity/hl7:addr | hl7:author/hl7:assignedAuthor/hl7:representedOrganization/hl7:addr | hl7:author/hl7:assignedAuthor/hl7:addr"/>
                </PerformerAddress>
                <AuthorTime>
                    <xsl:value-of select="hl7:author/hl7:time/@value"/>
                </AuthorTime>
            </Procedure>
        </xsl:for-each>
    </Procedures>
    </xsl:template>
</xsl:stylesheet>
}

XData ResultsXSLT
{
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:hl7="urn:hl7-org:v3" exclude-result-prefixes="hl7">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/hl7:ClinicalDocument">
    <Results>
        <xsl:for-each select="hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code/@code='30954-2']/hl7:entry/hl7:organizer/hl7:component/hl7:observation">
            <Result>
                <ResultID>
                    <xsl:value-of select="../../hl7:id/@root"/>
                </ResultID>
                <OrganizerID>
                    <xsl:value-of select="hl7:author/hl7:assignedAuthor/hl7:representedOrganization/hl7:id/@root"/>
                </OrganizerID>
                <OrganizerName>
                    <xsl:value-of select="hl7:author/hl7:assignedAuthor/hl7:representedOrganization/hl7:name"/>
                </OrganizerName>
                <OrganizerClassCode>
                    <xsl:value-of select="hl7:author/hl7:assignedAuthor/hl7:representedOrganization/@classCode"/>
                </OrganizerClassCode>
                <MoodCode>
                    <xsl:value-of select="@moodCode"/>
                </MoodCode>
                <StatusCode>
                    <xsl:value-of select="hl7:statusCode/@code"/>
                </StatusCode>
                <ObservationCode>
                    <xsl:value-of select="hl7:code/@code"/>
                </ObservationCode>
                <ObservationCodeDisplayName>
                    <xsl:value-of select="hl7:code/@displayName"/>
                </ObservationCodeDisplayName>
                <ObservationCodeSystem>
                    <xsl:value-of select="hl7:code/@codeSystem"/>
                </ObservationCodeSystem>
                <ObservationCodeSystemName>
                    <xsl:value-of select="hl7:code/@codeSystemName"/>
                </ObservationCodeSystemName>
                <EffectiveTimeLow>
                    <xsl:value-of select="../../hl7:effectiveTime/hl7:low/@value"/>
                </EffectiveTimeLow>
                <EffectiveTimeHigh>
                    <xsl:value-of select="../../hl7:effectiveTime/hl7:high/@value"/>
                </EffectiveTimeHigh>
                <TestValue>
                    <xsl:value-of select="hl7:value/@value"/>
                </TestValue>
                <Units>
                    <xsl:value-of select="hl7:value/@unit"/>
                </Units>
                <ReferenceRange>
                    <xsl:value-of select="hl7:referenceRange/hl7:observationRange/hl7:text"/>
                </ReferenceRange>
                <AuthorTime>
                    <xsl:value-of select="hl7:author/hl7:time/@value"/>
                </AuthorTime>
            </Result>
        </xsl:for-each>
    </Results>
    </xsl:template>
</xsl:stylesheet>
}

XData VitalSignsXSLT
{
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:hl7="urn:hl7-org:v3" exclude-result-prefixes="hl7">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/hl7:ClinicalDocument">
        <VitalSigns>
            <xsl:for-each select="hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code/@code='8716-3']/hl7:entry/hl7:organizer/hl7:component/hl7:observation">
                <VitalSign>
                    <Value>
                        <xsl:value-of select="hl7:value/@value"/>
                    </Value>
                    <Unit>
                        <xsl:value-of select="hl7:value/@unit"/>
                    </Unit>
                    <xDate>
                    <xsl:value-of select="hl7:effectiveTime/@value"/>
                    </xDate>
                    <Description>
                        <xsl:value-of select="hl7:code/hl7:translation/@displayName | hl7:code/@displayName | hl7:code/hl7:originalText"/>
                    </Description>
                    <ObservationIDRoot>
                        <xsl:value-of select="hl7:id/@root"/>
                    </ObservationIDRoot>
                    <ObservationIDExtension>
                        <xsl:value-of select="hl7:id/@extension"/>
                    </ObservationIDExtension>
                    <ObservationCode>
                        <xsl:value-of select="hl7:code/@code"/>
                    </ObservationCode>
                    <ObservationCodeSystem>
                        <xsl:value-of select="hl7:code/@codeSystem"/>
                    </ObservationCodeSystem>
                    <ObservationDisplayName>
                        <xsl:value-of select="hl7:code/@displayName | hl7:code/hl7:originalText"/>
                    </ObservationDisplayName>
                    <ObservationStatusCode>
                        <xsl:value-of select="hl7:statusCode/@code | hl7:statusCode/@displayName"/>
                    </ObservationStatusCode>
                    <ObservationEffectiveTimeLow>
                        <xsl:value-of select="hl7:effectiveTime/hl7:low/@value | hl7:effectiveTime/@value"/>
                    </ObservationEffectiveTimeLow>
                    <ObservationEffectiveTimeHigh>
                        <xsl:value-of select="hl7:effectiveTime/hl7:high/@value | hl7:effectiveTime/@value"/>
                    </ObservationEffectiveTimeHigh>
                    <OrganizerClassCode>
                        <xsl:value-of select="../../@classCode"/>
                    </OrganizerClassCode>
                    <OrganizerMoodCode>
                        <xsl:value-of select="../../@moodCode"/>
                    </OrganizerMoodCode>
                    <OrganizerCode>
                        <xsl:value-of select="../../hl7:code/@code"/>
                    </OrganizerCode>
                    <OrganizerCodeSystem>
                        <xsl:value-of select="../../hl7:code/@codeSystem"/>
                    </OrganizerCodeSystem>
                    <OrganizerDisplayName>
                        <xsl:value-of select="../../hl7:code/@displayName"/>
                    </OrganizerDisplayName>
                    <OrganizerStatusCode>
                        <xsl:value-of select="../../hl7:statusCode/@code"/>
                    </OrganizerStatusCode>
                    <OrganizerEffectiveTimeLow>
                        <xsl:value-of select="../../hl7:effectiveTime/hl7:low/@value"/>
                    </OrganizerEffectiveTimeLow>
                    <OrganizerEffectiveTimeHigh>
                        <xsl:value-of select="../../hl7:effectiveTime/hl7:high/@value"/>
                    </OrganizerEffectiveTimeHigh>
                    <AuthorTime>
                        <xsl:value-of select="hl7:author/hl7:time/@value"/>
                    </AuthorTime>
                </VitalSign>
            </xsl:for-each>
        </VitalSigns>
    </xsl:template>
</xsl:stylesheet>
}

XData ImmunizationsXSLT
{
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3" exclude-result-prefixes="hl7">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/hl7:ClinicalDocument">
        <Immunizations>
            <xsl:for-each select="hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code/@code='11369-6']/hl7:entry/hl7:substanceAdministration">
                <Immunization>
                    <ImmunizationID>
                        <xsl:value-of select="hl7:id/@extension"/>
                    </ImmunizationID>
                    <Route>
                        <xsl:value-of select="hl7:routeCode/@displayName | hl7:routeCode/hl7:originalText"/>
                    </Route>
                    <Dose>
                        <xsl:value-of select="hl7:doseQuantity/@value"/>
                    </Dose>
                    <DoseUnit>
                        <xsl:value-of select="hl7:doseQuantity/@unit"/>
                    </DoseUnit>
                    <Vaccine>
                        <xsl:value-of select="hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial/hl7:code/@displayName"/>
                    </Vaccine>
                    <VaccineCode>
                        <xsl:value-of select="hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial/hl7:code/@code"/>
                    </VaccineCode>
                    <VaccineCodeSystem>
                        <xsl:value-of select="hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial/hl7:code/@codeSystem"/>
                    </VaccineCodeSystem>
                    <VaccineCodeSystemName>
                        <xsl:value-of select="hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial/hl7:code/@codeSystemName"/>
                    </VaccineCodeSystemName>
                    <LotNumber>
                        <xsl:value-of select="hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial/hl7:lotNumberText"/>
                    </LotNumber>
                    <StartDate>
                        <xsl:value-of select="hl7:effectiveTime/hl7:low/@value | hl7:effectiveTime/@value"/>
                    </StartDate>
                    <EndDate>
                        <xsl:value-of select="hl7:effectiveTime/hl7:high/@value"/>
                    </EndDate>
                    <PerformerID>
                        <xsl:value-of select="hl7:performer/hl7:assignedEntity/hl7:id/@extension | hl7:author/hl7:assignedAuthor/hl7:representedOrganization/hl7:id/@extension | hl7:author/hl7:assignedAuthor/hl7:representedOrganization/hl7:name"/>
                    </PerformerID>
                    <PerformerAddress>
                        <xsl:value-of select="hl7:performer/hl7:assignedEntity/hl7:addr/hl7:streetAddressLine | hl7:author/hl7:assignedAuthor/hl7:representedOrganization/hl7:addr/hl7:streetAddressLine"/>
                    </PerformerAddress>
                    <PerformerCity>
                        <xsl:value-of select="hl7:performer/hl7:assignedEntity/hl7:addr/hl7:city | hl7:author/hl7:assignedAuthor/hl7:representedOrganization/hl7:addr/hl7:city"/>
                    </PerformerCity>
                    <PerformerState>
                        <xsl:value-of select="hl7:performer/hl7:assignedEntity/hl7:addr/hl7:state | hl7:author/hl7:assignedAuthor/hl7:representedOrganization/hl7:addr/hl7:state"/>
                    </PerformerState>
                    <PerformerPostalCode>
                        <xsl:value-of select="hl7:performer/hl7:assignedEntity/hl7:addr/hl7:postalCode | hl7:author/hl7:assignedAuthor/hl7:representedOrganization/hl7:addr/hl7:postalCode"/>
                    </PerformerPostalCode>
                    <StatusCode>
                        <xsl:value-of select="hl7:statusCode/@code"/>
                    </StatusCode>
                    <NullFlavor>
                        <xsl:value-of select="@nullFlavor"/>
                    </NullFlavor>
                </Immunization>
            </xsl:for-each>
        </Immunizations>
    </xsl:template>
</xsl:stylesheet>
}

XData PlanOfCareXSLT
{
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:hl7="urn:hl7-org:v3" exclude-result-prefixes="hl7">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/hl7:ClinicalDocument">
    <PlanOfCare>
        <xsl:for-each select="hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code/@code='18776-5']/hl7:entry/hl7:encounter">
            <PlanEntry>
                <EncounterID>
                    <xsl:value-of select="hl7:id/@root"/>
                </EncounterID>
                <EncounterExtension>
                    <xsl:value-of select="hl7:id/@extension"/>
                </EncounterExtension>
                <DisplayName>
                    <xsl:value-of select="hl7:code/@displayName"/>
                </DisplayName>
                <StatusCode>
                    <xsl:value-of select="hl7:statusCode/@code"/>
                </StatusCode>
                <EffectiveTimeLow>
                    <xsl:value-of select="hl7:effectiveTime/hl7:low/@value"/>
                </EffectiveTimeLow>
                <EffectiveTimeHigh>
                    <xsl:value-of select="hl7:effectiveTime/hl7:high/@value"/>
                </EffectiveTimeHigh>
                <Performer>
                    <PerformerID>
                        <xsl:value-of select="hl7:performer/hl7:assignedEntity/hl7:id/@extension"/>
                    </PerformerID>
                    <PerformerOrganization>
                        <xsl:value-of select="hl7:performer/hl7:assignedEntity/hl7:representedOrganization/hl7:name"/>
                    </PerformerOrganization>
                    <PerformerAddress>
                        <xsl:value-of select="hl7:performer/hl7:assignedEntity/hl7:addr/hl7:streetAddressLine"/>
                    </PerformerAddress>
                    <PerformerCity>
                        <xsl:value-of select="hl7:performer/hl7:assignedEntity/hl7:addr/hl7:city"/>
                    </PerformerCity>
                    <PerformerState>
                        <xsl:value-of select="hl7:performer/hl7:assignedEntity/hl7:addr/hl7:state"/>
                    </PerformerState>
                    <PerformerPostalCode>
                        <xsl:value-of select="hl7:performer/hl7:assignedEntity/hl7:addr/hl7:postalCode"/>
                    </PerformerPostalCode>
                </Performer>
                <AuthorTime>
                    <xsl:value-of select="hl7:author/hl7:time/@value"/>
                </AuthorTime>
            </PlanEntry>
        </xsl:for-each>
    </PlanOfCare>
    </xsl:template>
</xsl:stylesheet>
}

XData SocialHistoryXSLT
{
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:hl7="urn:hl7-org:v3" exclude-result-prefixes="hl7">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/hl7:ClinicalDocument">
        <SocialHistoryItems>
            <xsl:for-each select="hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code/@code='29762-2']/hl7:entry/hl7:observation">
                <SocialHistoryItem>
                    <SocialHistoryID>
                        <xsl:value-of select="hl7:id/@extension"/>
                    </SocialHistoryID>
                    <ConceptDescription>
                        <xsl:value-of select="hl7:code/hl7:originalText/hl7:reference/@value"/>
                    </ConceptDescription>
                    <ObservationCode>
                        <xsl:value-of select="hl7:code/@code"/>
                    </ObservationCode>
                    <ObservationCodeSystem>
                        <xsl:value-of select="hl7:code/@codeSystem"/>
                    </ObservationCodeSystem>
                    <ObservationCodeSystemName>
                        <xsl:value-of select="hl7:code/@codeSystemName"/>
                    </ObservationCodeSystemName>
                    <ObservationDisplayName>
                        <xsl:value-of select="hl7:code/@displayName"/>
                    </ObservationDisplayName>
                    <ValueCode>
                        <xsl:value-of select="hl7:value/@code"/>
                    </ValueCode>
                    <ValueCodeSystem>
                        <xsl:value-of select="hl7:value/@codeSystem"/>
                    </ValueCodeSystem>
                    <ValueCodeSystemName>
                        <xsl:value-of select="hl7:value/@codeSystemName"/>
                    </ValueCodeSystemName>
                    <xsl:variable name="valueDisplay" select="substring-after(hl7:text/hl7:reference/@value, '#')" />
                    <ValueDisplayName>
                        <xsl:value-of select="hl7:value/@displayName | ../../hl7:text/hl7:table/hl7:tbody/hl7:tr/hl7:td/hl7:content[@ID=$valueDisplay] | hl7:text"/>
                    </ValueDisplayName>
                    <Units>
                        <xsl:value-of select="hl7:value/@unit"/>
                    </Units>
                    <StatusCode>
                        <xsl:value-of select="hl7:statusCode/@code"/>
                    </StatusCode>
                    <ObservationIDExtension>
                        <xsl:value-of select="hl7:id/@extension"/>
                    </ObservationIDExtension>
                    <ObservationIDRoot>
                        <xsl:value-of select="hl7:id/@root"/>
                    </ObservationIDRoot>
                    <AuthorTime>
                        <xsl:value-of select="hl7:author/hl7:time/@value"/>
                    </AuthorTime>
                    <EffectiveTimeLow>
                        <xsl:value-of select="hl7:effectiveTime/hl7:low/@value"/>
                    </EffectiveTimeLow>
                    <EffectiveTimeHigh>
                        <xsl:value-of select="hl7:effectiveTime/hl7:high/@value"/>
                    </EffectiveTimeHigh>
                </SocialHistoryItem>
            </xsl:for-each>
        </SocialHistoryItems>
    </xsl:template>
</xsl:stylesheet>
}

XData FunctionalStatusXSLT
{
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:hl7="urn:hl7-org:v3" exclude-result-prefixes="hl7">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/hl7:ClinicalDocument">
        <FunctionalStatuses>
            <xsl:for-each select="hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code/@code='47420-5']/hl7:entry/hl7:observation">
                <FunctionalStatus>
                    <Status>
                        <xsl:value-of select="hl7:value/@displayName"/>
                    </Status>
                    <xDate>
                        <xsl:value-of select="hl7:effectiveTime/@value"/>
                    </xDate>
                    <Description>
                        <xsl:value-of select="hl7:code/@displayName"/>
                    </Description>
                    <StatusCode>
                        <xsl:value-of select="hl7:statusCode/@code"/>
                    </StatusCode>
                    <ObservationCode>
                        <xsl:value-of select="hl7:code/@code"/>
                    </ObservationCode>
                    <ObservationSystem>
                        <xsl:value-of select="hl7:code/@codeSystem"/>
                    </ObservationSystem>
                    <EffectiveTime>
                        <xsl:value-of select="hl7:effectiveTime/@value"/>
                    </EffectiveTime>
                </FunctionalStatus>
            </xsl:for-each>
        </FunctionalStatuses>
    </xsl:template>
</xsl:stylesheet>
}

XData FamilyHistoryXSLT
{
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3" exclude-result-prefixes="hl7">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/hl7:ClinicalDocument">
        <FamilyHistories>
            <xsl:for-each select="hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code/@code='10157-6']/hl7:entry/hl7:observation">
                <FamilyHistory>
                    <RelativePerson>
                        <xsl:value-of select="hl7:value/@displayName"/>
                    </RelativePerson>
                    <RelativeCode>
                        <xsl:value-of select="hl7:value/@code"/>
                    </RelativeCode>
                    <RelativeCodeSystem>
                        <xsl:value-of select="hl7:value/@codeSystem"/>
                    </RelativeCodeSystem>
                    <Condition>
                        <xsl:value-of select="hl7:code/@displayName"/>
                    </Condition>
                    <OnsetAge>
                        <xsl:value-of select="hl7:effectiveTime/@value"/>
                    </OnsetAge>
                    <StatusCode>
                        <xsl:value-of select="hl7:statusCode/@code"/>
                    </StatusCode>
                    <ObservationCode>
                        <xsl:value-of select="hl7:code/@code"/>
                    </ObservationCode>
                    <ObservationSystem>
                        <xsl:value-of select="hl7:code/@codeSystem"/>
                    </ObservationSystem>
                    <ObservationDisplayName>
                        <xsl:value-of select="hl7:code/@displayName"/>
                    </ObservationDisplayName>
                    <ObservationID>
                        <xsl:value-of select="hl7:id/@extension"/>
                    </ObservationID>
                    <ObservationIDOid>
                        <xsl:value-of select="hl7:id/@root"/>
                    </ObservationIDOid>
                </FamilyHistory>
            </xsl:for-each>
        </FamilyHistories>
    </xsl:template>
</xsl:stylesheet>
}

XData AdvanceDirectiveXSLT
{
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3" exclude-result-prefixes="hl7">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/hl7:ClinicalDocument">
        <AdvanceDirectives>
            <xsl:for-each select="hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code/@code='42348-3']/hl7:entry/hl7:act">
                <AdvanceDirective>
                    <DirectiveType>
                        <xsl:value-of select="hl7:code/@displayName"/>
                    </DirectiveType>
                    <DateSigned>
                        <xsl:value-of select="hl7:effectiveTime/@value"/>
                    </DateSigned>
                    <StatusCode>
                        <xsl:value-of select="hl7:statusCode/@code"/>
                    </StatusCode>
                    <DirectiveID>
                        <xsl:value-of select="hl7:id/@extension"/>
                    </DirectiveID>
                </AdvanceDirective>
            </xsl:for-each>
        </AdvanceDirectives>
    </xsl:template>
</xsl:stylesheet>
}

XData EncounterXSLT
{
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3" exclude-result-prefixes="hl7">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/hl7:ClinicalDocument">
        <Encounters>
            <xsl:for-each select="hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code/@code='46240-8']/hl7:entry/hl7:encounter">
                <Encounter>
                    <EncounterNumber>
                        <xsl:value-of select="hl7:id/@extension"/>
                    </EncounterNumber>
                    <EncounterTypeDisplayName>
                        <xsl:value-of select="hl7:code/@displayName | hl7:code/hl7:originalText"/>
                    </EncounterTypeDisplayName>
                    <EncounterTypeCode>
                        <xsl:value-of select="hl7:code/@code"/>
                    </EncounterTypeCode>
                    <EncounterTypeCodeSystem>
                        <xsl:value-of select="hl7:code/@codeSystem"/>
                    </EncounterTypeCodeSystem>
                    <EncounterTypeCodeSystemName>
                        <xsl:value-of select="hl7:code/@codeSystemName"/>
                    </EncounterTypeCodeSystemName>
                    <ReasonForVisit>
                        <xsl:value-of select="hl7:entryRelationship/hl7:observation/hl7:text"/>
                    </ReasonForVisit>
                    <VisitDescription>
                        <xsl:value-of select="hl7:text"/>
                    </VisitDescription>
                    <StatusCode>
                        <xsl:value-of select="hl7:statusCode/@code | hl7:statusCode/@displayName | hl7:statusCode/hl7:originalText"/>
                    </StatusCode>
                    <StartDateTime>
                        <xsl:value-of select="hl7:effectiveTime/hl7:low/@value"/>
                    </StartDateTime>
                    <EndDateTime>
                        <xsl:value-of select="hl7:effectiveTime/hl7:high/@value"/>
                    </EndDateTime>
                    <DischargeDisposition>
                    <xsl:choose>
                    <xsl:when test="hl7:dischargeDispositionCode/@displayName">
                    <xsl:value-of select="hl7:dischargeDispositionCode/@displayName" />
                    </xsl:when>
                    <xsl:when test="../../hl7:text/hl7:paragraph/hl7:content[@ID=hl7:dischargeDispositionCode/hl7:reference/@value]">
                    <xsl:value-of select="../../hl7:text/hl7:paragraph/hl7:content[@ID=hl7:dischargeDispositionCode/hl7:reference/@value]" />
                    </xsl:when>
                    <xsl:otherwise/>
                    </xsl:choose>
                    </DischargeDisposition>
                    <FacilityName>
                        <xsl:value-of select="hl7:author/hl7:assignedAuthor/hl7:representedOrganization/name | hl7:participant/hl7:participantRole/hl7:playingEntity/hl7:name"/>
                    </FacilityName>
                    <FacilityIDAAName>
                        <xsl:value-of select="hl7:author/hl7:assignedAuthor/hl7:representedOrganization/hl7:id/@assigningAuthorityName | hl7:participant/hl7:participantRole/hl7:id/@root"/>
                    </FacilityIDAAName>
                    <FacilityIDExtension>
                        <xsl:value-of select="hl7:author/hl7:assignedAuthor/hl7:representedOrganization/hl7:id/@extension | hl7:participant/hl7:participantRole/hl7:id/@extension"/>
                    </FacilityIDExtension>
                    <FacilityIDRoot>
                        <xsl:value-of select="hl7:author/hl7:assignedAuthor/hl7:representedOrganization/hl7:id/@root | hl7:participant/hl7:participantRole/hl7:id/@root"/>
                    </FacilityIDRoot>
                    <PerformerID>
                        <xsl:value-of select="hl7:performer/hl7:assignedEntity/hl7:id/@extension"/>
                    </PerformerID>
                    <PerformerAddress>
                        <xsl:value-of select="hl7:performer/hl7:assignedEntity/hl7:addr"/>
                    </PerformerAddress>
                    <PerformerTelecom>
                        <xsl:value-of select="hl7:performer/hl7:assignedEntity/hl7:telecom/@value"/>
                    </PerformerTelecom>
                    <PerformerName>
                        <xsl:value-of select="hl7:performer/hl7:assignedEntity/hl7:assignedPerson/hl7:name"/>
                    </PerformerName>
                    <AuthorTime>
                        <xsl:value-of select="hl7:author/hl7:time/@value"/>
                    </AuthorTime>
                    <LocationID>
                        <xsl:value-of select="hl7:participant/hl7:participantRole/hl7:id/@extension"/>
                    </LocationID>
                    <LocationAddress>
                        <xsl:value-of select="hl7:participant/hl7:participantRole/hl7:addr"/>
                    </LocationAddress>
                    <LocationTelecom>
                        <xsl:value-of select="hl7:participant/hl7:participantRole/hl7:telecom/@value"/>
                    </LocationTelecom>
                    <LocationName>
                        <xsl:value-of select="hl7:participant/hl7:participantRole/hl7:playingEntity/hl7:name"/>
                    </LocationName>
                </Encounter>
            </xsl:for-each>
        </Encounters>
    </xsl:template>
</xsl:stylesheet>
}

XData GoalsXSLT
{
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:hl7="urn:hl7-org:v3" exclude-result-prefixes="hl7">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/hl7:ClinicalDocument">
        <Goals>
            <xsl:for-each select="hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code/@code='61146-7']/hl7:entry/hl7:act">
                <Goal>
                    <GoalID>
                        <xsl:value-of select="hl7:id/@extension"/>
                    </GoalID>
                    <GoalDescription>
                        <xsl:value-of select="hl7:code/@displayName"/>
                    </GoalDescription>
                    <GoalCode>
                        <xsl:value-of select="hl7:code/@code"/>
                    </GoalCode>
                    <GoalCodeSystem>
                        <xsl:value-of select="hl7:code/@codeSystem"/>
                    </GoalCodeSystem>
                    <GoalCodeSystemName>
                        <xsl:value-of select="hl7:code/@codeSystemName"/>
                    </GoalCodeSystemName>
                    <GoalStatus>
                        <xsl:value-of select="hl7:statusCode/@code"/>
                    </GoalStatus>
                    <StartDate>
                        <xsl:value-of select="hl7:effectiveTime/hl7:low/@value"/>
                    </StartDate>
                    <EndDate>
                        <xsl:value-of select="hl7:effectiveTime/hl7:high/@value"/>
                    </EndDate>
                    <AuthorTime>
                        <xsl:value-of select="hl7:author/hl7:time/@value"/>
                    </AuthorTime>
                    <AuthorName>
                        <xsl:value-of select="hl7:author/hl7:assignedAuthor/hl7:assignedPerson/hl7:name"/>
                    </AuthorName>
                </Goal>
            </xsl:for-each>
        </Goals>
    </xsl:template>
</xsl:stylesheet>
}

XData ImplantsXSLT
{
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:hl7="urn:hl7-org:v3" exclude-result-prefixes="hl7">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/hl7:ClinicalDocument">
        <Implants>
            <xsl:for-each select="hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code/@code='46264-8']/hl7:entry/hl7:procedure">
                <Implant>
                    <ImplantID>
                        <xsl:value-of select="hl7:id/@extension"/>
                    </ImplantID>
                    <DeviceName>
                        <xsl:value-of select="hl7:code/@displayName"/>
                    </DeviceName>
                    <DeviceCode>
                        <xsl:value-of select="hl7:code/@code"/>
                    </DeviceCode>
                    <DeviceCodeSystem>
                        <xsl:value-of select="hl7:code/@codeSystem"/>
                    </DeviceCodeSystem>
                    <DeviceCodeSystemName>
                        <xsl:value-of select="hl7:code/@codeSystemName"/>
                    </DeviceCodeSystemName>
                    <ManufacturerModelName>
                        <xsl:value-of select="hl7:manufacturedProduct/hl7:manufacturedMaterial/hl7:manufacturerModelName"/>
                    </ManufacturerModelName>
                    <SerialNumber>
                        <xsl:value-of select="hl7:manufacturedProduct/hl7:manufacturedMaterial/hl7:lotNumberText"/>
                    </SerialNumber>
                    <ImplantStatus>
                        <xsl:value-of select="hl7:statusCode/@code"/>
                    </ImplantStatus>
                    <ImplantDate>
                        <xsl:value-of select="hl7:effectiveTime/hl7:low/@value"/>
                    </ImplantDate>
                    <RemovalDate>
                        <xsl:value-of select="hl7:effectiveTime/hl7:high/@value"/>
                    </RemovalDate>
                    <AuthorTime>
                        <xsl:value-of select="hl7:author/hl7:time/@value"/>
                    </AuthorTime>
                </Implant>
            </xsl:for-each>
        </Implants>
    </xsl:template>
</xsl:stylesheet>
}

XData EncompassingEncounterXSLT
{
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:hl7="urn:hl7-org:v3" exclude-result-prefixes="hl7">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/hl7:ClinicalDocument">
        <EncompassingEncounters>
            <xsl:for-each select="hl7:componentOf/hl7:encompassingEncounter">
                <EncompassingEncounter>
                    <EncounterID>
                        <xsl:value-of select="hl7:id/@extension"/>
                    </EncounterID>
                    <EncounterTypeDisplayName>
                        <xsl:value-of select="hl7:code/@displayName"/>
                    </EncounterTypeDisplayName>
                    <EncounterTypeCode>
                        <xsl:value-of select="hl7:code/@code"/>
                    </EncounterTypeCode>
                    <EncounterTypeCodeSystem>
                        <xsl:value-of select="hl7:code/@codeSystem"/>
                    </EncounterTypeCodeSystem>
                    <EncounterTypeCodeSystemName>
                        <xsl:value-of select="hl7:code/@codeSystemName"/>
                    </EncounterTypeCodeSystemName>
                    <StartDateTime>
                        <xsl:value-of select="hl7:effectiveTime/hl7:low/@value"/>
                    </StartDateTime>
                    <EndDateTime>
                        <xsl:value-of select="hl7:effectiveTime/hl7:high/@value"/>
                    </EndDateTime>
                    <DischargeDisposition>
                        <xsl:value-of select="hl7:dischargeDispositionCode/@displayName | hl7:dischargeDispositionCode/hl7:originalText"/>
                    </DischargeDisposition>
                    <LocationID>
                        <xsl:value-of select="hl7:location/hl7:healthCareFacility/hl7:id/@extension"/>
                    </LocationID>
                    <LocationName>
                        <xsl:value-of select="hl7:location/hl7:healthCareFacility/hl7:location/hl7:name"/>
                    </LocationName>
                    <LocationAddress>
                        <xsl:value-of select="hl7:location/hl7:healthCareFacility/hl7:location/hl7:addr"/>
                    </LocationAddress>
                    <LocationTelecom>
                        <xsl:value-of select="hl7:location/hl7:healthCareFacility/hl7:location/hl7:telecom/@value"/>
                    </LocationTelecom>
                    <AuthorTime>
                        <xsl:value-of select="hl7:author/hl7:time/@value"/>
                    </AuthorTime>
                </EncompassingEncounter>
            </xsl:for-each>
        </EncompassingEncounters>
    </xsl:template>
</xsl:stylesheet>
}

XData PayerXSLT
{
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3" exclude-result-prefixes="hl7">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/hl7:ClinicalDocument">
        <Payers>
            <xsl:for-each select="hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code/@code='48768-6']/hl7:entry/hl7:act">
                <Payer>
                    <PayerName>
                        <xsl:value-of select="hl7:entryRelationship/hl7:act/hl7:performer/hl7:assignedEntity/hl7:id/@root | hl7:entryRelationship/hl7:act/hl7:performer/hl7:assignedEntity/hl7:representedOrganization/hl7:name"/>
                    </PayerName>
                    <PolicyNumber>
                        <xsl:value-of select="hl7:id/@extension"/>
                    </PolicyNumber>
                    <CoveredParty>
                        <xsl:value-of select="hl7:entryRelationship/hl7:act/hl7:performer/hl7:assignedEntity/hl7:assignedPerson/hl7:name"/>
                    </CoveredParty>
                    <PayerCode>
                        <xsl:value-of select="hl7:code/@code"/>
                    </PayerCode>
                    <PayerCodeSystem>
                        <xsl:value-of select="hl7:code/@codeSystem"/>
                    </PayerCodeSystem>
                    <PayerCodeSystemName>
                        <xsl:value-of select="hl7:code/@codeSystemName"/>
                    </PayerCodeSystemName>
                    <PayerStatusCode>
                        <xsl:value-of select="hl7:statusCode/@code"/>
                    </PayerStatusCode>
                    <EffectiveTimeLow>
                        <xsl:value-of select="hl7:entryRelationship/hl7:act/hl7:performer/hl7:time/hl7:low/@value[1]"/>
                    </EffectiveTimeLow>
                    <EffectiveTimeHigh>
                        <xsl:value-of select="hl7:entryRelationship/hl7:act/hl7:performer/hl7:time/hl7:high/@value[1]"/>
                    </EffectiveTimeHigh>
                    <PerformerIDs>
                      	<xsl:value-of select="hl7:entryRelationship/hl7:act/hl7:performer/hl7:assignedEntity[hl7:code/@code='PAYOR']/hl7:id/@extension[1]"/>
                    </PerformerIDs>
                    <PerformerAddress>
                        <xsl:value-of select="hl7:entryRelationship/hl7:act/hl7:performer/hl7:assignedEntity[hl7:code/@code='PAYOR']/hl7:addr/hl7:streetAddressLine"/>
                    </PerformerAddress>
                    <PerformerTelecom>
                        <xsl:value-of select="hl7:entryRelationship/hl7:act/hl7:performer/hl7:assignedEntity[hl7:code/@code='PAYOR']/hl7:telecom/@value"/>
                    </PerformerTelecom>
                    <PerformerName>
                        <xsl:value-of select="hl7:entryRelationship/hl7:act/hl7:performer/hl7:assignedEntity[hl7:code/@code='PAYOR']/hl7:assignedPerson/hl7:name"/>
                    </PerformerName>
                    <AuthorTime>
                        <xsl:value-of select="hl7:entryRelationship/hl7:act/hl7:author/hl7:time/@value"/>
                    </AuthorTime>
                    <MemberID>
                        <xsl:value-of select="hl7:entryRelationship/hl7:act/hl7:participant/hl7:participantRole/hl7:id/@extension"/>
                    </MemberID>
                    <LocationAddress>
                        <xsl:value-of select="hl7:entryRelationship/hl7:act/hl7:participant/hl7:participantRole/hl7:addr[1]"/>
                    
                    </LocationAddress>
                    <LocationTelecom>
                        <xsl:value-of select="hl7:entryRelationship/hl7:act/hl7:participant/hl7:participantRole/hl7:telecom/@value"/>
                    </LocationTelecom>
                    <LocationName>
                        <xsl:value-of select="hl7:entryRelationship/hl7:act/hl7:participant/hl7:participantRole/hl7:playingEntity/hl7:name/@value"/>
                    </LocationName>
                    <ParticipantRoleID>
                        <xsl:value-of select="hl7:entryRelationship/hl7:act/hl7:participant/hl7:participantRole/hl7:id/@root"/>
                    </ParticipantRoleID>
                    <ParticipantRoleCode>
                        <xsl:value-of select="hl7:entryRelationship/hl7:act/hl7:participant/hl7:participantRole/hl7:code/@code"/>
                    </ParticipantRoleCode>
                    <ParticipantRoleCodeSystem>
                        <xsl:value-of select="hl7:entryRelationship/hl7:act/hl7:participant/hl7:participantRole/hl7:code/@codeSystem"/>
                    </ParticipantRoleCodeSystem>
                    <ParticipantRoleCodeSystemName>
                        <xsl:value-of select="hl7:entryRelationship/hl7:act/hl7:participant/hl7:participantRole/hl7:code/@codeSystemName"/>
                    </ParticipantRoleCodeSystemName>
                </Payer>
            </xsl:for-each>
        </Payers>
    </xsl:template>
</xsl:stylesheet>
}

XData PatientXSLT
{
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:hl7="urn:hl7-org:v3" exclude-result-prefixes="hl7">
    <xsl:output method="xml" indent="yes"/> 

    <xsl:template match="/hl7:ClinicalDocument">
        <Patient>
            <PatientMRN>
                <xsl:value-of select="hl7:recordTarget/hl7:patientRole/hl7:id/@extension"/>
            </PatientMRN>
            <FirstName>
                <xsl:value-of select="hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:name/hl7:given"/>
            </FirstName>
            <LastName>
                <xsl:value-of select="hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:name/hl7:family"/>
            </LastName>
            <DOB>
                <xsl:value-of select="hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:birthTime/@value"/>
            </DOB>
            <GenderCode>
                <xsl:value-of select="hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:administrativeGenderCode/@code"/>
            </GenderCode>
            <GenderDisplay>
                <xsl:value-of select="hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:administrativeGenderCode/@displayName"/>
            </GenderDisplay>
            <GenderSystem>
                <xsl:value-of select="hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:administrativeGenderCode/@codeSystem"/>
            </GenderSystem>
            <Address>
                <xsl:value-of select="hl7:recordTarget/hl7:patientRole/hl7:addr/hl7:streetAddressLine"/>
            </Address>
            <City>
                <xsl:value-of select="hl7:recordTarget/hl7:patientRole/hl7:addr/hl7:city"/>
            </City>
            <State>
                <xsl:value-of select="hl7:recordTarget/hl7:patientRole/hl7:addr/hl7:state"/>
            </State>
            <ZipCode>
                <xsl:value-of select="hl7:recordTarget/hl7:patientRole/hl7:addr/hl7:postalCode"/>
            </ZipCode>
            <Country>
                <xsl:value-of select="hl7:recordTarget/hl7:patientRole/hl7:addr/hl7:country"/>
            </Country>
            <PhoneNumber>
                <xsl:value-of select="hl7:recordTarget/hl7:patientRole/hl7:telecom/@value"/>
            </PhoneNumber>
            <PatientMRN>
            	<xsl:value-of select="hl7:recordTarget/hl7:patientRole/hl7:id/@extension"/>
            </PatientMRN>
            <Email>
    			<xsl:for-each select="hl7:recordTarget/hl7:patientRole/hl7:telecom[contains(@value, '@')]">
        		<xsl:if test="contains(@value, '@')">
            	<xsl:value-of select="@value"/>
        		</xsl:if>
    			</xsl:for-each>
			</Email>
			
			<MaritalStatusCode>
			<xsl:value-of select="hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:maritalStatusCode/@code"/>
			</MaritalStatusCode>
			<MaritalStatusDisplay>
			<xsl:value-of select="hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:maritalStatusCode/@displayName"/>
			</MaritalStatusDisplay>
			<MaritalStatusSystem>
			<xsl:value-of select="hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:maritalStatusCode/@codeSystem"/>
			</MaritalStatusSystem>
			
			<RaceCode>
			<xsl:value-of select="hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:raceCode/@code"/>
			</RaceCode>
			<RaceDisplay>
			<xsl:value-of select="hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:raceCode/@displayName"/>
			</RaceDisplay>
			<RaceSystem>
			<xsl:value-of select="hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:raceCode/@codeSystem"/>
			</RaceSystem>
			
			<EthnicityCode>
			<xsl:value-of select="hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:ethnicGroupCode/@code"/>
			</EthnicityCode>
			<EthnicityDisplay>
			<xsl:value-of select="hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:ethnicGroupCode/@displayName"/>
			</EthnicityDisplay>
			<EthnicitySystem>
			<xsl:value-of select="hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:ethnicGroupCode/@codeSystem"/>
			</EthnicitySystem>
			<LanguageCode>
			<xsl:value-of select="hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:languageCommunication/hl7:languageCode/@code"/>
			</LanguageCode>
            <InsurancePolicyNumber>
                <xsl:value-of select="hl7:entryRelationship/hl7:act/hl7:participant/hl7:participantRole/hl7:id/@extension"/>
            </InsurancePolicyNumber>
            <InsuranceProvider>
                <xsl:value-of select="hl7:entryRelationship/hl7:act/hl7:performer/hl7:assignedEntity/hl7:representedOrganization/hl7:name"/>
            </InsuranceProvider>
        </Patient>
    </xsl:template>
</xsl:stylesheet>
}

Storage Default
{
<Data name="CDAParserDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
</Data>
<DataLocation>^LEADNorth.LEADNo66EE.CDAParserD</DataLocation>
<DefaultData>CDAParserDefaultData</DefaultData>
<IdLocation>^LEADNorth.LEADNo66EE.CDAParserD</IdLocation>
<IndexLocation>^LEADNorth.LEADNo66EE.CDAParserI</IndexLocation>
<StreamLocation>^LEADNorth.LEADNo66EE.CDAParserS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
