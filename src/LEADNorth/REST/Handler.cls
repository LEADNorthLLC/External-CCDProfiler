Class LEADNorth.REST.Handler Extends %CSP.REST
{

Parameter UseSession As Integer = 0;

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
      <Route Url="/hello" Method="GET" Call="Hello"/>
      <Route Url="/index/getDistinctProfileIDs" Method="GET" Call="GetDistinctProfileIDs"/>
      <Route Url="/index/getSectionCoverage" Method="GET" Call="GetSectionCoverage"/>
      <Route Url="/index/RenameProfile" Method="POST" Call="RenameProfile"/>
      <Route Url="/dataImporter/processImport" Method="POST" Call="processImport"/>
      <Route Url="/reports/generateExcelReport" Method="POST" Call="generateExcelReport"/>
      <Route Url="/reports/getDistinctReportProfileIDs" Method="GET" Call="GetDistinctReportProfileIDs"/>
      <Route Url="/reports/QS" Method="POST" Call="QS"/>
      <Route Url="/settings/GetXSLTContent" Method="POST" Call="GetXSLTContent"/>
      <Route Url="/settings/SaveXSLTContent" Method="POST" Call="SaveXSLTContent"/>
      <Route Url="/settings/ApplyXSLTToCCD" Method="POST" Call="ApplyXSLTToCCD"/>
      <Route Url="/settings/DeleteDataByProfile" Method="POST" Call="DeleteDataByProfile"/>
      <Route Url="/settings/DeleteAllData" Method="POST" Call="DeleteAllData"/>
      <Route Url="/settings/PopulateProfileIDs" Method="GET" Call="PopulateProfileIDs"/>
</Routes>
}

ClassMethod RenameProfile() As %Status
{
    Set requestBody = %request.Content.Read()
    Set requestObj = {}.%FromJSON(requestBody)
    
    Set oldID = requestObj.%Get("oldID")
    Set newID = requestObj.%Get("newID")

    Try {
        Set sectionTables = $LB(
            "CCDDocument",
            "CCDAdvanceDirective",
            "CCDAllergy",
            "CCDEncounter",
            "CCDImmunization",
            "CCDMedication",
            "CCDProblem",
            "CCDProcedure",
            "CCDResult",
            "CCDSocialHistory",
            "CCDVitalSign",
            "CCDPlanOfCare",
            "CCDFunctionalStatus",
            "CCDGoals",
            "CCDImplants",
            "CCDFamilyHistory",
            "CCDPayer"
        )

        For i=1:1:$LL(sectionTables) {
            Set tableName = $LG(sectionTables, i)
            Set sqlText = "UPDATE LEADNorth_CDAProfiler_Sections."_tableName_" SET ProfileID = ? WHERE ProfileID = ?"

            Set tStatement = ##class(%SQL.Statement).%New()
            Set sc = tStatement.%Prepare(sqlText)
            If $$$ISERR(sc) {
                Set %response.Status = 500
                Write "Failed to prepare SQL for table "_tableName
                Quit
            }

            Set sc = tStatement.%Execute(newID, oldID)
            If $$$ISERR(sc) {
                Set %response.Status = 500
                Write "Failed to execute SQL for table "_tableName
                Quit
            }
        }

        Set %response.Status = 200
        Write "Profile renamed successfully across all tables."
        Quit

    } Catch ex {
        Set %response.Status = 500
        Write "Exception: "_ex.DisplayString()
        Quit
    }
}

ClassMethod GetSectionCoverage() As %Status [ WebMethod ]
{
    Set sections = "AdvanceDirective,Allergy,Diagnosis,Encounter,EncompassingEncounter,FamilyHistory,FunctionalStatus,Goals,Implants,Immunization,Medication,Patient,Payer,PlanOfCare,Problem,Procedure,Result,SocialHistory,VitalSign"

    Set finalResult = ##class(%DynamicArray).%New()

    Set sql = ##class(%SQL.Statement).%New()
    Set sc = sql.%Prepare("SELECT DISTINCT ProfileID FROM LEADNorth_CDAProfiler_Sections.CCDDocument ORDER BY MAX(CreatedAt) DESC")

    Quit:$$$ISERR(sc) sc

    Set rs = sql.%Execute()
    While rs.%Next() {
        Set profileID = rs.%Get("ProfileID")

        Set stmtMeta = ##class(%SQL.Statement).%New()
        Set sc = stmtMeta.%Prepare("SELECT COUNT(*) AS total, MAX(CreatedAt) AS latest FROM LEADNorth_CDAProfiler_Sections.CCDDocument WHERE ProfileID=?")
        Continue:$$$ISERR(sc)

        Set rsMeta = stmtMeta.%Execute(profileID)
        Do rsMeta.%Next()
        Set total = rsMeta.%Get("total")
        Set latestTS = rsMeta.%Get("latest")

        Set formattedDate = $ZDT($ZDATETIMEH(latestTS,3), 3)

        Set profileObj = ##class(%DynamicObject).%New()
        Set profileObj.ProfileID = profileID
        Set profileObj.DocumentCount = total
        Set profileObj.LastUpdated = formattedDate
        Set profileObj.Sections = ##class(%DynamicArray).%New()

        For i=1:1:$L(sections,",") {
            Set section = $P(sections,",",i)

            Set qry = "SELECT COUNT(*) AS c FROM LEADNorth_CDAProfiler_Sections.CCDDocument WHERE ProfileID=? AND SectionsPresent LIKE ?"
            Set sqlSection = ##class(%SQL.Statement).%New()
            Set sc = sqlSection.%Prepare(qry)
            Continue:$$$ISERR(sc)

            Set pat = "%" _ section _ "%"
            Set rsSection = sqlSection.%Execute(profileID, pat)
            Do rsSection.%Next()
            Set countSec = rsSection.%Get("c")

            If total>0 {
                Set pct = $J(countSec*100/total,0,1)
            } Else {
                Set pct = 0
            }

            Set sectionObj = ##class(%DynamicObject).%New()
            Set sectionObj.SectionName = section
            Set sectionObj.Percentage = pct

            Do profileObj.Sections.%Push(sectionObj)
        }

        Do finalResult.%Push(profileObj)
    }

    Set %response.Status = 200
    Set %response.ContentType = "application/json;charset=UTF-8"
    Write finalResult.%ToJSON()

    Quit $$$OK
}

/// Server-side method to retrieve XSLT content for the selected block.
ClassMethod GetXSLTContent() As %String [ ZenMethod ]
{
	Set requestBody = %request.Content.Read()
    Set requestObj = {}.%FromJSON(requestBody)
	
    Set xsltBlock = requestObj.%Get("xsltBlock")
    
    Set className = "LEADNorth.CDAProfiler.XSLT.CDAParser" // Target class name
    Set xdata = ##class(%Dictionary.XDataDefinition).IDKEYOpen(className, xsltBlock)
    If xdata = $$$NULLOREF {
        Quit "XData block not found!"
    }
    Write xdata.Data.Read()
    Quit $$$OK
}

ClassMethod SaveXSLTContent() As %String [ ZenMethod ]
{
	Set requestBody = %request.Content.Read()
    Set requestObj = {}.%FromJSON(requestBody)
	
    Set xsltBlock = requestObj.%Get("xsltBlock")
    Set xpathContent = requestObj.%Get("xpathContent")
    
    Set className = "LEADNorth.CDAProfiler.XSLT.CDAParser" // Target class name
    Set xdata = ##class(%Dictionary.XDataDefinition).IDKEYOpen(className, xsltBlock)
    If xdata = $$$NULLOREF {
        Quit "XData block not found!"
    }

    Do xdata.Data.Clear()
    Do xdata.Data.Write(xpathContent)
    Set status = xdata.%Save()
    
    If $$$ISERR(status) {
        Quit "Failed to save XData!"
    }

    Set sc = $SYSTEM.Status.OK()
    Set tInitIO = ##class(%Library.Device).ReDirectIO(1) 
    Try {
        $$$THROWONERROR(sc, $SYSTEM.OBJ.Compile(className, "ck"))
    } Catch(ex) {
        Set sc = ex.AsStatus()
    }

    Do ##class(%Library.Device).ReDirectIO(0)
    Use tInitIO

    If $$$ISERR(sc) {
        Quit "Failed to recompile the class! Error: "_$SYSTEM.Status.GetErrorText(sc)
    }

    Quit "XData block successfully updated and class recompiled."
}

ClassMethod ApplyXSLTToCCD() As %Stream.GlobalCharacter
{
    Set requestBody = %request.Content.Read()
    Set requestObj = {}.%FromJSON(requestBody)
    
    Set ccdFilePath = requestObj.%Get("ccdFilePath")
    Set xsltBlock = requestObj.%Get("xsltBlock")
    
    If ccdFilePath = "" {
        Set %response.Status = ..#HTTP500INTERNALSERVERERROR
        Set %response.ContentType = "text/plain;charset=UTF-8"
        Write "Error: No CCD file path provided."
        Quit $$$OK
    }
    
    Try {
        Set ccdStream = ##class(LEADNorth.CDAProfiler.CCDProcessor).FileToStream(ccdFilePath, xsltBlock)
    } Catch ex {
        Set %response.Status = ..#HTTP500INTERNALSERVERERROR
        Set %response.ContentType = "text/plain;charset=UTF-8"
        Write "Error: Exception occurred while processing the CCD file: "_ex.DisplayString()
        Quit 
    }
    
    If ccdStream = "" {
        Set %response.Status = ..#HTTP500INTERNALSERVERERROR
        Set %response.ContentType = "text/plain;charset=UTF-8"
        Write "Error: Failed to load CCD file or apply XSLT."
        Quit $$$OK
    }
    
    Set transformedOutput = ccdStream.Read()
    While 'ccdStream.AtEnd {
        Set transformedOutput = transformedOutput _ ccdStream.Read()
    }
    
    Set %response.Status = ..#HTTP200OK
    Set %response.ContentType = "text/html;charset=UTF-8"
    Write transformedOutput
    Quit $$$OK
}

ClassMethod PopulateProfileIDs() As %String [ ZenMethod ]
{
    Set query = "SELECT DISTINCT ProfileID FROM LEADNorth_CDAProfiler_Sections.CCDDocument"
    Set statement = ##class(%SQL.Statement).%New()
    Set status = statement.%Prepare(query)
    
    If $$$ISERR(status) {
        Return "Error: Could not retrieve ProfileIDs."
    }
    
    Set resultSet = statement.%Execute()
    Set html = ""
    
    While resultSet.%Next() {
        Set profileID = resultSet.%Get("ProfileID")
        Set html = html _ "<option value='"_profileID_"'>" _ profileID _ "</option>"
    }
    Set %response.Status = ..#HTTP200OK
    Set %response.ContentType = "text/html"
    Do %response.WriteHTTPHeader(1) // Ensure headers are sent
    Write html
    Quit $$$OK
}

ClassMethod DeleteDataByProfile() As %Status
{
    Set requestBody = %request.Content.Read()
    Set requestObj = {}.%FromJSON(requestBody)
    
    Set profileID = requestObj.%Get("profileID")
    Try {
        Set profileID = $Replace(profileID, "'", "''")
        
        &sql(DELETE FROM LEADNorth_CDAProfiler_Sections.CCDDocument WHERE ProfileID = :profileID)
        &sql(DELETE FROM LEADNorth_CDAProfiler_Sections.CCDEncounter WHERE ProfileID = :profileID)
        &sql(DELETE FROM LEADNorth_CDAProfiler_Sections.CCDVitalSign WHERE ProfileID = :profileID)
        &sql(DELETE FROM LEADNorth_CDAProfiler_Sections.CCDProcedure WHERE ProfileID = :profileID)
        &sql(DELETE FROM LEADNorth_CDAProfiler_Sections.CCDSocialHistory WHERE ProfileID = :profileID)
        &sql(DELETE FROM LEADNorth_CDAProfiler_Sections.CCDResult WHERE ProfileID = :profileID)
        &sql(DELETE FROM LEADNorth_CDAProfiler_Sections.CCDProblem WHERE ProfileID = :profileID)
        &sql(DELETE FROM LEADNorth_CDAProfiler_Sections.CCDPlanOfCare WHERE ProfileID = :profileID)
        &sql(DELETE FROM LEADNorth_CDAProfiler_Sections.CCDPayer WHERE ProfileID = :profileID)
        &sql(DELETE FROM LEADNorth_CDAProfiler_Sections.CCDPatient WHERE ProfileID = :profileID)
        &sql(DELETE FROM LEADNorth_CDAProfiler_Sections.CCDMedication WHERE ProfileID = :profileID)
        &sql(DELETE FROM LEADNorth_CDAProfiler_Sections.CCDImmunization WHERE ProfileID = :profileID)
        &sql(DELETE FROM LEADNorth_CDAProfiler_Sections.CCDFunctionalStatus WHERE ProfileID = :profileID)
        &sql(DELETE FROM LEADNorth_CDAProfiler_Sections.CCDFamilyHistory WHERE ProfileID = :profileID)
        &sql(DELETE FROM LEADNorth_CDAProfiler_Sections.CCDGoals WHERE ProfileID = :profileID)
        &sql(DELETE FROM LEADNorth_CDAProfiler_Sections.CCDImplants WHERE ProfileID = :profileID)
        &sql(DELETE FROM LEADNorth_CDAProfiler_Sections.CCDEncompassingEncounter WHERE ProfileID = :profileID)
        &sql(DELETE FROM LEADNorth_CDAProfiler_Sections.CCDAllergy WHERE ProfileID = :profileID)
        &sql(DELETE FROM LEADNorth_CDAProfiler_Sections.CCDAdvanceDirective WHERE ProfileID = :profileID)
        &sql(DELETE FROM LEADNorth_CDAProfiler_Sections.CCDDiagnosis WHERE ProfileID = :profileID)
        
        Set %response.ContentType = "application/json;charset=UTF-8"
        Set %response.Status = ..#HTTP200OK
        //Do %response.WriteHTTPHeader(1)
        Write "Successfully deleted data for profile id '"_profileID_"'"
    } Catch ex {
        Set errorMessage = "Error deleting data for ProfileID: "_profileID_" - "_ex.DisplayString()
        Set %response.ContentType = "text/plain;charset=UTF-8"
        Set %response.Status = 500
        //Do %response.WriteHTTPHeader(1)
        Write errorMessage
        Quit
    }
    QUIT $$$OK
}

/// Server-side method to delete all data.
ClassMethod DeleteAllData() As %Status
{
    Try {
        &sql(DELETE FROM LEADNorth_CDAProfiler_Sections.CCDDocument)
        &sql(DELETE FROM LEADNorth_CDAProfiler_Sections.CCDEncounter)
        &sql(DELETE FROM LEADNorth_CDAProfiler_Sections.CCDVitalSign)
        &sql(DELETE FROM LEADNorth_CDAProfiler_Sections.CCDProcedure)
        &sql(DELETE FROM LEADNorth_CDAProfiler_Sections.CCDSocialHistory)
        &sql(DELETE FROM LEADNorth_CDAProfiler_Sections.CCDResult)
        &sql(DELETE FROM LEADNorth_CDAProfiler_Sections.CCDProblem)
        &sql(DELETE FROM LEADNorth_CDAProfiler_Sections.CCDPlanOfCare)
        &sql(DELETE FROM LEADNorth_CDAProfiler_Sections.CCDPayer)
        &sql(DELETE FROM LEADNorth_CDAProfiler_Sections.CCDPatient)
        &sql(DELETE FROM LEADNorth_CDAProfiler_Sections.CCDMedication)
        &sql(DELETE FROM LEADNorth_CDAProfiler_Sections.CCDImmunization)
        &sql(DELETE FROM LEADNorth_CDAProfiler_Sections.CCDFunctionalStatus)
        &sql(DELETE FROM LEADNorth_CDAProfiler_Sections.CCDFamilyHistory)
        &sql(DELETE FROM LEADNorth_CDAProfiler_Sections.CCDGoals)
        &sql(DELETE FROM LEADNorth_CDAProfiler_Sections.CCDImplants)
        &sql(DELETE FROM LEADNorth_CDAProfiler_Sections.CCDEncompassingEncounter)
        &sql(DELETE FROM LEADNorth_CDAProfiler_Sections.CCDAllergy)
        &sql(DELETE FROM LEADNorth_CDAProfiler_Sections.CCDAdvanceDirective)
        &sql(DELETE FROM LEADNorth_CDAProfiler_Sections.CCDDiagnosis)

        Set %response.ContentType = "application/json;charset=UTF-8"
        Set %response.Status = ..#HTTP200OK
        //Do %response.WriteHTTPHeader(1)
        Write "All data deleted successfully"
    } Catch ex {
        Set errorMessage = "Error deleting data"_ex.DisplayString()
        Set %response.ContentType = "text/plain;charset=UTF-8"
        Set %response.Status = 500
        //Do %response.WriteHTTPHeader(1)
        Write errorMessage
        Quit
    }
    QUIT $$$OK
}

ClassMethod generateExcelReport() As %String
{
    Set stream = ##class(%Stream.GlobalCharacter).%New()
	
    Set requestBody = %request.Content.Read()
    Set requestObj = {}.%FromJSON(requestBody)
	
    Set profileID = requestObj.%Get("profileID")
    Set deIdentify = requestObj.%Get("deIdentify")
    Set sectionsString = requestObj.%Get("sections")
	
    If sectionsString = "" {
        Set sectionsString = "advanceDirective,allergy,diagnosis,documents,encompassingEncounter,encounters,familyHistory,functionalStatus,goals,implants,immunizations,medications,patient,payer,planOfCare,problems,procedures,results,socialHistory,vitalSigns"
    }

    Do stream.Write("<?xml version=""1.0""?>")
    Do stream.Write("<?mso-application progid=""Excel.Sheet""?>")
    Do stream.Write("<Workbook xmlns=""urn:schemas-microsoft-com:office:spreadsheet"" ")
    Do stream.Write("xmlns:o=""urn:schemas-microsoft-com:office:office"" ")
    Do stream.Write("xmlns:x=""urn:schemas-microsoft-com:office:excel"" ")
    Do stream.Write("xmlns:ss=""urn:schemas-microsoft-com:office:spreadsheet"" ")
    Do stream.Write("xmlns:html=""http://www.w3.org/TR/REC-html40"">")

    For i=1:1:$Length(sectionsString,",") {
        Set reportType = $Piece(sectionsString,",",i)
        
        Set sheetXML = ..GenerateWorksheetXML(reportType, profileID, deIdentify)
        If sheetXML'="" {
            While 'sheetXML.AtEnd {
                Set sheetChunk = sheetXML.Read(8192)
                Do stream.Write(sheetChunk)
            }
        }
    }

    Do stream.Write("</Workbook>")

    Set %response.Status = ..#HTTP200OK
    Set %response.ContentType = "application/vnd.ms-excel;charset=utf-8"
    Do stream.Rewind()
    While 'stream.AtEnd {
        Set chunk = stream.Read(8192)
        Write chunk
    }
    Quit $$$OK
}

ClassMethod GenerateWorksheetXML(reportType As %String, profileID As %String, deIdentify As %Boolean) As %Stream.GlobalCharacter
{
    Set fields = ""
    Set tableName = ""
    Set phiFields = "PatientMRN,FirstName,LastName,DOB,Address,City,State,ZipCode,PhoneNumber,Email,PolicyNumber,MemberID,RelativePerson,PatientID,SerialNumber"
    
    
    If reportType = "encounters" {
    	Set fields = "EncounterNumber,ReasonForVisit,VisitDescription,DischargeDisposition,EncounterTypeDisplayName,EncounterTypeCode,EncounterTypeCodeSystem,EncounterTypeCodeSystemName,StatusCode,StartDateTime,EndDateTime,FacilityName,FacilityIDAAName,FacilityIDExtension,FacilityIDRoot,PerformerID,PerformerAddress,PerformerTelecom,PerformerName,AuthorTime,LocationID,LocationAddress,LocationTelecom,LocationName"
    	Set tableName = "LEADNorth_CDAProfiler_Sections.CCDEncounter"
    	Set xsltBlock = "EncounterXSLT"
	} ElseIf reportType = "vitalSigns" {
	    Set fields = "Value,Unit,Description,xDate,AuthorTime,ObservationCode,ObservationCodeSystem,ObservationDisplayName,ObservationStatusCode,ObservationEffectiveTimeLow,ObservationEffectiveTimeHigh,ObservationIDRoot,ObservationIDExtension,OrganizerCode,OrganizerCodeSystem,OrganizerEffectiveTimeLow,OrganizerEffectiveTimeHigh,OrganizerClassCode,OrganizerMoodCode,OrganizerDisplayName,OrganizerStatusCode"
	    Set tableName = "LEADNorth_CDAProfiler_Sections.CCDVitalSign"
	    Set xsltBlock = "VitalSignsXSLT"
	} ElseIf reportType = "allergy" {
	    Set fields = "AllergyCode,AllergyCodeSystem,AllergyCodeSystemName,AllergyDisplayName,CategoryCode,CategoryCodeSystem,CategoryCodeSystemName,CategoryDisplayName,ReactionCode,ReactionCodeSystem,ReactionCodeSystemName,ReactionDisplayName,SeverityCode,SeverityCodeSystem,SeverityCodeName,SeverityDisplayName,StatusCode,StatusCodeSystem,StatusCodeSystemName,StatusDisplayName,EffectiveTimeLow,EffectiveTimeHigh,ObservationCode,ObservationCodeSystem,ObservationDisplayName,ObservationStatusCode,ObservationEffectiveTimeLow,ObservationEffectiveTimeHigh,RepresentedOrganization,ActIdExtension,ActIdRoot,ActClassCode,ActMoodCode,ActStatusCode,ReferenceAllergyId,ReferenceReactionId,ReferenceSeverityId,ReferenceStatusId"
	    Set tableName = "LEADNorth_CDAProfiler_Sections.CCDAllergy"
	    Set xsltBlock = "AllergyXSLT"
	} ElseIf reportType = "procedures" {
	    Set fields = "ProcedureCode,CodeSystem,CodeSystemName,CodeDisplayName,AuthorTime,Status,EffectiveTimeLow,EffectiveTimeHigh,PerformerID,PerformerName,PerformerOrganization,PerformerAddress,ProcedureClassCode,MoodCode"
	    Set tableName = "LEADNorth_CDAProfiler_Sections.CCDProcedure"
	    Set xsltBlock = "ProceduresXSLT"
	} ElseIf reportType = "socialHistory" {
	    Set fields = "SocialHistoryID,ConceptDescription,ObservationCode,ObservationCodeSystem,ObservationCodeSystemName,ObservationDisplayName,ValueCode,ValueCodeSystem,ValueCodeSystemName,ValueDisplayName,Units,AuthorTime,StatusCode,EffectiveTimeLow,EffectiveTimeHigh"
	    Set tableName = "LEADNorth_CDAProfiler_Sections.CCDSocialHistory"
	    Set xsltBlock = "SocialHistoryXSLT"
	} ElseIf reportType = "results" {
	    Set fields = "TestValue,Units,ReferenceRange,StatusCode,ObservationCode,ObservationCodeDisplayName,ObservationCodeSystem,ObservationCodeSystemName,AuthorTime,OrganizerID,OrganizerName,EffectiveTimeLow,EffectiveTimeHigh,MoodCode"
	    Set tableName = "LEADNorth_CDAProfiler_Sections.CCDResult"
	    Set xsltBlock = "ResultsXSLT"
	} ElseIf reportType = "problems" {
	    Set fields = "ValueCode,ValueDisplayName,CodeSystem,CodeSystemName,AuthorTime,Author,ProblemTypeCode,ProblemTypeName,StatusCode,EffectiveTimeLow,EffectiveTimeHigh,ProblemClassCode,MoodCode"
	    Set tableName = "LEADNorth_CDAProfiler_Sections.CCDProblem"
	    Set xsltBlock = "ProblemsXSLT"
	} ElseIf reportType = "planOfCare" {
	    Set fields = "EncounterID,EncounterExtension,DisplayName,StatusCode,EffectiveTimeLow,EffectiveTimeHigh,PerformerID,PerformerOrganization,PerformerAddress,PerformerCity,PerformerState,PerformerPostalCode,AuthorTime"
	    Set tableName = "LEADNorth_CDAProfiler_Sections.CCDPlanOfCare"
	    Set xsltBlock = "PlanOfCareXSLT"
	} ElseIf reportType = "payer" {
	    Set fields = "PayerName,PolicyNumber,MemberID,CoveredParty,PayerCode,PayerCodeSystem,PayerCodeSystemName,PayerStatusCode,EffectiveTimeLow,EffectiveTimeHigh,AuthorTime,PerformerIDs,PerformerAddress,PerformerTelecom,PerformerName,LocationAddress,LocationTelecom,LocationName,ParticipantRoleID,ParticipantRoleCode,ParticipantRoleCodeSystem,ParticipantRoleCodeSystemName"
	    Set tableName = "LEADNorth_CDAProfiler_Sections.CCDPayer"
	    Set xsltBlock = "PayerXSLT"
	} ElseIf reportType = "patient" {
	    Set fields = "PatientMRN,FirstName,LastName,DOB,GenderCode,GenderDisplay,GenderSystem,Address,City,State,ZipCode,Country,PhoneNumber,Email,LanguageCode,MaritalStatusCode,MaritalStatusDisplay,MaritalStatusSystem,RaceCode,RaceDisplay,RaceSystem,EthnicityCode,EthnicityDisplay,EthnicitySystem"
	    Set tableName = "LEADNorth_CDAProfiler_Sections.CCDPatient"
	    Set xsltBlock = "PatientXSLT"
	} ElseIf reportType = "medications" {
	    Set fields = "DrugName,GenericName,Dose,DoseUnits,Frequency,Route,Site,StartDate,EndDate,Provider,NDC,RxNormCode,GPI,Status"
	    Set tableName = "LEADNorth_CDAProfiler_Sections.CCDMedication"
	    Set xsltBlock = "MedicationsXSLT"
	} ElseIf reportType = "immunizations" {
	    Set fields = "ImmunizationID,Route,Dose,DoseUnit,Vaccine,VaccineCode,VaccineCodeSystem,VaccineCodeSystemName,LotNumber,StartDate,EndDate,PerformerID,PerformerAddress,PerformerCity,PerformerState,PerformerPostalCode,StatusCode"
	    Set tableName = "LEADNorth_CDAProfiler_Sections.CCDImmunization"
	    Set xsltBlock = "ImmunizationsXSLT"
	} ElseIf reportType = "functionalStatus" {
	    Set fields = "Status,xDate,Description,StatusCode,ObservationCode,ObservationSystem,EffectiveTime"
	    Set tableName = "LEADNorth_CDAProfiler_Sections.CCDFunctionalStatus"
	    Set xsltBlock = "FunctionalStatusXSLT"
	} ElseIf reportType = "familyHistory" {
	    Set fields = "RelativePerson,RelativeCode,RelativeCodeSystem,OnsetAge,StatusCode,ObservationCode,ObservationDisplayName,ObservationSystem,ObservationID,ObservationIDOid"
	    Set tableName = "LEADNorth_CDAProfiler_Sections.CCDFamilyHistory"
	    Set xsltBlock = "FamilyHistoryXSLT"
	} ElseIf reportType = "advanceDirective" {
	    Set fields = "DirectiveType,DateSigned,StatusCode,DirectiveID"
	    Set tableName = "LEADNorth_CDAProfiler_Sections.CCDAdvanceDirective"
	    Set xsltBlock = "AdvanceDirectiveXSLT"
	} ElseIf reportType = "goals" {
	    Set fields = "GoalID,GoalDescription,GoalCode,GoalCodeSystem,GoalCodeSystemName,GoalStatus,StartDate,EndDate,AuthorTime,AuthorName"
	    Set tableName = "LEADNorth_CDAProfiler_Sections.CCDGoals"
	    Set xsltBlock = "GoalsXSLT"
	} ElseIf reportType = "implants" {
	    Set fields = "ImplantID,DeviceName,DeviceCode,DeviceCodeSystem,DeviceCodeSystemName,ManufacturerModelName,SerialNumber,ImplantStatus,ImplantDate,RemovalDate,AuthorTime"
	    Set tableName = "LEADNorth_CDAProfiler_Sections.CCDImplants"
	    Set xsltBlock = "ImplantsXSLT"
	} ElseIf reportType = "encompassingEncounter" {
	    Set fields = "EncounterID,EncounterTypeDisplayName,EncounterTypeCode,EncounterTypeCodeSystem,EncounterTypeCodeSystemName,StartDateTime,EndDateTime,DischargeDisposition,LocationID,LocationName,LocationAddress,LocationTelecom"
	    Set tableName = "LEADNorth_CDAProfiler_Sections.CCDEncompassingEncounter"
	    Set xsltBlock = "EncompassingEncounterXSLT"
	} ElseIf reportType = "diagnosis" {
	    Set fields = "DiagnosisID,DiagnosisTypeCode,DiagnosisTypeCodeSystem,DiagnosisTypeCodeSystemName,DiagnosisTypeDisplayName,DiagnosisEffectiveTimeLow,DiagnosisEffectiveTimeHigh,DiagnosisCode,DiagnosisCodeSystem,DiagnosisCodeSystemName,DiagnosisCodeDisplayName,DiagnosisStatusCode,DiagnosisEncounterNumber"
	    Set tableName = "LEADNorth_CDAProfiler_Sections.CCDDiagnosis"
	    Set xsltBlock = "DiagnosisXSLT"
	}
	 Else {
        Return "" 
    }
    Set xml = ##class(%Stream.GlobalCharacter).%New()
    Do xml.Write("<Worksheet ss:Name="""_reportType_""">")
    Do xml.Write("<Table>")
    
    Do xml.Write("<Row>")
    Do xml.Write("<Cell><Data ss:Type=""String"">Field</Data></Cell>")
    Do xml.Write("<Cell><Data ss:Type=""String"">Value</Data></Cell>")
    Do xml.Write("<Cell><Data ss:Type=""String"">Occurrences</Data></Cell>")
    Do xml.Write("<Cell><Data ss:Type=""String"">XPath</Data></Cell>")
    //Do xml.Write("<Cell><Data ss:Type=""String"">SDA Mapping</Data></Cell>")
    Do xml.Write("</Row>")
    
    For j=1:1:$L(fields,",") {
        Set field = $ZStrip($P(fields,",",j),"*W")
        
        Set queryString = "SELECT "_field_" AS Value, COUNT(*) AS Occurrences FROM "_tableName_" WHERE ProfileID = ? GROUP BY "_field
        Set statement = ##class(%SQL.Statement).%New()
        Set status = statement.%Prepare(queryString)
        If $$$ISERR(status) {
            Continue
        }
        Set resultSet = statement.%Execute(profileID)
        If $$$ISERR(resultSet) {
            Continue
        }
        While resultSet.%Next() {
            Set value = resultSet.%Get("Value")
            Set occurrences = resultSet.%Get("Occurrences")
            
            Set xPath = $classmethod("LEADNorth.CDAProfiler.Utils.Mappings", "GetXPathForProperty", field, xsltBlock)
    		If (deIdentify) && (phiFields [ field) {
        		Set value = "CONFIDENTIAL"
    		}
            //Set sdaMapping = "<SDAPATH>"
            
            Do xml.Write("<Row>")
            Do xml.Write("<Cell><Data ss:Type=""String"">"_..EncodeXML(field)_"</Data></Cell>")
            Do xml.Write("<Cell><Data ss:Type=""String"">"_..EncodeXML(value)_"</Data></Cell>")
            Do xml.Write("<Cell><Data ss:Type=""Number"">"_occurrences_"</Data></Cell>")
            Do xml.Write("<Cell><Data ss:Type=""String"">"_..EncodeXML(xPath)_"</Data></Cell>")
            //Do xml.Write("<Cell><Data ss:Type=""String"">"_..EncodeXML(sdaMapping)_"</Data></Cell>")
            Do xml.Write("</Row>")
        }
    }
    
    Do xml.Write("</Table></Worksheet>")
    Quit xml
}

ClassMethod EncodeXML(value As %String) As %String
{
    Set value = $Replace(value, "&", "&amp;")
    Set value = $Replace(value, "<", "&lt;")
    Set value = $Replace(value, ">", "&gt;")
    Set value = $Replace(value, """", "&quot;")
    Set value = $Replace(value, "'", "&apos;")
    Quit value
}

ClassMethod GetDistinctReportProfileIDs() As %Status
{
    Set query = "SELECT DISTINCT ProfileID FROM LEADNorth_CDAProfiler_Sections.CCDDocument"
    Set statement = ##class(%SQL.Statement).%New()
    Set status = statement.%Prepare(query)

    If $$$ISERR(status) {
        Set %response.Status = ..#HTTP500INTERNALSERVERERROR
        Set %response.ContentType = "text/html"
        Do %response.WriteHTTPHeader(1) // Ensure headers are sent
        Write "<option value=''>Error retrieving profiles</option>"
        Quit $$$OK
    }
    
    Set resultSet = statement.%Execute()
    Set html = ""

    While resultSet.%Next() {
        Set profileID = resultSet.%Get("ProfileID")
        Set html = html _ "<option value="""_profileID_""">" _ profileID _ "</option>"
    }

    Set %response.Status = ..#HTTP200OK
    Set %response.ContentType = "text/html"
    Do %response.WriteHTTPHeader(1) // Ensure headers are sent
    Write html
    Quit $$$OK
}

ClassMethod QS() As %String
{
	
    Set requestBody = %request.Content.Read()
    Set requestObj = {}.%FromJSON(requestBody)
	
    Set reportType = requestObj.%Get("reportType")
    Set profileID = requestObj.%Get("profileID")
    
    If reportType = "encounters" {
        Set fields = "EncounterNumber,ReasonForVisit,VisitDescription,DischargeDisposition,EncounterTypeDisplayName,EncounterTypeCode,EncounterTypeCodeSystem,EncounterTypeCodeSystemName,StatusCode,StartDateTime,EndDateTime,FacilityName,FacilityIDAAName,FacilityIDExtension,FacilityIDRoot,PerformerID,PerformerAddress,PerformerTelecom,PerformerName,AuthorTime,LocationID,LocationAddress,LocationTelecom,LocationName"
    } ElseIf reportType = "vitalSigns" {
        Set fields = "Value,Unit,Description,xDate,AuthorTime,ObservationCode,ObservationCodeSystem,ObservationDisplayName,ObservationStatusCode,ObservationEffectiveTimeLow,ObservationEffectiveTimeHigh,ObservationIDRoot,ObservationIDExtension,OrganizerCode,OrganizerCodeSystem,OrganizerEffectiveTimeLow,OrganizerEffectiveTimeHigh,OrganizerClassCode,OrganizerMoodCode,OrganizerDisplayName,OrganizerStatusCode"
    } ElseIf reportType = "allergy" {
        Set fields = "AllergyCode,AllergyCodeSystem,AllergyCodeSystemName,AllergyDisplayName,CategoryCode,CategoryCodeSystem,CategoryCodeSystemName,CategoryDisplayName,ReactionCode,ReactionCodeSystem,ReactionCodeSystemName,ReactionDisplayName,SeverityCode,SeverityCodeSystem,SeverityCodeName,SeverityDisplayName,StatusCode,StatusCodeSystem,StatusCodeSystemName,StatusDisplayName,EffectiveTimeLow,EffectiveTimeHigh,ObservationCode,ObservationCodeSystem,ObservationDisplayName,ObservationStatusCode,ObservationEffectiveTimeLow,ObservationEffectiveTimeHigh,RepresentedOrganization,ActIdExtension,ActIdRoot,ActClassCode,ActMoodCode,ActStatusCode,ReferenceAllergyId,ReferenceReactionId,ReferenceSeverityId,ReferenceStatusId"
    } ElseIf reportType = "procedures" {
        Set fields = "ProcedureCode,CodeSystem,CodeSystemName,CodeDisplayName,AuthorTime,Status,EffectiveTimeLow,EffectiveTimeHigh,PerformerID,PerformerName,PerformerOrganization,PerformerAddress,ProcedureClassCode,MoodCode"
    } ElseIf reportType = "socialHistory" {
        Set fields = "SocialHistoryID,ConceptDescription,ObservationCode,ObservationCodeSystem,ObservationCodeSystemName,ObservationDisplayName,ValueCode,ValueCodeSystem,ValueCodeSystemName,ValueDisplayName,Units,AuthorTime,StatusCode,EffectiveTimeLow,EffectiveTimeHigh"
    } ElseIf reportType = "results" {
        Set fields = "TestValue,Units,ReferenceRange,StatusCode,ObservationCode,ObservationCodeDisplayName,ObservationCodeSystem,ObservationCodeSystemName,AuthorTime,OrganizerID,OrganizerName,EffectiveTimeLow,EffectiveTimeHigh,MoodCode"
    } ElseIf reportType = "problems" {
        Set fields = "ValueCode,ValueDisplayName,CodeSystem,CodeSystemName,AuthorTime,Author,ProblemTypeCode,ProblemTypeName,StatusCode,EffectiveTimeLow,EffectiveTimeHigh,ProblemClassCode,MoodCode"
    } ElseIf reportType = "planOfCare" {
        Set fields = "EncounterID,EncounterExtension,DisplayName,StatusCode,EffectiveTimeLow,EffectiveTimeHigh,PerformerID,PerformerOrganization,PerformerAddress,PerformerCity,PerformerState,PerformerPostalCode,AuthorTime"
    } ElseIf reportType = "payer" {
        Set fields = "PayerName,PolicyNumber,MemberID,CoveredParty,PayerCode,PayerCodeSystem,PayerCodeSystemName,PayerStatusCode,EffectiveTimeLow,EffectiveTimeHigh,AuthorTime,PerformerIDs,PerformerAddress,PerformerTelecom,PerformerName,LocationAddress,LocationTelecom,LocationName,ParticipantRoleID,ParticipantRoleCode,ParticipantRoleCodeSystem,ParticipantRoleCodeSystemName"
    } ElseIf reportType = "patient" {
        Set fields = "PatientMRN,FirstName,LastName,DOB,GenderCode,GenderDisplay,GenderSystem,Address,City,State,ZipCode,Country,PhoneNumber,Email,LanguageCode,MaritalStatusCode,MaritalStatusDisplay,MaritalStatusSystem,RaceCode,RaceDisplay,RaceSystem,EthnicityCode,EthnicityDisplay,EthnicitySystem"
    } ElseIf reportType = "medications" {
        Set fields = "DrugName,GenericName,Dose,DoseUnits,Frequency,Route,Site,StartDate,EndDate,Provider,NDC,RxNormCode,GPI,Status"
    } ElseIf reportType = "immunizations" {
        Set fields = "ImmunizationID,Route,Dose,DoseUnit,Vaccine,VaccineCode,VaccineCodeSystem,VaccineCodeSystemName,LotNumber,StartDate,EndDate,PerformerID,PerformerAddress,PerformerCity,PerformerState,PerformerPostalCode,StatusCode"
    } ElseIf reportType = "functionalStatus" {
        Set fields = "Status,xDate,Description,StatusCode,ObservationCode,ObservationSystem,EffectiveTime"
    } ElseIf reportType = "familyHistory" {
        Set fields = "RelativePerson,RelativeCode,RelativeCodeSystem,OnsetAge,StatusCode,ObservationCode,ObservationDisplayName,ObservationSystem,ObservationID,ObservationIDOid"
    } ElseIf reportType = "documents" { // Documents report fields
        Set fields = "DocumentID,PatientID,DocumentDate,CreatedAt"
    } ElseIf reportType = "advanceDirective" {
        Set fields = "DirectiveType,DateSigned,StatusCode,DirectiveID"  // Fields for Advance Directive
    } ElseIf reportType = "goals" {
        Set fields = "GoalID,GoalDescription,GoalCode,GoalCodeSystem,GoalCodeSystemName,GoalStatus,StartDate,EndDate,AuthorTime,AuthorName"
    } ElseIf reportType = "implants" {
        Set fields = "ImplantID,DeviceName,DeviceCode,DeviceCodeSystem,DeviceCodeSystemName,ManufacturerModelName,SerialNumber,ImplantStatus,ImplantDate,RemovalDate,AuthorTime"
    } ElseIf reportType = "encompassingEncounter" {
        Set fields = "EncounterID,EncounterTypeDisplayName,EncounterTypeCode,EncounterTypeCodeSystem,EncounterTypeCodeSystemName,StartDateTime,EndDateTime,DischargeDisposition,LocationID,LocationName,LocationAddress,LocationTelecom"
    } ElseIf reportType = "diagnosis" {
        Set fields = "DiagnosisID,DiagnosisTypeCode,DiagnosisTypeCodeSystem,DiagnosisTypeCodeSystemName,DiagnosisTypeDisplayName,DiagnosisEffectiveTimeLow,DiagnosisEffectiveTimeHigh,DiagnosisCode,DiagnosisCodeSystem,DiagnosisCodeSystemName,DiagnosisCodeDisplayName,DiagnosisStatusCode,DiagnosisEncounterNumber"
    } ElseIf reportType = "allSections" {
        Set fields = "AllSections"
    }

    Set html = ""

    For i=1:1:$Length(fields, ",") {
        Set field = $ZStrip($Piece(fields, ",", i), "*W") 
		if reportType '= "allSections" {
			Set html = html _ "<button class='collapsible'' style='font-family: poppins-extralight, poppins, sans-serif;'>" _ field _ "</button>"
		} else {
			Set html = html _ "<button class='collapsible'' style='font-family: poppins-extralight, poppins, sans-serif;'>" _ "All Unique Sections" _ "</button>"
		}
        Set html = html _ "<div class='content-section-data'>"
        //Set html = html _ "<table class='report-table'><tr><th>Value</th><th>Occurrences</th><th>XPath</th><th>SDA Mapping</th></tr>"
        Set html = html _ "<table class='report-table'><tr><th>Value</th><th>Occurrences</th><th>XPath</th></tr>"

        If reportType = "encounters" {
            Set queryString = "SELECT "_field_" AS Value, COUNT(*) AS Occurrences, XPath " _
                              "FROM LEADNorth_CDAProfiler_Sections.CCDEncounter WHERE ProfileID = ? " _
                              "GROUP BY "_field_", XPath"
        } ElseIf reportType = "vitalSigns" {
            Set queryString = "SELECT "_field_" AS Value, COUNT(*) AS Occurrences, XPath " _
                              "FROM LEADNorth_CDAProfiler_Sections.CCDVitalSign WHERE ProfileID = ? " _
                              "GROUP BY "_field_", XPath"
        } ElseIf reportType = "allergy" {
            Set queryString = "SELECT "_field_" AS Value, COUNT(*) AS Occurrences, XPath " _
                              "FROM LEADNorth_CDAProfiler_Sections.CCDAllergy WHERE ProfileID = ? " _
                              "GROUP BY "_field_", XPath"
        } ElseIf reportType = "procedures" {
            Set queryString = "SELECT "_field_" AS Value, COUNT(*) AS Occurrences, XPath " _
                              "FROM LEADNorth_CDAProfiler_Sections.CCDProcedure WHERE ProfileID = ? " _
                              "GROUP BY "_field_", XPath"
        } ElseIf reportType = "socialHistory" {
            Set queryString = "SELECT "_field_" AS Value, COUNT(*) AS Occurrences, XPath " _
                              "FROM LEADNorth_CDAProfiler_Sections.CCDSocialHistory WHERE ProfileID = ? " _
                              "GROUP BY "_field_", XPath"
        } ElseIf reportType = "results" {
            Set queryString = "SELECT "_field_" AS Value, COUNT(*) AS Occurrences, XPath " _
                              "FROM LEADNorth_CDAProfiler_Sections.CCDResult WHERE ProfileID = ? " _
                              "GROUP BY "_field_", XPath"
        } ElseIf reportType = "problems" {
            Set queryString = "SELECT "_field_" AS Value, COUNT(*) AS Occurrences, XPath " _
                              "FROM LEADNorth_CDAProfiler_Sections.CCDProblem WHERE ProfileID = ? " _
                              "GROUP BY "_field_", XPath"
        } ElseIf reportType = "planOfCare" {
            Set queryString = "SELECT "_field_" AS Value, COUNT(*) AS Occurrences, XPath " _
                              "FROM LEADNorth_CDAProfiler_Sections.CCDPlanOfCare WHERE ProfileID = ? " _
                              "GROUP BY "_field_", XPath"
        } ElseIf reportType = "payer" {
            Set queryString = "SELECT "_field_" AS Value, COUNT(*) AS Occurrences, XPath " _
                              "FROM LEADNorth_CDAProfiler_Sections.CCDPayer WHERE ProfileID = ? " _
                              "GROUP BY "_field_", XPath"
        } ElseIf reportType = "patient" {
            Set queryString = "SELECT "_field_" AS Value, COUNT(*) AS Occurrences, XPath " _
                              "FROM LEADNorth_CDAProfiler_Sections.CCDPatient WHERE ProfileID = ? " _
                              "GROUP BY "_field_", XPath"
        } ElseIf reportType = "medications" {
            Set queryString = "SELECT "_field_" AS Value, COUNT(*) AS Occurrences, XPath " _
                              "FROM LEADNorth_CDAProfiler_Sections.CCDMedication WHERE ProfileID = ? " _
                              "GROUP BY "_field_", XPath"
        } ElseIf reportType = "immunizations" {
            Set queryString = "SELECT "_field_" AS Value, COUNT(*) AS Occurrences, XPath " _
                              "FROM LEADNorth_CDAProfiler_Sections.CCDImmunization WHERE ProfileID = ? " _
                              "GROUP BY "_field_", XPath"
        } ElseIf reportType = "functionalStatus" {
            Set queryString = "SELECT "_field_" AS Value, COUNT(*) AS Occurrences, XPath " _
                              "FROM LEADNorth_CDAProfiler_Sections.CCDFunctionalStatus WHERE ProfileID = ? " _
                              "GROUP BY "_field_", XPath"
        } ElseIf reportType = "familyHistory" {
            Set queryString = "SELECT "_field_" AS Value, COUNT(*) AS Occurrences, XPath " _
                              "FROM LEADNorth_CDAProfiler_Sections.CCDFamilyHistory WHERE ProfileID = ? " _
                              "GROUP BY "_field_", XPath"
        } ElseIf reportType = "documents" {
            Set queryString = "SELECT "_field_" AS Value, COUNT(*) AS Occurrences, XPath " _
                              "FROM LEADNorth_CDAProfiler_Sections.CCDDocument WHERE ProfileID = ? " _
                              "GROUP BY "_field_", XPath"
        } ElseIf reportType = "advanceDirective" {
            Set queryString = "SELECT "_field_" AS Value, COUNT(*) AS Occurrences, XPath " _
                              "FROM LEADNorth_CDAProfiler_Sections.CCDAdvanceDirective WHERE ProfileID = ? " _
                              "GROUP BY "_field_", XPath"
        } ElseIf reportType = "goals" {
            Set queryString = "SELECT "_field_" AS Value, COUNT(*) AS Occurrences, XPath " _
                              "FROM LEADNorth_CDAProfiler_Sections.CCDGoals WHERE ProfileID = ? " _
                              "GROUP BY "_field_", XPath"
        }  ElseIf reportType = "encompassingEncounter" {
            Set queryString = "SELECT "_field_" AS Value, COUNT(*) AS Occurrences, XPath " _
                              "FROM LEADNorth_CDAProfiler_Sections.CCDEncompassingEncounter WHERE ProfileID = ? " _
                              "GROUP BY "_field_", XPath"
        } ElseIf reportType = "implants" {
            Set queryString = "SELECT "_field_" AS Value, COUNT(*) AS Occurrences, XPath " _
                              "FROM LEADNorth_CDAProfiler_Sections.CCDImplants WHERE ProfileID = ? " _
                              "GROUP BY "_field_", XPath"
        } ElseIf reportType = "diagnosis" {
            Set queryString = "SELECT "_field_" AS Value, COUNT(*) AS Occurrences, XPath " _
                              "FROM LEADNorth_CDAProfiler_Sections.CCDDiagnosis WHERE ProfileID = ? " _
                              "GROUP BY "_field_", XPath"
        } ElseIf reportType = "allSections" {
            Set queryString = "SELECT "_field_" AS Value, COUNT(*) AS Occurrences, XPath " _
                              "FROM LEADNorth_CDAProfiler_Sections.CCDDocument WHERE ProfileID = ? " _
                              "GROUP BY "_field_", XPath"
        } 

        Set statement = ##class(%SQL.Statement).%New()
        Set status = statement.%Prepare(queryString)
        If $$$ISERR(status) {
	        write queryString
            Quit
        }

        Set resultSet = statement.%Execute(profileID)
        If $$$ISERR(resultSet) {
            Quit
        }
        
        if reportType '= "allSections" {
	        While resultSet.%Next() {
	            Set value = ..EncodeHTML(resultSet.%Get("Value"))
	            Set occurrences = ..EncodeHTML(resultSet.%Get("Occurrences"))
	            Set xPath = ""

	            If reportType = "encounters" {
	                Set xPath = ##class(LEADNorth.CDAProfiler.Utils.Mappings).GetXPathForProperty(field, "EncounterXSLT")
	            } ElseIf reportType = "vitalSigns" {
	                Set xPath = ##class(LEADNorth.CDAProfiler.Utils.Mappings).GetXPathForProperty(field, "VitalSignsXSLT")
	            } ElseIf reportType = "procedures" {
	                Set xPath = ##class(LEADNorth.CDAProfiler.Utils.Mappings).GetXPathForProperty(field, "ProceduresXSLT")
	            } ElseIf reportType = "socialHistory" {
	                Set xPath = ##class(LEADNorth.CDAProfiler.Utils.Mappings).GetXPathForProperty(field, "SocialHistoryXSLT")
	            } ElseIf reportType = "results" {
	                Set xPath = ##class(LEADNorth.CDAProfiler.Utils.Mappings).GetXPathForProperty(field, "ResultsXSLT")
	            } ElseIf reportType = "problems" {
	                Set xPath = ##class(LEADNorth.CDAProfiler.Utils.Mappings).GetXPathForProperty(field, "ProblemsXSLT")
	            } ElseIf reportType = "planOfCare" {
	                Set xPath = ##class(LEADNorth.CDAProfiler.Utils.Mappings).GetXPathForProperty(field, "PlanOfCareXSLT")
	            } ElseIf reportType = "payer" {
	                Set xPath = ##class(LEADNorth.CDAProfiler.Utils.Mappings).GetXPathForProperty(field, "PayerXSLT")
	            } ElseIf reportType = "patient" {
	                Set xPath = ##class(LEADNorth.CDAProfiler.Utils.Mappings).GetXPathForProperty(field, "PatientXSLT")
	            } ElseIf reportType = "medications" {
	                Set xPath = ##class(LEADNorth.CDAProfiler.Utils.Mappings).GetXPathForProperty(field, "MedicationsXSLT")
	            } ElseIf reportType = "immunizations" {
	                Set xPath = ##class(LEADNorth.CDAProfiler.Utils.Mappings).GetXPathForProperty(field, "ImmunizationsXSLT")
	            } ElseIf reportType = "functionalStatus" {
	                Set xPath = ##class(LEADNorth.CDAProfiler.Utils.Mappings).GetXPathForProperty(field, "FunctionalStatusXSLT")
	            } ElseIf reportType = "familyHistory" {
	                Set xPath = ##class(LEADNorth.CDAProfiler.Utils.Mappings).GetXPathForProperty(field, "FamilyHistoryXSLT")
	            } ElseIf reportType = "documents" {
	                Set xPath = ##class(LEADNorth.CDAProfiler.Utils.Mappings).GetXPathForProperty(field, "MetadataXSLT")
	            } ElseIf reportType = "advanceDirective" {
	                Set xPath = ##class(LEADNorth.CDAProfiler.Utils.Mappings).GetXPathForProperty(field, "AdvanceDirectiveXSLT")
	            } ElseIf reportType = "allergy" {
	                Set xPath = ##class(LEADNorth.CDAProfiler.Utils.Mappings).GetXPathForProperty(field, "AllergyXSLT")
	            } ElseIf reportType = "diagnosis" {
	                Set xPath = ##class(LEADNorth.CDAProfiler.Utils.Mappings).GetXPathForProperty(field, "DiagnosisXSLT")
	            } ElseIf reportType = "encompassingEncounter" {
	                Set xPath = ##class(LEADNorth.CDAProfiler.Utils.Mappings).GetXPathForProperty(field, "EncompassingEncounterXSLT")
	            } ElseIf reportType = "goals" {
	                Set xPath = ##class(LEADNorth.CDAProfiler.Utils.Mappings).GetXPathForProperty(field, "GoalsXSLT")
	            } ElseIf reportType = "implants" {
	                Set xPath = ##class(LEADNorth.CDAProfiler.Utils.Mappings).GetXPathForProperty(field, "ImplantsXSLT")
	            } ElseIf reportType = "allSections" {
	                Set xPath = ##class(LEADNorth.CDAProfiler.Utils.Mappings).GetXPathForProperty(field, "MetadataXSLT")
	            } 
		   		//Set html = html _ "<tr><td>" _ value _ "</td><td>" _ occurrences _ "</td><td>" _ xPath _ "</td><td>" _ "<SDAPATH>" _ "</td></tr>"
		   		Set html = html _ "<tr><td>" _ value _ "</td><td>" _ occurrences _ "</td><td>" _ xPath _ "</td></tr>"
	        }
	        Set html = html _ "</table></div>"
        } elseif reportType = "allSections" {
	        Set value = ##class(LEADNorth.CDAProfiler.Sections.CCDDocument).GetUniqueSections(profileID)
			Set html = html _ "<tr><td>" _ value _ "</td><td>" _ "1" _ "</td><td>" _"N/A"_ "</td></tr>"
        }
    }
    Set %response.Status = ..#HTTP200OK
    Set %response.ContentType = "text/html"
    //Do %response.WriteHTTPHeader(1) // Ensure headers are sent
    Write html
    Quit $$$OK
}

ClassMethod EncodeHTML(value As %String) As %String
{
    Set value = $Replace(value, "&", "&amp;")
    Set value = $Replace(value, "<", "&lt;")
    Set value = $Replace(value, ">", "&gt;")
    Set value = $Replace(value, """", "&quot;")
    Set value = $Replace(value, "'", "&#39;")
    Quit value
}

ClassMethod ProcessCCDDirectory(directory As %String, profileID As %String, sections As %String) As %Status [ WebMethod ]
{
    Set %response.AllowOutputFlush = 1
    Do %response.SetHeader("Content-Type", "text/plain; charset=utf-8")
    Do %response.SetHeader("Transfer-Encoding", "chunked")
    Do %response.DeleteHeader("Content-Length")
    Do %response.WriteHTTPHeader(1)
    Do %response.Flush()


	If ##class(%File).DirectoryExists(directory) = 0 {
	    Write "ERROR: Directory does not exist: ", directory, !
	    Do %response.Flush()
	    Quit $$$ERROR($$$GeneralError, "Directory does not exist: "_directory)
	}


    Set resultSet = ##class(%ResultSet).%New("%File:FileSet")
    Set sc = resultSet.Execute(directory, "*.xml")
    If $$$ISERR(sc) {
        Write "ERROR: Failed to retrieve file list from directory: ", directory, !
        Do %response.Flush()
        Quit sc
    }

    Set fileCount = 0
    While resultSet.%Next() {
        Set fileCount = fileCount + 1
    }

    If fileCount = 0 {
        Write "No XML files found in directory: ", directory, !
        Do %response.Flush()
        Quit $$$OK
    }

    Set resultSet = ##class(%ResultSet).%New("%File:FileSet")
    Set sc = resultSet.Execute(directory, "*.xml")
    If $$$ISERR(sc) {
        Write "ERROR: Failed to reopen file list: ", directory, !
        Do %response.Flush()
        Quit sc
    }

    Set currentIndex = 0

    While resultSet.%Next() {
        Set currentIndex = currentIndex + 1
        Set fileName = resultSet.Data("Name")
        Set fullPath = ##class(%File).NormalizeFilename(fileName, directory)

        If ##class(%File).Exists(fullPath) = 0 {
            Write "ERROR: File not found: ", fullPath, !
            Do %response.Flush()
            Continue
        }

        Try {
            Set sc = ##class(LEADNorth.CDAProfiler.CCDProcessor).ProcessCCD(fullPath, profileID, sections)

            If $$$ISOK(sc) {
                Write "PROGRESS:", currentIndex, "/", fileCount, !
                Do %response.Flush()
            } Else {
                Write "ERROR processing file: ", fullPath, !
                Do $System.Status.DisplayError(sc)
                Do %response.Flush()
            }
        } Catch ex {
            Write "EXCEPTION processing file: ", fullPath, !
            Do $System.Status.DisplayError(ex.AsStatus())
            Do %response.Flush()
        }
    }

    Write "DONE", !
    Do %response.Flush()

    Quit $$$OK
}

ClassMethod processImport() As %Status
{
    Set requestBody = %request.Content.Read()
    Set requestObj = {}.%FromJSON(requestBody)

    Set importType = requestObj.%Get("importType", "")
    Set profileID = requestObj.%Get("profileID", "")
    Set numDocuments = requestObj.%Get("numDocuments", 0)
    Set filterDocuments = requestObj.%Get("filterDocuments", "")
    Set importData = requestObj.%Get("directoryPath", "")
    Set sections = requestObj.%Get("selectedSections")


    Set responseObj = {} 

    Try {
        If importType = "bulk" {
            Set directoryPath = importData

            Set sc = ..ProcessCCDDirectory(directoryPath, profileID, sections)
            If $$$ISERR(sc) {
                Set responseObj.message = "Bulk import failed."
                Set %response.Status = "500 Internal Server Error"
            } Else {
                Set responseObj.message = "Bulk import completed successfully."
                Set %response.Status = "200 OK"
            }
        }
        ElseIf importType = "api" {
            Set filesArray = requestObj.%Get("files")
            If '$IsObject(filesArray) {
                Set responseObj.message = "Invalid file input."
                Set %response.Status = "400 Bad Request"
            } Else {
                Set i = ""
                While filesArray.GetNext(i) {
                    Set fileName = filesArray.GetAt(i)
                    Set sc = ##class(LEADNorth.CDAProfiler.CCDProcessor).ProcessCCD(fileName, profileID, sections)
                    If $$$ISERR(sc) {
                        Set responseObj.message = "API import failed."
                        Set %response.Status = "500 Internal Server Error"
                        Quit
                    }
                }
                If '$Data(responseObj.message) {
                    Set responseObj.message = "API import completed successfully."
                    Set %response.Status = "200 OK"
                }
            }
        }
        ElseIf importType = "database" {
            If numDocuments <= 0 {
                Set responseObj.message = "Invalid number of documents specified."
                Set %response.Status = "400 Bad Request"
            } Else {
                Set sc = ##class(LEADNorth.CDAProfiler.CCDProcessor).ProcessLatestCCDs(numDocuments, profileID, filterDocuments, sections)
                If $$$ISERR(sc) {
                    Set responseObj.message = "Database import failed."
                    Set %response.Status = "500 Internal Server Error"
                } Else {
                    Set responseObj.message = "Database import completed successfully."
                    Set %response.Status = "200 OK"
                }
            }
        }
        Else {
            Set responseObj.message = "Invalid import type."
            Set %response.Status = "400 Bad Request"
        }
    } Catch ex {
        Set responseObj.message = "An error occurred during import: "_ex.DisplayString()
        Set %response.Status = "500 Internal Server Error"
    }

    
    Quit $$$OK
}

ClassMethod GetDistinctProfileIDs() As %String
{
    Set query = "SELECT ProfileID, MAX(CreatedAt) AS CreatedAt FROM LEADNorth_CDAProfiler_Sections.CCDDocument GROUP BY ProfileID"
    
    Set statement = ##class(%SQL.Statement).%New()
    Set status = statement.%Prepare(query)
    
    If $$$ISERR(status) {
        Return "Error preparing statement: "_$System.Status.GetErrorText(status)
    }
    
    Set resultSet = statement.%Execute()
    
    Set html = ""
    
    While resultSet.%Next() {
        Set profileID = resultSet.%Get("ProfileID")
        Set reportDate = resultSet.%Get("CreatedAt")
        
        Set html = html _ "<li><a href='index.html#/reports?profileID="_profileID_"'>Report for Profile "_profileID_" - Generated on "_reportDate_"</a></li>"
    }
    
    Write html
    Quit $$$OK
}

ClassMethod Hello() As %Status
{
    Write "Hello from IRIS!"
    Quit $$$OK
}

}
