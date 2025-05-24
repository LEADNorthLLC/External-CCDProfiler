Class LEADNorth.CDAProfiler.CCDProcessor
{

/// Processes all .xml CCD files in a directory by invoking the CCD processor.
/// Returns an error if the directory is invalid or no XML files are found.
ClassMethod ProcessCCDDirectory(directory As %String, profileID As %String, sections As %String) As %Status
{
    // Check if the provided directory exists
    If ##class(%File).DirectoryExists(directory)'=1 {
        Write "ERROR: Directory does not exist: ", directory, !
        Quit $$$ERROR($$$GeneralError, "Directory does not exist: "_directory)
    }

    // Get initial file list to count XML files
    Set resultSet = ##class(%ResultSet).%New("%File:FileSet")
    Set sc = resultSet.Execute(directory, "*.xml")
    If $$$ISERR(sc) {
        Write "ERROR: Failed to retrieve file list from directory: ", directory, !
        Quit sc
    }

    // Count files to validate presence
    Set fileCount = 0
    While resultSet.%Next() {
        Set fileCount = fileCount + 1
    }

    If fileCount = 0 {
        Write "INFO: No XML files found in directory: ", directory, !
        Quit $$$OK
    }

    // Reopen the file list for actual processing
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

        // Check if file still exists
        If ##class(%File).Exists(fullPath)'=1 {
            Write "WARNING: File not found (skipped): ", fullPath, !
            Continue
        }

        // Attempt to process the file
        Try {
            Set sc = ..ProcessCCD(fullPath, profileID, sections)
            If $$$ISOK(sc) {
                Write "PROGRESS: Processed ", currentIndex, " of ", fileCount, ": ", fileName, !
            } Else {
                Write "ERROR: Failed to process file: ", fullPath, !
                Do $System.Status.DisplayError(sc)
            }
        } Catch ex {
            Write "EXCEPTION: Error while processing file: ", fullPath, !
            Do $System.Status.DisplayError(ex.AsStatus())
        }
    }

    Write "INFO: All eligible files in directory processed.", !
    Quit $$$OK
}

ClassMethod ProcessCCD(ccdFilePath As %String, profileID As %String, sections As %String) As %Status
{
    Set status = $$$OK

    // Process Metadata first
    Set docXml = ..FileToStream(ccdFilePath, "MetadataXSLT")
    If docXml = "" {
        Write "XSLT transformation failed. No XML output generated.", !
        Quit $$$ERROR($$$GeneralError, "XSLT transformation failed.")
    }

    Set documentIDnumber = ""
    Set docStatus = ##class(LEADNorth.CDAProfiler.Utils.DBInsert).InsertDocumentMetadata(docXml, .documentIDnumber, profileID)
    If $$$ISERR(docStatus) {
        Write "Error saving document metadata", !
        Quit docStatus
    }

    // Selectively process based on 'sections'
    If sections["allergy" {
	    //write "HELLO"
        Set allergyXml = ..FileToStream(ccdFilePath, "AllergyXSLT")
        If allergyXml = "" Quit $$$ERROR($$$GeneralError, "XSLT transformation failed for allergies.")
        Set sc = ##class(LEADNorth.CDAProfiler.Utils.DBInsert).InsertAllergyData(allergyXml, documentIDnumber, profileID)
        If $$$ISERR(sc) Set status = sc
    }

    If sections["medications" {
        Set medicationsXml = ..FileToStream(ccdFilePath, "MedicationsXSLT")
        If medicationsXml = "" Quit $$$ERROR($$$GeneralError, "XSLT transformation failed for medications.")
        Set sc = ##class(LEADNorth.CDAProfiler.Utils.DBInsert).InsertMedicationData(medicationsXml, documentIDnumber, profileID)
        If $$$ISERR(sc) Set status = sc
    }

    If sections["problems" {
        Set problemsXml = ..FileToStream(ccdFilePath, "ProblemsXSLT")
        If problemsXml = "" Quit $$$ERROR($$$GeneralError, "XSLT transformation failed for problems.")
        Set sc = ##class(LEADNorth.CDAProfiler.Utils.DBInsert).InsertProblemsData(problemsXml, documentIDnumber, profileID)
        If $$$ISERR(sc) Set status = sc
    }

    If sections["procedures" {
        Set proceduresXml = ..FileToStream(ccdFilePath, "ProceduresXSLT")
        If proceduresXml = "" Quit $$$ERROR($$$GeneralError, "XSLT transformation failed for procedures.")
        Set sc = ##class(LEADNorth.CDAProfiler.Utils.DBInsert).InsertProceduresData(proceduresXml, documentIDnumber, profileID)
        If $$$ISERR(sc) Set status = sc
    }

    If sections["results" {
        Set resultsXml = ..FileToStream(ccdFilePath, "ResultsXSLT")
        If resultsXml = "" Quit $$$ERROR($$$GeneralError, "XSLT transformation failed for results.")
        Set sc = ##class(LEADNorth.CDAProfiler.Utils.DBInsert).InsertResultsData(resultsXml, documentIDnumber, profileID)
        If $$$ISERR(sc) Set status = sc
    }

    If sections["vitalSigns" {
        Set vitalSignsXml = ..FileToStream(ccdFilePath, "VitalSignsXSLT")
        If vitalSignsXml = "" Quit $$$ERROR($$$GeneralError, "XSLT transformation failed for vital signs.")
        Set sc = ##class(LEADNorth.CDAProfiler.Utils.DBInsert).InsertVitalSignsData(vitalSignsXml, documentIDnumber, profileID)
        If $$$ISERR(sc) Set status = sc
    }

    If sections["immunizations" {
        Set immunizationsXml = ..FileToStream(ccdFilePath, "ImmunizationsXSLT")
        If immunizationsXml = "" Quit $$$ERROR($$$GeneralError, "XSLT transformation failed for immunizations.")
        Set sc = ##class(LEADNorth.CDAProfiler.Utils.DBInsert).InsertImmunizationData(immunizationsXml, documentIDnumber, profileID)
        If $$$ISERR(sc) Set status = sc
    }

    If sections["planOfCare" {
        Set planOfCareXml = ..FileToStream(ccdFilePath, "PlanOfCareXSLT")
        If planOfCareXml = "" Quit $$$ERROR($$$GeneralError, "XSLT transformation failed for plan of care.")
        Set sc = ##class(LEADNorth.CDAProfiler.Utils.DBInsert).InsertPlanOfCareData(planOfCareXml, documentIDnumber, profileID)
        If $$$ISERR(sc) Set status = sc
    }

    If sections["socialHistory" {
        Set socialHistoryXml = ..FileToStream(ccdFilePath, "SocialHistoryXSLT")
        If socialHistoryXml = "" Quit $$$ERROR($$$GeneralError, "XSLT transformation failed for social history.")
        Set sc = ##class(LEADNorth.CDAProfiler.Utils.DBInsert).InsertSocialHistoryData(socialHistoryXml, documentIDnumber, profileID)
        If $$$ISERR(sc) Set status = sc
    }

    If sections["functionalStatus" {
        Set functionalStatusXml = ..FileToStream(ccdFilePath, "FunctionalStatusXSLT")
        If functionalStatusXml = "" Quit $$$ERROR($$$GeneralError, "XSLT transformation failed for functional status.")
        Set sc = ##class(LEADNorth.CDAProfiler.Utils.DBInsert).InsertFunctionalStatusData(functionalStatusXml, documentIDnumber, profileID)
        If $$$ISERR(sc) Set status = sc
    }

    If sections["familyHistory" {
        Set familyHistoryXml = ..FileToStream(ccdFilePath, "FamilyHistoryXSLT")
        If familyHistoryXml = "" Quit $$$ERROR($$$GeneralError, "XSLT transformation failed for family history.")
        Set sc = ##class(LEADNorth.CDAProfiler.Utils.DBInsert).InsertFamilyHistoryData(familyHistoryXml, documentIDnumber, profileID)
        If $$$ISERR(sc) Set status = sc
    }

    If sections["advanceDirective" {
        Set advanceDirectiveXml = ..FileToStream(ccdFilePath, "AdvanceDirectiveXSLT")
        If advanceDirectiveXml = "" Quit $$$ERROR($$$GeneralError, "XSLT transformation failed for advance directives.")
        Set sc = ##class(LEADNorth.CDAProfiler.Utils.DBInsert).InsertAdvanceDirectiveData(advanceDirectiveXml, documentIDnumber, profileID)
        If $$$ISERR(sc) Set status = sc
    }

    If sections["encounters" {
        Set encounterXml = ..FileToStream(ccdFilePath, "EncounterXSLT")
        If encounterXml = "" Quit $$$ERROR($$$GeneralError, "XSLT transformation failed for encounters.")
        Set sc = ##class(LEADNorth.CDAProfiler.Utils.DBInsert).InsertEncounterData(encounterXml, documentIDnumber, profileID)
        If $$$ISERR(sc) Set status = sc
    }

    If sections["payer" {
        Set payerXml = ..FileToStream(ccdFilePath, "PayerXSLT")
        If payerXml = "" Quit $$$ERROR($$$GeneralError, "XSLT transformation failed for payers.")
        Set sc = ##class(LEADNorth.CDAProfiler.Utils.DBInsert).InsertPayerData(payerXml, documentIDnumber, profileID)
        If $$$ISERR(sc) Set status = sc
    }

    If sections["patient" {
        Set patientXml = ..FileToStream(ccdFilePath, "PatientXSLT")
        If patientXml = "" Quit $$$ERROR($$$GeneralError, "XSLT transformation failed for patient.")
        Set sc = ##class(LEADNorth.CDAProfiler.Utils.DBInsert).InsertPatientData(patientXml, profileID, documentIDnumber)
        If $$$ISERR(sc) Set status = sc
    }

    If sections["goals" {
        Set goalsXml = ..FileToStream(ccdFilePath, "GoalsXSLT")
        If goalsXml = "" Quit $$$ERROR($$$GeneralError, "XSLT transformation failed for goals.")
        Set sc = ##class(LEADNorth.CDAProfiler.Utils.DBInsert).InsertGoalsData(goalsXml, documentIDnumber, profileID)
        If $$$ISERR(sc) Set status = sc
    }

    If sections["implants" {
        Set implantsXml = ..FileToStream(ccdFilePath, "ImplantsXSLT")
        If implantsXml = "" Quit $$$ERROR($$$GeneralError, "XSLT transformation failed for implants.")
        Set sc = ##class(LEADNorth.CDAProfiler.Utils.DBInsert).InsertImplantsData(implantsXml, documentIDnumber, profileID)
        If $$$ISERR(sc) Set status = sc
    }

    If sections["encompassingEncounter" {
        Set encompassingXml = ..FileToStream(ccdFilePath, "EncompassingEncounterXSLT")
        If encompassingXml = "" Quit $$$ERROR($$$GeneralError, "XSLT transformation failed for encompassing encounters.")
        Set sc = ##class(LEADNorth.CDAProfiler.Utils.DBInsert).InsertEncompassingEncounterData(encompassingXml, documentIDnumber, profileID)
        If $$$ISERR(sc) Set status = sc
    }

    If sections["diagnosis" {
        Set diagnosisXml = ..FileToStream(ccdFilePath, "DiagnosisXSLT")
        If diagnosisXml = "" Quit $$$ERROR($$$GeneralError, "XSLT transformation failed for diagnosis.")
        Set sc = ##class(LEADNorth.CDAProfiler.Utils.DBInsert).InsertDiagnosisData(diagnosisXml, documentIDnumber, profileID)
        If $$$ISERR(sc) Set status = sc
    }

    Quit status
}

/// Converts the contents of a file to a character stream and applies an XSLT transformation.
/// Returns the transformed output stream or an error stream if the operation fails.
ClassMethod FileToStream(filePath As %String, xDataName As %String) As %Stream.GlobalCharacter
{
    // Create a new in-memory character stream
    Set inputStream = ##class(%Stream.GlobalCharacter).%New()

    // Open the file
    Set file = ##class(%Stream.FileCharacter).%New()
    Set sc = file.LinkToFile(filePath)
    If $$$ISERR(sc) {
        Do $System.Status.DisplayError(sc)
        Quit inputStream  // Return an empty stream to maintain type safety
    }

    // Read file contents into the memory stream
    While 'file.AtEnd {
        Set line = file.ReadLine()
        Do inputStream.Write(line)
        Do inputStream.Write($Char(13,10))
    }

    Do inputStream.Rewind()

    // Apply the XSLT transformation
    Set resultStream = ..ApplyXSLT(inputStream, xDataName)
    Quit resultStream
}

/// Applies an XSLT transformation to the input stream using the specified XData block.
/// Returns the transformed output as a new character stream.
ClassMethod ApplyXSLT(pStream As %Stream, xDataName As %String) As %Stream.GlobalCharacter
{
    #dim tSC As %Status = $$$OK
    #dim tCompiledStyleSheet As %XML.XSLT.CompiledStyleSheet
    #dim outputStream = ##class(%Stream.GlobalCharacter).%New()

    Do {
        // Open the compiled XData block
        Set tXSL = ##class(%Dictionary.CompiledXData).%OpenId("LEADNorth.CDAProfiler.XSLT.CDAParser||"_xDataName).Data
        If '$IsObject(tXSL) {
            Set tSC = %objlasterror
            Quit
        }

        // Compile the XSLT stylesheet
        Set tSC = ##class(%XML.XSLT.CompiledStyleSheet).CreateFromStream(tXSL, .tCompiledStyleSheet)
        If $$$ISERR(tSC) Quit

        // Apply transformation
        Set tSC = ##class(%XML.XSLT.Transformer).TransformStreamWithCompiledXSL(pStream, tCompiledStyleSheet, .outputStream)
        If $$$ISERR(tSC) Quit
    } While (0)

    If $$$ISERR(tSC) {
        Do DisplayError^%apiOBJ(tSC)
        Quit ##class(%Stream.GlobalCharacter).%New()  // Return empty stream on error
    }

    Quit outputStream
}

ClassMethod ProcessLatestCCDs(num As %Integer, profileID As %String, filterDocuments As %String, sections As %String) As %Status
{
    // Validate input
    If num <= 0 {
        Write "ERROR: Invalid number of documents requested.", !
        Quit $$$ERROR($$$GeneralError, "Invalid number of documents requested")
    }

    Set tSC = $$$OK
    Set index = 0

    // Build the SQL query to get the IDs
    If filterDocuments'="" {
	    Set sqltext = "SELECT TOP ? ID FROM HS_IHE_XDSb_Repository.Documents WHERE ID [ '"_filterDocuments_"' ORDER BY ID ASC"
    } Else {
	    Set sqltext = "SELECT TOP ? ID FROM HS_IHE_XDSb_Repository.Documents ORDER BY ID ASC"
    }

    // Prepare and execute the SQL statement
    Set stmt = ##class(%SQL.Statement).%New()
    Set qStatus = stmt.%Prepare(sqltext)
    If $$$ISERR(qStatus) {
        Do $System.Status.DisplayError(qStatus)
        Quit qStatus
    }
    Set rset = stmt.%Execute(num)

    // Loop through the result set
    While rset.%Next() {
        Set docID = rset.ID
        // Get the document object for the current ID
        Set tSC = ##class(HS.IHE.XDSb.Repository.Documents).DocumentObjectForID(docID, .msg)
        If $$$ISERR(tSC) {
            Do $System.Status.DisplayError(tSC)
            Continue
        }
        // Process the CCD stream
        Set sc = ..ProcessCCDStream(msg.Document, profileID, sections)
        If $$$ISERR(sc) {
            Write "ERROR: Failed to process document ID: ", docID, !
            Do $System.Status.DisplayError(sc)
        }
    }
    Quit tSC
}

ClassMethod ProcessCCDStream(ccdStream As %Stream.GlobalCharacter, profileID As %String, sections As %String) As %Status
{
    Set status = $$$OK

    // Process Metadata first
    Set docXml = ..ApplyXSLT(ccdStream, "MetadataXSLT")
    If docXml = "" {
        Write "XSLT transformation failed for Document Metadata. No XML output generated.", !
        Quit $$$ERROR($$$GeneralError, "XSLT transformation failed for Document Metadata.")
    }

    Set documentIDnumber = ""
    Set docStatus = ##class(LEADNorth.CDAProfiler.Utils.DBInsert).InsertDocumentMetadata(docXml, .documentIDnumber, profileID)
    If $$$ISERR(docStatus) {
        Write "Error saving document metadata", !
        Quit docStatus
    }

    // Selectively process sections
    If sections["allergy" {
        Set allergyXml = ..ApplyXSLT(ccdStream, "AllergyXSLT")
        If allergyXml = "" Quit $$$ERROR($$$GeneralError, "XSLT transformation failed for allergies.")
        Set sc = ##class(LEADNorth.CDAProfiler.Utils.DBInsert).InsertAllergyData(allergyXml, documentIDnumber, profileID)
        If $$$ISERR(sc) Set status = sc
    }

    If sections["medications" {
        Set medicationsXml = ..ApplyXSLT(ccdStream, "MedicationsXSLT")
        If medicationsXml = "" Quit $$$ERROR($$$GeneralError, "XSLT transformation failed for medications.")
        Set sc = ##class(LEADNorth.CDAProfiler.Utils.DBInsert).InsertMedicationData(medicationsXml, documentIDnumber, profileID)
        If $$$ISERR(sc) Set status = sc
    }

    If sections["problems" {
        Set problemsXml = ..ApplyXSLT(ccdStream, "ProblemsXSLT")
        If problemsXml = "" Quit $$$ERROR($$$GeneralError, "XSLT transformation failed for problems.")
        Set sc = ##class(LEADNorth.CDAProfiler.Utils.DBInsert).InsertProblemsData(problemsXml, documentIDnumber, profileID)
        If $$$ISERR(sc) Set status = sc
    }

    If sections["procedures" {
        Set proceduresXml = ..ApplyXSLT(ccdStream, "ProceduresXSLT")
        If proceduresXml = "" Quit $$$ERROR($$$GeneralError, "XSLT transformation failed for procedures.")
        Set sc = ##class(LEADNorth.CDAProfiler.Utils.DBInsert).InsertProceduresData(proceduresXml, documentIDnumber, profileID)
        If $$$ISERR(sc) Set status = sc
    }

    If sections["results" {
        Set resultsXml = ..ApplyXSLT(ccdStream, "ResultsXSLT")
        If resultsXml = "" Quit $$$ERROR($$$GeneralError, "XSLT transformation failed for results.")
        Set sc = ##class(LEADNorth.CDAProfiler.Utils.DBInsert).InsertResultsData(resultsXml, documentIDnumber, profileID)
        If $$$ISERR(sc) Set status = sc
    }

    If sections["vitalSigns" {
        Set vitalSignsXml = ..ApplyXSLT(ccdStream, "VitalSignsXSLT")
        If vitalSignsXml = "" Quit $$$ERROR($$$GeneralError, "XSLT transformation failed for vital signs.")
        Set sc = ##class(LEADNorth.CDAProfiler.Utils.DBInsert).InsertVitalSignsData(vitalSignsXml, documentIDnumber, profileID)
        If $$$ISERR(sc) Set status = sc
    }

    If sections["immunizations" {
        Set immunizationsXml = ..ApplyXSLT(ccdStream, "ImmunizationsXSLT")
        If immunizationsXml = "" Quit $$$ERROR($$$GeneralError, "XSLT transformation failed for immunizations.")
        Set sc = ##class(LEADNorth.CDAProfiler.Utils.DBInsert).InsertImmunizationData(immunizationsXml, documentIDnumber, profileID)
        If $$$ISERR(sc) Set status = sc
    }

    If sections["planOfCare" {
        Set planOfCareXml = ..ApplyXSLT(ccdStream, "PlanOfCareXSLT")
        If planOfCareXml = "" Quit $$$ERROR($$$GeneralError, "XSLT transformation failed for plan of care.")
        Set sc = ##class(LEADNorth.CDAProfiler.Utils.DBInsert).InsertPlanOfCareData(planOfCareXml, documentIDnumber, profileID)
        If $$$ISERR(sc) Set status = sc
    }

    If sections["socialHistory" {
        Set socialHistoryXml = ..ApplyXSLT(ccdStream, "SocialHistoryXSLT")
        If socialHistoryXml = "" Quit $$$ERROR($$$GeneralError, "XSLT transformation failed for social history.")
        Set sc = ##class(LEADNorth.CDAProfiler.Utils.DBInsert).InsertSocialHistoryData(socialHistoryXml, documentIDnumber, profileID)
        If $$$ISERR(sc) Set status = sc
    }

    If sections["functionalStatus" {
        Set functionalStatusXml = ..ApplyXSLT(ccdStream, "FunctionalStatusXSLT")
        If functionalStatusXml = "" Quit $$$ERROR($$$GeneralError, "XSLT transformation failed for functional status.")
        Set sc = ##class(LEADNorth.CDAProfiler.Utils.DBInsert).InsertFunctionalStatusData(functionalStatusXml, documentIDnumber, profileID)
        If $$$ISERR(sc) Set status = sc
    }

    If sections["familyHistory" {
        Set familyHistoryXml = ..ApplyXSLT(ccdStream, "FamilyHistoryXSLT")
        If familyHistoryXml = "" Quit $$$ERROR($$$GeneralError, "XSLT transformation failed for family history.")
        Set sc = ##class(LEADNorth.CDAProfiler.Utils.DBInsert).InsertFamilyHistoryData(familyHistoryXml, documentIDnumber, profileID)
        If $$$ISERR(sc) Set status = sc
    }

    If sections["advanceDirective" {
        Set advanceDirectiveXml = ..ApplyXSLT(ccdStream, "AdvanceDirectiveXSLT")
        If advanceDirectiveXml = "" Quit $$$ERROR($$$GeneralError, "XSLT transformation failed for advance directives.")
        Set sc = ##class(LEADNorth.CDAProfiler.Utils.DBInsert).InsertAdvanceDirectiveData(advanceDirectiveXml, documentIDnumber, profileID)
        If $$$ISERR(sc) Set status = sc
    }

    If sections["encounters" {
        Set encounterXml = ..ApplyXSLT(ccdStream, "EncounterXSLT")
        If encounterXml = "" Quit $$$ERROR($$$GeneralError, "XSLT transformation failed for encounters.")
        Set sc = ##class(LEADNorth.CDAProfiler.Utils.DBInsert).InsertEncounterData(encounterXml, documentIDnumber, profileID)
        If $$$ISERR(sc) Set status = sc
    }

    If sections["payer" {
        Set payerXml = ..ApplyXSLT(ccdStream, "PayerXSLT")
        If payerXml = "" Quit $$$ERROR($$$GeneralError, "XSLT transformation failed for payers.")
        Set sc = ##class(LEADNorth.CDAProfiler.Utils.DBInsert).InsertPayerData(payerXml, documentIDnumber, profileID)
        If $$$ISERR(sc) Set status = sc
    }

    If sections["patient" {
        Set patientXml = ..ApplyXSLT(ccdStream, "PatientXSLT")
        If patientXml = "" Quit $$$ERROR($$$GeneralError, "XSLT transformation failed for patient.")
        Set sc = ##class(LEADNorth.CDAProfiler.Utils.DBInsert).InsertPatientData(patientXml, profileID)
        If $$$ISERR(sc) Set status = sc
    }

    If sections["goals" {
        Set goalsXml = ..ApplyXSLT(ccdStream, "GoalsXSLT")
        If goalsXml = "" Quit $$$ERROR($$$GeneralError, "XSLT transformation failed for goals.")
        Set sc = ##class(LEADNorth.CDAProfiler.Utils.DBInsert).InsertGoalsData(goalsXml, documentIDnumber, profileID)
        If $$$ISERR(sc) Set status = sc
    }

    If sections["implants" {
        Set implantsXml = ..ApplyXSLT(ccdStream, "ImplantsXSLT")
        If implantsXml = "" Quit $$$ERROR($$$GeneralError, "XSLT transformation failed for implants.")
        Set sc = ##class(LEADNorth.CDAProfiler.Utils.DBInsert).InsertImplantsData(implantsXml, documentIDnumber, profileID)
        If $$$ISERR(sc) Set status = sc
    }

    If sections["encompassingEncounter" {
        Set encompassingXml = ..ApplyXSLT(ccdStream, "EncompassingEncounterXSLT")
        If encompassingXml = "" Quit $$$ERROR($$$GeneralError, "XSLT transformation failed for encompassing encounters.")
        Set sc = ##class(LEADNorth.CDAProfiler.Utils.DBInsert).InsertEncompassingEncounterData(encompassingXml, documentIDnumber, profileID)
        If $$$ISERR(sc) Set status = sc
    }

    If sections["diagnosis" {
        Set diagnosisXml = ..ApplyXSLT(ccdStream, "DiagnosisXSLT")
        If diagnosisXml = "" Quit $$$ERROR($$$GeneralError, "XSLT transformation failed for diagnoses.")
        Set sc = ##class(LEADNorth.CDAProfiler.Utils.DBInsert).InsertDiagnosisData(diagnosisXml, documentIDnumber, profileID)
        If $$$ISERR(sc) Set status = sc
    }

    Quit status
}

}
