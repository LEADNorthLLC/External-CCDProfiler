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
      <Route Url="/dataImporter/processImport" Method="POST" Call="ProcessImport"/>
      <Route Url="/reports/generateExcelReport" Method="POST" Call="GenerateExcelReport"/>
      <Route Url="/reports/getDistinctReportProfileIDs" Method="GET" Call="GetDistinctReportProfileIDs"/>
      <Route Url="/reports/QS" Method="POST" Call="FetchAndRender"/>
      <Route Url="/settings/GetXSLTContent" Method="POST" Call="GetXSLTContent"/>
      <Route Url="/settings/SaveXSLTContent" Method="POST" Call="SaveXSLTContent"/>
      <Route Url="/settings/ApplyXSLTToCCD" Method="POST" Call="ApplyXSLTToCCD"/>
      <Route Url="/settings/DeleteDataByProfile" Method="POST" Call="DeleteDataByProfile"/>
      <Route Url="/settings/DeleteAllData" Method="POST" Call="DeleteAllData"/>
      <Route Url="/settings/PopulateProfileIDs" Method="GET" Call="PopulateProfileIDs"/>
</Routes>
}

/// Used to rename profiles
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
            "CCDDiagnosis",
            "CCDEncompassingEncounter",
            "CCDPatient",
            "CCDPayer"
        )
        
        // Loop through each table to rename the profile
        For i=1:1:$LL(sectionTables) {
            Set tableName = $LG(sectionTables, i)
            Set sqlText = "UPDATE LEADNorth_CDAProfiler_Sections."_tableName_" SET ProfileID = ? WHERE ProfileID = ?"

            Set tStatement = ##class(%SQL.Statement).%New()
            Set tSC = tStatement.%Prepare(sqlText)
            if tSC'=1 {
                Set %response.Status = ..#HTTP500INTERNALSERVERERROR
                Write "Failed to prepare SQL for table "_tableName
                Quit
            }

            Set tSC = tStatement.%Execute(newID, oldID)
            if tSC.%SQLCODE < 0 {
                Set %response.Status = ..#HTTP500INTERNALSERVERERROR
                Write "Failed to execute SQL for table "_tableName
                Quit
            }
        }

        if tSC = 1 {
	        Set %response.Status = ..#HTTP200OK
        Write "Profile renamed successfully across all tables."
        Write {"message":"Success"}.%ToJSON()
        Quit
        }

    } Catch ex {
        Set %response.Status = ..#HTTP500INTERNALSERVERERROR
        Write "Exception: "_ex.DisplayString()
        Quit
    }
    Quit tSC
}

/// Gets the section coverage statistics for each distinct ProfileID.
/// Returns a JSON array of objects, each representing a profile and the percentage presence of each section.
ClassMethod GetSectionCoverage() As %Status
{
    // Define the list of clinical document sections to check for coverage
    Set sections = "AdvanceDirective,Allergy,Diagnosis,Encounter,EncompassingEncounter,FamilyHistory,FunctionalStatus,Goals,Implants,Immunization,Medication,Patient,Payer,PlanOfCare,Problem,Procedure,Result,SocialHistory,VitalSign"

    // Initialize the array that will store coverage results for each profile
    Set finalResult = ##class(%DynamicArray).%New()

    // Prepare a query to retrieve all distinct profile IDs, sorted by most recent document creation
    Set sql = ##class(%SQL.Statement).%New()
    Set sc = sql.%Prepare("SELECT DISTINCT ProfileID FROM LEADNorth_CDAProfiler_Sections.CCDDocument ORDER BY MAX(CreatedAt) DESC")
    Quit:$$$ISERR(sc) sc

    // Execute the distinct ProfileID query
    Set rs = sql.%Execute()
    While rs.%Next() {
        Set profileID = rs.%Get("ProfileID")

        // Query total document count and latest update timestamp for this profile
        Set stmtMeta = ##class(%SQL.Statement).%New()
        Set sc = stmtMeta.%Prepare("SELECT COUNT(*) AS total, MAX(CreatedAt) AS latest FROM LEADNorth_CDAProfiler_Sections.CCDDocument WHERE ProfileID=?")
        Continue:$$$ISERR(sc)

        Set rsMeta = stmtMeta.%Execute(profileID)
        Do rsMeta.%Next()
        Set total = rsMeta.%Get("total")
        Set latestTS = rsMeta.%Get("latest")

        // Format timestamp to human-readable string
        Set formattedDate = $ZDT($ZDATETIMEH(latestTS,3), 3)

        // Create an object to hold results for this profile
        Set profileObj = ##class(%DynamicObject).%New()
        Set profileObj.ProfileID = profileID
        Set profileObj.DocumentCount = total
        Set profileObj.LastUpdated = formattedDate
        Set profileObj.Sections = ##class(%DynamicArray).%New()

        // Loop through each section to calculate its presence percentage in the profile's documents
        For i=1:1:$L(sections,",") {
            Set section = $P(sections,",",i)

            // Prepare a query to count how many documents mention this section
            Set qry = "SELECT COUNT(*) AS c FROM LEADNorth_CDAProfiler_Sections.CCDDocument WHERE ProfileID=? AND SectionsPresent LIKE ?"
            Set sqlSection = ##class(%SQL.Statement).%New()
            Set sc = sqlSection.%Prepare(qry)
            Continue:$$$ISERR(sc)

            Set pat = "%" _ section _ "%"
            Set rsSection = sqlSection.%Execute(profileID, pat)
            Do rsSection.%Next()
            Set countSec = rsSection.%Get("c")

            // Compute percentage of documents with this section
            If total > 0 {
                Set pct = $J(countSec*100/total,0,1)
            } Else {
                Set pct = 0
            }

            // Add section stats to the profile object
            Set sectionObj = ##class(%DynamicObject).%New()
            Set sectionObj.SectionName = section
            Set sectionObj.Percentage = pct

            Do profileObj.Sections.%Push(sectionObj)
        }

        // Add this profile's result to the final result array
        Do finalResult.%Push(profileObj)
    }

    // Return final JSON response
    Set %response.Status = ..#HTTP200OK
    Set %response.ContentType = "application/json;charset=UTF-8"
    Write finalResult.%ToJSON()

    Quit $$$OK
}

/// Retrieves the contents of a specific XSLT block (XData) from the CDAParser class.
/// Expects JSON input with "xsltBlock" indicating which XData block to retrieve.
/// Returns the contents of the block as a string, or an error if not found.
ClassMethod GetXSLTContent() As %String
{
    // Read and parse JSON request body
    Set requestBody = %request.Content.Read()
    Set requestObj = {}.%FromJSON(requestBody)

    // Extract requested XData block name
    Set xsltBlock = requestObj.%Get("xsltBlock")

    // Define the class containing the XSLT XData blocks
    Set className = "LEADNorth.CDAProfiler.XSLT.CDAParser"

    // Attempt to open the requested XData block from the class
    Set xdata = ##class(%Dictionary.XDataDefinition).IDKEYOpen(className, xsltBlock)
    If xdata = $$$NULLOREF {
        Quit "XData block not found!"
    }

    // Output the contents of the XData block
    Write xdata.Data.Read()
    Quit $$$OK
}

/// Saves modified XPath content into a specified XSLT block (XData) in the CDAParser class.
/// Expects JSON input with "xsltBlock" and "xpathContent".
/// Updates the in-memory class definition and recompiles it.
ClassMethod SaveXSLTContent() As %Status
{
    // Read and parse JSON request body
    Set requestBody = %request.Content.Read()
    Set requestObj = {}.%FromJSON(requestBody)

    // Extract block name and new XSLT content
    Set xsltBlock = requestObj.%Get("xsltBlock")
    Set xpathContent = requestObj.%Get("xpathContent")

    // Identify the class containing the target XData block
    Set className = "LEADNorth.CDAProfiler.XSLT.CDAParser"

    // Load the XData block definition
    Set xdata = ##class(%Dictionary.XDataDefinition).IDKEYOpen(className, xsltBlock)
    If xdata = $$$NULLOREF {
        Quit "XData block not found!"
    }

    // Clear and overwrite the XData block with new content
    Do xdata.Data.Clear()
    Do xdata.Data.Write(xpathContent)

    // Save the updated class metadata
    Set status = xdata.%Save()
    If $$$ISERR(status) {
        Quit "Failed to save XData!"
    }

    // Recompile the class to apply the updated XData
    Set sc = $SYSTEM.Status.OK()
    Set tInitIO = ##class(%Library.Device).ReDirectIO(1)
    Try {
        $$$THROWONERROR(sc, $SYSTEM.OBJ.Compile(className, "/displaylog=0",,1))
    } Catch(ex) {
        Set sc = ex.AsStatus()
    }
    Do ##class(%Library.Device).ReDirectIO(1)

    If $$$ISERR(sc) {
        Quit "Failed to recompile the class! Error: "_$SYSTEM.Status.GetErrorText(sc)
    }

    Quit $$$OK
}

/// Applies the specified XSLT block to the provided CCD file and returns the transformed output.
/// Expects JSON input with:
/// - "ccdFilePath": absolute path to the CCD file
/// - "xsltBlock": name of the XData block containing the XSLT to apply
/// Returns: The transformed CCD content as HTML in the response body.
ClassMethod ApplyXSLTToCCD() As %Stream.GlobalCharacter
{
    // Parse the request body and extract inputs
    Set requestBody = %request.Content.Read()
    Set requestObj = {}.%FromJSON(requestBody)

    Set ccdFilePath = requestObj.%Get("ccdFilePath")
    Set xsltBlock = requestObj.%Get("xsltBlock")

    // Validate input: fail early if no CCD path is provided
    If ccdFilePath = "" {
        Set %response.Status = ..#HTTP500INTERNALSERVERERROR
        Set %response.ContentType = "text/plain;charset=UTF-8"
        Write "Error: No CCD file path provided."
        Quit $$$OK
    }

    // Attempt to convert CCD XML to a stream using the specified XSLT
    Try {
        Set ccdStream = ##class(LEADNorth.CDAProfiler.CCDProcessor).FileToStream(ccdFilePath, xsltBlock)
    } Catch ex {
        // Handle XSLT application or file load failure
        Set %response.Status = ..#HTTP500INTERNALSERVERERROR
        Set %response.ContentType = "text/plain;charset=UTF-8"
        Write "Error: Exception occurred while processing the CCD file: "_ex.DisplayString()
        Quit 
    }

    // If transformation failed silently
    If ccdStream = "" {
        Set %response.Status = ..#HTTP500INTERNALSERVERERROR
        Set %response.ContentType = "text/plain;charset=UTF-8"
        Write "Error: Failed to load CCD file or apply XSLT."
        Quit $$$OK
    }

    // Read and concatenate the transformed output from the stream
    Set transformedOutput = ccdStream.Read()
    While 'ccdStream.AtEnd {
        Set transformedOutput = transformedOutput _ ccdStream.Read()
    }

    // Return transformed HTML output
    Set %response.Status = ..#HTTP200OK
    Set %response.ContentType = "text/html;charset=UTF-8"
    Write transformedOutput

    Quit $$$OK
}

/// Populates an HTML <select> dropdown with all distinct ProfileIDs found in CCDDocument.
/// Returns HTML <option> elements as the response body.
ClassMethod PopulateProfileIDs() As %String
{
    // Prepare the SQL query to get all unique ProfileIDs
    Set query = "SELECT DISTINCT ProfileID FROM LEADNorth_CDAProfiler_Sections.CCDDocument"
    Set statement = ##class(%SQL.Statement).%New()
    Set status = statement.%Prepare(query)

    // Exit early with error message if query fails to prepare
    If $$$ISERR(status) {
        Return "Error: Could not retrieve ProfileIDs."
    }

    // Execute the query and build the HTML <option> list
    Set resultSet = statement.%Execute()
    Set html = ""

    While resultSet.%Next() {
        Set profileID = resultSet.%Get("ProfileID")
        Set html = html _ "<option value='"_profileID_"'>" _ profileID _ "</option>"
    }

    // Set response content type and status
    Set %response.Status = ..#HTTP200OK
    Set %response.ContentType = "text/html"

    // Output the generated HTML
    Write html
    Quit $$$OK
}

/// Deletes all section data associated with the specified ProfileID across all CCD-related tables.
/// Expects a JSON body with a "profileID" field.
/// Returns a success or error message as plain text or JSON.
ClassMethod DeleteDataByProfile() As %Status
{
    // Read and parse the incoming request body
    Set requestBody = %request.Content.Read()
    Set requestObj = {}.%FromJSON(requestBody)

    // Extract the ProfileID from the request
    Set profileID = requestObj.%Get("profileID")

    Try {
        // Escape single quotes to prevent SQL issues (extra safe even with :param binding)
        Set profileID = $Replace(profileID, "'", "''")

        // Delete the profile's data from every section-specific table
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

        // Respond with a success message
        Set %response.ContentType = "application/json;charset=UTF-8"
        Set %response.Status = ..#HTTP200OK
        Write "Successfully deleted data for profile id '"_profileID_"'"

    } Catch ex {
        // Catch any exceptions and return error message
        Set errorMessage = "Error deleting data for ProfileID: "_profileID_" - "_ex.DisplayString()
        Set %response.ContentType = "text/plain;charset=UTF-8"
        Set %response.Status = ..#HTTP500INTERNALSERVERERROR
        Write errorMessage
        Quit
    }

    Quit $$$OK
}

/// Deletes all data from all CCD-related section tables in the system.
/// Intended for administrative use — this action is irreversible and removes all profiled documents.
ClassMethod DeleteAllData() As %Status
{
    Try {
        // Execute SQL DELETE on every section-specific table
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

        // Set response indicating success
        Set %response.ContentType = "application/json;charset=UTF-8"
        Set %response.Status = ..#HTTP200OK
        Write "All data deleted successfully"
    } Catch ex {
        // Catch and return any exceptions encountered during deletion
        Set errorMessage = "Error deleting data"_ex.DisplayString()
        Set %response.ContentType = "text/plain;charset=UTF-8"
        Set %response.Status = ..#HTTP500INTERNALSERVERERROR
        Write errorMessage
        Quit
    }

    Quit $$$OK
}

/// Generates an Excel-compatible XML spreadsheet containing profiling data for a given ProfileID.
/// Sections are specified via JSON input and rendered as individual worksheets.
/// Supports optional PHI redaction via the "deIdentify" flag.
ClassMethod GenerateExcelReport() As %String
{
    // Create a new character stream to accumulate the Excel XML content
    Set stream = ##class(%Stream.GlobalCharacter).%New()

    // Parse JSON request body and extract parameters
    Set requestBody = %request.Content.Read()
    Set requestObj = {}.%FromJSON(requestBody)

    Set profileID = requestObj.%Get("profileID")
    Set deIdentify = requestObj.%Get("deIdentify")
    Set sectionsString = requestObj.%Get("sections")

    // Ensure "metadata" section is always included at the beginning
    If sectionsString = "" {
        Set sectionsString = "patient,encompassingEncounter,encounters,metadata,advanceDirective,allergy,diagnosis,familyHistory,functionalStatus,goals,implants,immunizations,medications,payer,planOfCare,problems,procedures,results,socialHistory,vitalSigns"
    } Else {
        Set sectionsString = "metadata,"_sectionsString
    }

    // Write Excel-compatible XML headers and namespace declarations
    Do stream.Write("<?xml version=""1.0""?>")
    Do stream.Write("<?mso-application progid=""Excel.Sheet""?>")
    Do stream.Write("<Workbook xmlns=""urn:schemas-microsoft-com:office:spreadsheet"" ")
    Do stream.Write("xmlns:o=""urn:schemas-microsoft-com:office:office"" ")
    Do stream.Write("xmlns:x=""urn:schemas-microsoft-com:office:excel"" ")
    Do stream.Write("xmlns:ss=""urn:schemas-microsoft-com:office:spreadsheet"" ")
    Do stream.Write("xmlns:html=""http://www.w3.org/TR/REC-html40"">")

    // Loop through each requested section and append a worksheet to the stream
    For i=1:1:$Length(sectionsString,",") {
        Set reportType = $Piece(sectionsString,",",i)

        // Generate the XML for the current worksheet
        Set sheetXML = ..GenerateWorksheetXML(reportType, profileID, deIdentify)
        If sheetXML'="" {
            // Write the worksheet content to the main stream
            While 'sheetXML.AtEnd {
                Set sheetChunk = sheetXML.Read(8192)
                Do stream.Write(sheetChunk)
            }
        }
    }

    // Close the workbook tag
    Do stream.Write("</Workbook>")

    // Prepare HTTP response headers
    Set %response.Status = ..#HTTP200OK
    Set %response.ContentType = "application/vnd.ms-excel;charset=utf-8"

    // Rewind stream and write entire Excel document to the response
    Do stream.Rewind()
    While 'stream.AtEnd {
        Set chunk = stream.Read(8192)
        Write chunk
    }

    Quit $$$OK
}

/// Used to generate excel sheet
ClassMethod GenerateWorksheetXML(reportType As %String, profileID As %String, deIdentify As %Boolean) As %Stream.GlobalCharacter
{
    // Initialize default variables
    Set fields = ""
    Set tableName = ""
    
    // List of fields considered PHI (to redact if deIdentify = true)
    Set phiFields = "PatientMRN,FirstName,LastName,DOB,Address,City,State,ZipCode,PhoneNumber,Email,PolicyNumber,MemberID,RelativePerson,PatientID,SerialNumber"

    // Determine which fields, table, and XSLT block to use based on reportType
    // Each block maps the reportType to table structure and XSLT name
    If reportType = "encounters" {
    	Set fields = "EncounterNumber,ReasonForVisit,VisitDescription,DischargeDisposition,EncounterTypeDisplayName,EncounterTypeCode,EncounterTypeCodeSystem,EncounterTypeCodeSystemName,StatusCode,StartDateTime,EndDateTime,FacilityName,FacilityIDAAName,FacilityIDExtension,FacilityIDRoot,PerformerID,PerformerAddress,PerformerTelecom,PerformerName,AuthorTime,LocationID,LocationAddress,LocationTelecom,LocationName"
    	Set tableName = "LEADNorth_CDAProfiler_Sections.CCDEncounter"
    	Set xsltBlock = "EncounterXSLT"
	} ElseIf reportType = "vitalSigns" {
	    Set fields = "Value,Unit,Description,xDate,AuthorTime,ObservationCode,ObservationCodeSystem,ObservationDisplayName,ObservationStatusCode,ObservationEffectiveTimeLow,ObservationEffectiveTimeHigh,ObservationIDRoot,ObservationIDExtension,OrganizerCode,OrganizerCodeSystem,OrganizerEffectiveTimeLow,OrganizerEffectiveTimeHigh,OrganizerClassCode,OrganizerDisplayName,OrganizerStatusCode"
	    Set tableName = "LEADNorth_CDAProfiler_Sections.CCDVitalSign"
	    Set xsltBlock = "VitalSignsXSLT"
	} ElseIf reportType = "allergy" {
	    Set fields = "AllergyCode,AllergyCodeSystem,AllergyCodeSystemName,AllergyDisplayName,CategoryCode,CategoryCodeSystem,CategoryCodeSystemName,CategoryDisplayName,ReactionCode,ReactionCodeSystem,ReactionCodeSystemName,ReactionDisplayName,SeverityCode,SeverityCodeSystem,SeverityCodeName,SeverityDisplayName,StatusCode,StatusCodeSystem,StatusCodeSystemName,StatusDisplayName,EffectiveTimeLow,EffectiveTimeHigh,ObservationCode,ObservationCodeSystem,ObservationDisplayName,ObservationStatusCode,ObservationEffectiveTimeLow,ObservationEffectiveTimeHigh,RepresentedOrganization,ReferenceAllergyId,ReferenceReactionId,ReferenceSeverityId,ReferenceStatusId"
	    Set tableName = "LEADNorth_CDAProfiler_Sections.CCDAllergy"
	    Set xsltBlock = "AllergyXSLT"
	} ElseIf reportType = "procedures" {
	    Set fields = "ProcedureCode,CodeSystem,CodeSystemName,CodeDisplayName,AuthorTime,Status,EffectiveTimeLow,EffectiveTimeHigh,PerformerID,PerformerName,PerformerOrganization,PerformerAddress,ProcedureClassCode"
	    Set tableName = "LEADNorth_CDAProfiler_Sections.CCDProcedure"
	    Set xsltBlock = "ProceduresXSLT"
	} ElseIf reportType = "socialHistory" {
	    Set fields = "SocialHistoryID,ConceptDescription,ObservationCode,ObservationCodeSystem,ObservationCodeSystemName,ObservationDisplayName,ValueCode,ValueCodeSystem,ValueCodeSystemName,ValueDisplayName,Units,AuthorTime,StatusCode,EffectiveTimeLow,EffectiveTimeHigh"
	    Set tableName = "LEADNorth_CDAProfiler_Sections.CCDSocialHistory"
	    Set xsltBlock = "SocialHistoryXSLT"
	} ElseIf reportType = "results" {
	    Set fields = "TestValue,Units,ReferenceRange,StatusCode,ObservationCode,ObservationCodeDisplayName,ObservationCodeSystem,ObservationCodeSystemName,AuthorTime,OrganizerID,OrganizerName,EffectiveTimeLow,EffectiveTimeHigh"
	    Set tableName = "LEADNorth_CDAProfiler_Sections.CCDResult"
	    Set xsltBlock = "ResultsXSLT"
	} ElseIf reportType = "problems" {
	    Set fields = "ValueCode,ValueDisplayName,CodeSystem,CodeSystemName,AuthorTime,Author,ProblemTypeCode,ProblemTypeName,StatusCode,EffectiveTimeLow,EffectiveTimeHigh,ProblemClassCode"
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
	} ElseIf reportType = "metadata" {
	    Set fields = "AllSections,SectionsWithEncounterNumbers"
	    Set tableName = "LEADNorth_CDAProfiler_Sections.CCDDocument"
	    Set xsltBlock = "MetadataXSLT"
	}
	 Else {
        Return "" 
    }
     // Start building the Excel worksheet XML
    Set xml = ##class(%Stream.GlobalCharacter).%New()
    Do xml.Write("<Worksheet ss:Name="""_reportType_""">")
    Do xml.Write("<Table>")

    // Write the header row
    Do xml.Write("<Row>")
    Do xml.Write("<Cell><Data ss:Type=""String"">Field</Data></Cell>")
    Do xml.Write("<Cell><Data ss:Type=""String"">Value</Data></Cell>")
    Do xml.Write("<Cell><Data ss:Type=""String"">Occurrences</Data></Cell>")
    Do xml.Write("<Cell><Data ss:Type=""String"">XPath</Data></Cell>")
    Do xml.Write("</Row>")

    // Loop through each field in the section
    For j=1:1:$L(fields,",") {
        Set field = $ZStrip($P(fields,",",j),"*W")

        // Query: Count distinct values for this field across documents
        Set queryString = "SELECT "_field_" AS Value, COUNT(*) AS Occurrences FROM "_tableName_" WHERE ProfileID = ? GROUP BY "_field
        Set statement = ##class(%SQL.Statement).%New()
        Set status = statement.%Prepare(queryString)
        If $$$ISERR(status) Continue
        Set resultSet = statement.%Execute(profileID)
        If $$$ISERR(resultSet) Continue

        // Iterate over results (each distinct value of the field)
        While resultSet.%Next() {
            Set value = resultSet.%Get("Value")
            Set occurrences = resultSet.%Get("Occurrences")

            // Lookup XPath mapping for the current field from XSLT mapping utility
            Set xPath = $classmethod("LEADNorth.CDAProfiler.Utils.Mappings", "GetXPathForProperty", field, xsltBlock)

            // Mask value if it is PHI and de-identification is enabled
            If (deIdentify) && (phiFields [ field) {
                Set value = "CONFIDENTIAL"
            }

            // Special case for "AllSections" field: call GetUniqueSections()
            If field '="AllSections" {
                // Output regular row
                Do xml.Write("<Row>")
                Do xml.Write("<Cell><Data ss:Type=""String"">"_..EncodeXML(field)_"</Data></Cell>")
                Do xml.Write("<Cell><Data ss:Type=""String"">"_..EncodeXML(value)_"</Data></Cell>")
                Do xml.Write("<Cell><Data ss:Type=""Number"">"_occurrences_"</Data></Cell>")
                Do xml.Write("<Cell><Data ss:Type=""String"">"_..EncodeXML(xPath)_"</Data></Cell>")
                Do xml.Write("</Row>")
            } Else {
                // Output "AllSections" as a single-row override with GetUniqueSections result
                Do xml.Write("<Row>")
                Do xml.Write("<Cell><Data ss:Type=""String"">"_..EncodeXML(field)_"</Data></Cell>")
                Do xml.Write("<Cell><Data ss:Type=""String"">"_..EncodeXML(##class(LEADNorth.CDAProfiler.Sections.CCDDocument).GetUniqueSections(profileID))_"</Data></Cell>")
                Do xml.Write("<Cell><Data ss:Type=""Number"">N/A</Data></Cell>")
                Do xml.Write("<Cell><Data ss:Type=""String"">N/A</Data></Cell>")
                Do xml.Write("</Row>")
                Quit  // Exit early after writing "AllSections" (avoid duplicates)
            }
        }
    }

    // Close the worksheet table
    Do xml.Write("</Table></Worksheet>")

    Quit xml
}

/// Helper method
ClassMethod EncodeXML(value As %String) As %String
{
    Set value = $Replace(value, "&", "&amp;")
    Set value = $Replace(value, "<", "&lt;")
    Set value = $Replace(value, ">", "&gt;")
    Set value = $Replace(value, """", "&quot;")
    Set value = $Replace(value, "'", "&apos;")
    Quit value
}

/// Retrieves all distinct ProfileIDs from CCDDocument and returns them as HTML <option> elements.
/// Used to populate dropdowns on the reports page.
ClassMethod GetDistinctReportProfileIDs() As %Status
{
    // Prepare SQL query to retrieve distinct ProfileIDs
    Set query = "SELECT DISTINCT ProfileID FROM LEADNorth_CDAProfiler_Sections.CCDDocument"
    Set statement = ##class(%SQL.Statement).%New()
    Set status = statement.%Prepare(query)

    // If query preparation fails, return an error option in the HTML
    If $$$ISERR(status) {
        Set %response.Status = ..#HTTP500INTERNALSERVERERROR
        Set %response.ContentType = "text/html"
        Write "<option value=''>Error retrieving profiles</option>"
        Quit $$$OK
    }

    // Execute the query
    Set resultSet = statement.%Execute()
    Set html = ""

    // Build the list of HTML <option> elements for each profile
    While resultSet.%Next() {
        Set profileID = resultSet.%Get("ProfileID")
        Set html = html _ "<option value="""_profileID_""">" _ profileID _ "</option>"
    }

    // Return the HTML content in the response
    Set %response.Status = ..#HTTP200OK
    Set %response.ContentType = "text/html"
    Write html

    Quit $$$OK
}

/// Gets all data for a profiling report and renders it
ClassMethod FetchAndRender() As %String
{
	// Parse incoming request
    Set requestBody = %request.Content.Read()
    Set requestObj = {}.%FromJSON(requestBody)

    Set reportType = requestObj.%Get("reportType")
    Set profileID = requestObj.%Get("profileID")

    // Initialize HTML response body
    Set html = ""

    // Determine which fields to include based on reportType
    If reportType = "encounters" {
        Set fields = "EncounterNumber,ReasonForVisit,VisitDescription,DischargeDisposition,EncounterTypeDisplayName,EncounterTypeCode,EncounterTypeCodeSystem,EncounterTypeCodeSystemName,StatusCode,StartDateTime,EndDateTime,FacilityName,FacilityIDAAName,FacilityIDExtension,FacilityIDRoot,PerformerID,PerformerAddress,PerformerTelecom,PerformerName,AuthorTime,LocationID,LocationAddress,LocationTelecom,LocationName"
    } ElseIf reportType = "vitalSigns" {
        Set fields = "Value,Unit,Description,xDate,AuthorTime,ObservationCode,ObservationCodeSystem,ObservationDisplayName,ObservationStatusCode,ObservationEffectiveTimeLow,ObservationEffectiveTimeHigh,ObservationIDRoot,ObservationIDExtension,OrganizerCode,OrganizerCodeSystem,OrganizerEffectiveTimeLow,OrganizerEffectiveTimeHigh,OrganizerClassCode,OrganizerDisplayName,OrganizerStatusCode"
    } ElseIf reportType = "allergy" {
        Set fields = "AllergyCode,AllergyCodeSystem,AllergyCodeSystemName,AllergyDisplayName,CategoryCode,CategoryCodeSystem,CategoryCodeSystemName,CategoryDisplayName,ReactionCode,ReactionCodeSystem,ReactionCodeSystemName,ReactionDisplayName,SeverityCode,SeverityCodeSystem,SeverityCodeName,SeverityDisplayName,StatusCode,StatusCodeSystem,StatusCodeSystemName,StatusDisplayName,EffectiveTimeLow,EffectiveTimeHigh,ObservationCode,ObservationCodeSystem,ObservationDisplayName,ObservationStatusCode,ObservationEffectiveTimeLow,ObservationEffectiveTimeHigh,RepresentedOrganization,ReferenceAllergyId,ReferenceReactionId,ReferenceSeverityId,ReferenceStatusId"
    } ElseIf reportType = "procedures" {
        Set fields = "ProcedureCode,CodeSystem,CodeSystemName,CodeDisplayName,AuthorTime,Status,EffectiveTimeLow,EffectiveTimeHigh,PerformerID,PerformerName,PerformerOrganization,PerformerAddress,ProcedureClassCode"
    } ElseIf reportType = "socialHistory" {
        Set fields = "SocialHistoryID,ConceptDescription,ObservationCode,ObservationCodeSystem,ObservationCodeSystemName,ObservationDisplayName,ValueCode,ValueCodeSystem,ValueCodeSystemName,ValueDisplayName,Units,AuthorTime,StatusCode,EffectiveTimeLow,EffectiveTimeHigh"
    } ElseIf reportType = "results" {
        Set fields = "TestValue,Units,ReferenceRange,StatusCode,ObservationCode,ObservationCodeDisplayName,ObservationCodeSystem,ObservationCodeSystemName,AuthorTime,OrganizerID,OrganizerName,EffectiveTimeLow,EffectiveTimeHigh"
    } ElseIf reportType = "problems" {
        Set fields = "ValueCode,ValueDisplayName,CodeSystem,CodeSystemName,AuthorTime,Author,ProblemTypeCode,ProblemTypeName,StatusCode,EffectiveTimeLow,EffectiveTimeHigh,ProblemClassCode"
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
    } ElseIf reportType = "documents" {
        Set fields = "DocumentID,PatientID,DocumentDate,CreatedAt"
    } ElseIf reportType = "advanceDirective" {
        Set fields = "DirectiveType,DateSigned,StatusCode,DirectiveID"
    } ElseIf reportType = "goals" {
        Set fields = "GoalID,GoalDescription,GoalCode,GoalCodeSystem,GoalCodeSystemName,GoalStatus,StartDate,EndDate,AuthorTime,AuthorName"
    } ElseIf reportType = "implants" {
        Set fields = "ImplantID,DeviceName,DeviceCode,DeviceCodeSystem,DeviceCodeSystemName,ManufacturerModelName,SerialNumber,ImplantStatus,ImplantDate,RemovalDate,AuthorTime"
    } ElseIf reportType = "encompassingEncounter" {
        Set fields = "EncounterID,EncounterTypeDisplayName,EncounterTypeCode,EncounterTypeCodeSystem,EncounterTypeCodeSystemName,StartDateTime,EndDateTime,DischargeDisposition,LocationID,LocationName,LocationAddress,LocationTelecom"
    } ElseIf reportType = "diagnosis" {
        Set fields = "DiagnosisID,DiagnosisTypeCode,DiagnosisTypeCodeSystem,DiagnosisTypeCodeSystemName,DiagnosisTypeDisplayName,DiagnosisEffectiveTimeLow,DiagnosisEffectiveTimeHigh,DiagnosisCode,DiagnosisCodeSystem,DiagnosisCodeSystemName,DiagnosisCodeDisplayName,DiagnosisStatusCode,DiagnosisEncounterNumber"
    } ElseIf reportType = "allSections" {
        Set fields = "AllSections,SectionsWithEncounterNumbers"
    }

    Set html = ""
	
	// Loop through fields and generate collapsible sections
    For i=1:1:$Length(fields, ",") {
        Set field = $ZStrip($Piece(fields, ",", i), "*W") 
		if field '= "AllSections" {
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
        	// Iterate through results
	        While resultSet.%Next() {
		        if field = "AllSections" {
			        Set value = ##class(LEADNorth.CDAProfiler.Sections.CCDDocument).GetUniqueSections(profileID)
					Set html = html _ "<tr><td>" _ value _ "</td><td>" _ "1" _ "</td><td>" _"N/A"_ "</td></tr>"
					Quit
		        } elseif field '= "AllSections" {
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
		   		if field '= "SectionsWithEncounterNumbers" {
		   			Set html = html _ "<tr><td>" _ value _ "</td><td>" _ occurrences _ "</td><td>" _ xPath _ "</td></tr>"
		        } else {
			        Set html = html _ "<tr><td>" _ value _ "</td><td>" _ occurrences _ "</td><td>" _ "N/A" _ "</td></tr>"
		        }
		        }
	        }
	        Set html = html _ "</table></div>"
        
    }
    Set %response.Status = ..#HTTP200OK
    Set %response.ContentType = "text/html"
    Write html
    Quit $$$OK
}

/// Helper method
ClassMethod EncodeHTML(value As %String) As %String
{
    Set value = $Replace(value, "&", "&amp;")
    Set value = $Replace(value, "<", "&lt;")
    Set value = $Replace(value, ">", "&gt;")
    Set value = $Replace(value, """", "&quot;")
    Set value = $Replace(value, "'", "&#39;")
    Quit value
}

/// Processes all .xml CCD files in a given directory using the CCDProcessor class.
/// - directory: path containing the CCD XML files
/// - profileID: the profile ID to assign to all processed documents
/// - sections: a comma-separated list of sections to extract
/// Returns a %Status indicating success or failure.
ClassMethod ProcessCCDDirectory(directory As %String, profileID As %String, sections As %String) As %Status
{
    // Check if the directory exists
    If ##class(%File).DirectoryExists(directory) = 0 {
        Return $$$ERROR($$$GeneralError, "Directory does not exist: "_directory)
    }

    // First pass: count how many XML files are in the directory
    Set resultSet = ##class(%ResultSet).%New("%File:FileSet")
    Set sc = resultSet.Execute(directory, "*.xml")
    If $$$ISERR(sc) {
        Write "ERROR: Failed to retrieve file list from directory: ", directory, !
        Quit sc
    }

    Set fileCount = 0
    While resultSet.%Next() {
        Set fileCount = fileCount + 1
    }

    // Exit if there are no XML files to process
    If fileCount = 0 {
        Return $$$ERROR($$$GeneralError, "No XML files found in directory: "_directory)
    }

    // Second pass: process each XML file individually
    Set resultSet = ##class(%ResultSet).%New("%File:FileSet")
    Set sc = resultSet.Execute(directory, "*.xml")
    If $$$ISERR(sc) {
        Write "ERROR: Failed to reopen file list: ", directory, !
        Quit sc
    }

    Set currentIndex = 0

    While resultSet.%Next() {
        Set currentIndex = currentIndex + 1
        Set fileName = resultSet.Data("Name")
        Set fullPath = ##class(%File).NormalizeFilename(fileName, directory)

        // Skip missing files (edge case)
        If ##class(%File).Exists(fullPath) = 0 {
            Write "ERROR: File not found: ", fullPath, !
            Continue
        }

        Try {
            // Profile the CCD using the designated processor
            Set sc = ##class(LEADNorth.CDAProfiler.CCDProcessor).ProcessCCD(fullPath, profileID, sections)

            If $$$ISOK(sc) {
                Write "PROGRESS:", currentIndex, "/", fileCount, !
            } Else {
                Write "ERROR processing file: ", fullPath, !
                Do $System.Status.DisplayError(sc)
            }
        } Catch ex {
            // Catch and report any exception raised during processing
            Write "EXCEPTION processing file: ", fullPath, !
            Do $System.Status.DisplayError(ex.AsStatus())
        }
    }

    Write "Successfully profiled directory", !

    Quit sc
}

/// Handles importing CCD documents via various methods:
/// - "bulk": from a directory
/// - "api": from a list of uploaded files
/// - "database": from internal storage (most recent N docs)
/// Expects a JSON body with keys: importType, profileID, selectedSections, etc.
/// Returns an HTTP status and message in the response.
ClassMethod ProcessImport() As %Status
{
    // Read and parse the incoming JSON request body
    Set requestBody = %request.Content.Read()
    Set requestObj = {}.%FromJSON(requestBody)

    // Extract parameters with defaults
    Set importType = requestObj.%Get("importType", "")
    Set profileID = requestObj.%Get("profileID", "")
    Set numDocuments = requestObj.%Get("numDocuments", 0)
    Set filterDocuments = requestObj.%Get("filterDocuments", "")
    Set importData = requestObj.%Get("directoryPath", "")
    Set sections = requestObj.%Get("selectedSections")

    // Response wrapper object to hold messages
    Set responseObj = {}

    Try {
        // Case: bulk directory import
        If importType = "bulk" {
            Set directoryPath = importData
            Set sc = ..ProcessCCDDirectory(directoryPath, profileID, sections)
            If $$$ISERR(sc) {
                Set responseObj.message = "Bulk import failed."
                Set %response.Status = ..#HTTP500INTERNALSERVERERROR
            } Else {
                Set responseObj.message = "Bulk import completed successfully."
                Set %response.Status = ..#HTTP200OK
            }

        // Case: API upload (direct file list)
        } ElseIf importType = "api" {
            Set filesArray = requestObj.%Get("files")
            If '$IsObject(filesArray) {
                Set responseObj.message = "Invalid file input."
                Set %response.Status = ..#HTTP400BADREQUEST
            } Else {
                Set i = ""
                While filesArray.GetNext(i) {
                    Set fileName = filesArray.GetAt(i)
                    Set sc = ##class(LEADNorth.CDAProfiler.CCDProcessor).ProcessCCD(fileName, profileID, sections)
                    If $$$ISERR(sc) {
                        Set responseObj.message = "API import failed."
                        Set %response.Status = ..#HTTP500INTERNALSERVERERROR
                        Quit
                    }
                }
                // If no error message set, assume success
                If '$Data(responseObj.message) {
                    Set responseObj.message = "API import completed successfully."
                    Set %response.Status = ..#HTTP200OK
                }
            }

        // Case: pull CCDs from database (internal storage)
        } ElseIf importType = "database" {
            If numDocuments <= 0 {
                Set responseObj.message = "Invalid number of documents specified."
                Set %response.Status = ..#HTTP400BADREQUEST
            } Else {
                Set sc = ##class(LEADNorth.CDAProfiler.CCDProcessor).ProcessLatestCCDs(numDocuments, profileID, filterDocuments, sections)
                If $$$ISERR(sc) {
                    Set responseObj.message = "Database import failed."
                    Set %response.Status = ..#HTTP500INTERNALSERVERERROR
                } Else {
                    Set responseObj.message = "Database import completed successfully."
                    Set %response.Status = ..#HTTP200OK
                }
            }

        // Catch unknown import type
        } Else {
            Set responseObj.message = "Invalid import type."
            Set %response.Status = ..#HTTP400BADREQUEST
        }

    // Catch all exceptions and return error
    } Catch ex {
        Set responseObj.message = "An error occurred during import: "_ex.DisplayString()
        Set %response.Status = ..#HTTP500INTERNALSERVERERROR
    }

    // Note: You may want to return a JSON response here instead of relying only on status
    Quit sc
}

/// Retrieves the most recent CreatedAt timestamp for each ProfileID,
/// and generates an HTML list of links to view corresponding reports.
/// Used to populate the home page with available profiling reports.
ClassMethod GetDistinctProfileIDs() As %String
{
    // SQL query to get latest CreatedAt date for each ProfileID
    Set query = "SELECT ProfileID, MAX(CreatedAt) AS CreatedAt FROM LEADNorth_CDAProfiler_Sections.CCDDocument GROUP BY ProfileID"

    // Prepare the SQL statement
    Set statement = ##class(%SQL.Statement).%New()
    Set status = statement.%Prepare(query)

    // Exit with error message if preparation fails
    If $$$ISERR(status) {
        Return "Error preparing statement: "_$System.Status.GetErrorText(status)
    }

    // Execute the statement and build the HTML output
    Set resultSet = statement.%Execute()
    Set html = ""

    While resultSet.%Next() {
        Set profileID = resultSet.%Get("ProfileID")
        Set reportDate = resultSet.%Get("CreatedAt")

        // Append an HTML <li> link to the profile report
        Set html = html _ "<li><a href='index.html#/reports?profileID="_profileID_"'>Report for Profile "_profileID_" - Generated on "_reportDate_"</a></li>"
    }

    // Output the generated HTML
    Write html
    Quit $$$OK
}

/// Method to help troubleshoot connectivity if necessary
ClassMethod Hello() As %Status
{
    Write "Hello from IRIS!"
    Quit $$$OK
}

}
