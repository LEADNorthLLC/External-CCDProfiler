Class LEADNorth.UI.Reports Extends %ZEN.Component.page
{

/// Class name of application this page belongs to.
Parameter APPLICATION = "LEADNorth.CDAProfiler";

/// Displayed name of this page.
Parameter PAGENAME = "Reports";

/// Domain used for localization.
Parameter DOMAIN = "LEADNorth.CDAProfiler";

/// This Style block contains page-specific CSS style definitions.
XData Style
{
<style type="text/css">
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;
    }
    .navbar {
        background-color: #2c3e50;
        color: white;
        padding: 15px;
        font-size: 18px;
    }
    .navbar a {
        color: white;
        text-decoration: none;
        padding: 0 15px;
    }
    .navbar a:hover {
        background-color: #34495e;
        border-radius: 4px;
    }
    .container {
        padding: 20px;
        padding-bottom: 80px; 
    }
    .section {
        margin-bottom: 30px;
    }
    .section h2 {
        color: #2c3e50;
        margin-bottom: 10px;
    }
    .footer {
        background-color: #2c3e50;
        color: white;
        text-align: center;
        padding: 15px;
        position: fixed;
        bottom: 0;
        width: 100%;
        height: 50px;
    }
    .report-selection {
        margin-bottom: 20px;
    }
    .report-selection select {
        width: 100%;
        padding: 10px;
        font-size: 16px;
        margin-bottom: 10px;
    }
    .report-selection button {
        width: 100%;
        padding: 10px;
        font-size: 16px;
    }
    .report-section {
        margin-top: 30px;
    }
    .collapsible {
        background-color: #2c3e50;
        color: white;
        cursor: pointer;
        padding: 10px;
        width: 100%;
        border: none;
        text-align: left;
        outline: none;
        font-size: 18px;
        margin-bottom: 5px;
    }
    .active, .collapsible:hover {
        background-color: #34495e;
    }
    .content {
        padding: 0 18px;
        display: none;
        overflow: hidden;
        background-color: #f4f4f4;
        margin-bottom: 15px;
    }
    .report-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 15px;
    }
    .report-table th, .report-table td {
        border: 1px solid #ccc;
        padding: 10px;
        text-align: left;
    }
    .report-table th {
        background-color: #f2f2f2;
    }
</style>
}

/// This XML block defines the contents of this page.
XData Contents [ XMLNamespace = "http://www.intersystems.com/zen" ]
{
<page xmlns="http://www.intersystems.com/zen" title="Reports">
    <html>
    <div class="navbar">
        <a href="LEADNorth.UI.Index.cls">Dashboard</a>
        <a href="LEADNorth.UI.DataImporter.cls">Import Data</a>
        <a href="LEADNorth.UI.Reports.cls">Reports</a>
        <a href="LEADNorth.UI.Settings.cls">Settings</a>
        <a href="LEADNorth.UI.Help.cls">Help</a>
    </div>
    <div class="container">
        <h1>Generated Reports</h1>
        <div class="report-selection">
            <label for="reportSelect">Select a Report:</label>
            <select id="reportSelect" onChange="zenPage.viewReport()"> 
            </select>
            <button onclick="zenPage.exportReport()">Export Report</button>
        </div>
        <div class="report-section" id="reportContent">
            <h2>CCD Report Breakdown</h2>
            <p>Click on a section to expand and view details.</p>
            <button class="collapsible" onclick="zenPage.toggleCollapsible(this)">Encounters</button>
            <div class="content" id="encounterReportBody">
            </div>
            <button class="collapsible" onclick="zenPage.toggleCollapsible(this)">Vital Signs</button>
            <div class="content" id="vitalSignsReportBody">
            </div>
            <button class="collapsible" onclick="zenPage.toggleCollapsible(this)">Allergy</button>
            <div class="content" id="allergyReportBody">
            </div>
            <button class="collapsible" onclick="zenPage.toggleCollapsible(this)">Procedures</button>
            <div class="content" id="procedureReportBody">
            </div>
            <button class="collapsible" onclick="zenPage.toggleCollapsible(this)">Social History</button>
            <div class="content" id="socialHistoryReportBody">
            </div>
            <button class="collapsible" onclick="zenPage.toggleCollapsible(this)">Results</button>
            <div class="content" id="resultsReportBody">
            </div>
            <button class="collapsible" onclick="zenPage.toggleCollapsible(this)">Problems</button>
			<div class="content" id="problemReportBody">
			</div>
			<button class="collapsible" onclick="zenPage.toggleCollapsible(this)">Plan of Care</button>
			<div class="content" id="planOfCareReportBody">
			</div>
			<button class="collapsible" onclick="zenPage.toggleCollapsible(this)">Payer</button>
			<div class="content" id="payerReportBody">
			</div>
			<button class="collapsible" onclick="zenPage.toggleCollapsible(this)">Patient</button>
			<div class="content" id="patientReportBody">
			</div>
			<button class="collapsible" onclick="zenPage.toggleCollapsible(this)">Medications</button>
			<div class="content" id="medicationReportBody">
			</div>
			<button class="collapsible" onclick="zenPage.toggleCollapsible(this)">Immunizations</button>
			<div class="content" id="immunizationReportBody">
			</div>
			<button class="collapsible" onclick="zenPage.toggleCollapsible(this)">Functional Status</button>
			<div class="content" id="functionalStatusReportBody">
			</div>
			<button class="collapsible" onclick="zenPage.toggleCollapsible(this)">Family History</button>
			<div class="content" id="familyHistoryReportBody">
			</div>
            <button class="collapsible" onclick="zenPage.toggleCollapsible(this)">Documents</button>
            <div class="content" id="documentsReportBody">
            </div>
            <button class="collapsible" onclick="zenPage.toggleCollapsible(this)">Advance Directive</button>
            <div class="content" id="advanceDirectiveReportBody">
            </div>
            <button class="collapsible" onclick="zenPage.toggleCollapsible(this)">Goals</button>
			<div class="content" id="goalsReportBody">
			</div>
			<button class="collapsible" onclick="zenPage.toggleCollapsible(this)">Implants</button>
			<div class="content" id="implantsReportBody">
			</div>
			<button class="collapsible" onclick="zenPage.toggleCollapsible(this)">Encompassing Encounters</button>
			<div class="content" id="encompassingEncounterReportBody">
			</div>
			<button class="collapsible" onclick="zenPage.toggleCollapsible(this)">Diagnosis</button>
			<div class="content" id="diagnosisReportBody">
			</div>

        </div>
    </div>
    <div class="footer">
        <p>2024 by LEAD North LLC</p>
    </div>
    </html>
</page>
}

ClientMethod exportReport() [ Language = javascript ]
{
    var selectedProfileID = document.getElementById("reportSelect").value;

    var xmlContent = zenPage.generateExcelReport(selectedProfileID)
        if (xmlContent) {
            var blob = new Blob([xmlContent], {type: 'application/vnd.ms-excel'});

            var link = document.createElement('a');
            link.href = window.URL.createObjectURL(blob);
            link.download = 'Report_' + selectedProfileID + '.xls';

            document.body.appendChild(link);

            link.click();

            setTimeout(function() {
                document.body.removeChild(link);
                window.URL.revokeObjectURL(link.href);
            }, 100);
        } else {
            alert('Failed to generate report.');
        }
}

ClassMethod generateExcelReport(profileID As %String) As %String [ ZenMethod ]
{
    Set stream = ##class(%Stream.GlobalCharacter).%New()

    Do stream.Write("<?xml version=""1.0""?>")
    Do stream.Write("<?mso-application progid=""Excel.Sheet""?>")
    Do stream.Write("<Workbook xmlns=""urn:schemas-microsoft-com:office:spreadsheet"" ")
    Do stream.Write("xmlns:o=""urn:schemas-microsoft-com:office:office"" ")
    Do stream.Write("xmlns:x=""urn:schemas-microsoft-com:office:excel"" ")
    Do stream.Write("xmlns:ss=""urn:schemas-microsoft-com:office:spreadsheet"" ")
    Do stream.Write("xmlns:html=""http://www.w3.org/TR/REC-html40"">")

    Set sections = "encounters,vitalSigns,allergy,procedures,socialHistory,results,problems,planOfCare,payer,patient,medications,immunizations,functionalStatus,familyHistory,documents,advanceDirective,goals,implants,encompassingEncounter,diagnosis"

    For i=1:1:$L(sections,",") {
        Set reportType = $P(sections,",",i)
        Set sheetXML = ..GenerateWorksheetXML(reportType, profileID)
        If sheetXML '= "" {
            Do stream.Write(sheetXML)
        }
    }

    Do stream.Write("</Workbook>")

    Quit stream.Read(10971486)
}

ClassMethod GenerateWorksheetXML(reportType As %String, profileID As %String) As %String
{
    Set fields = ""
    Set tableName = ""
    If reportType = "encounters" {
    	Set fields = "EncounterNumber,ReasonForVisit,VisitDescription,DischargeDisposition,EncounterTypeDisplayName,EncounterTypeCode,EncounterTypeCodeSystem,EncounterTypeCodeSystemName,StatusCode,StartDateTime,EndDateTime,FacilityName,FacilityIDAAName,FacilityIDExtension,FacilityIDRoot,PerformerID,PerformerAddress,PerformerTelecom,PerformerName,AuthorTime,LocationID,LocationAddress,LocationTelecom,LocationName"
    	Set tableName = "LEADNorth_CDAProfiler_Sections.CCDEncounter"
    	Set className = "LEADNorth.CDAProfiler.Sections.CCDEncounter"
	} ElseIf reportType = "vitalSigns" {
	    Set fields = "Value,Unit,Description,xDate,AuthorTime,ObservationCode,ObservationCodeSystem,ObservationDisplayName,ObservationStatusCode,ObservationEffectiveTimeLow,ObservationEffectiveTimeHigh,ObservationIDRoot,ObservationIDExtension,OrganizerCode,OrganizerCodeSystem,OrganizerEffectiveTimeLow,OrganizerEffectiveTimeHigh,OrganizerClassCode,OrganizerMoodCode,OrganizerDisplayName,OrganizerStatusCode"
	    Set tableName = "LEADNorth_CDAProfiler_Sections.CCDVitalSign"
	    Set className = "LEADNorth.CDAProfiler.Sections.CCDVitalSign"
	} ElseIf reportType = "allergy" {
	    Set fields = "AllergyCode,AllergyCodeSystem,AllergyCodeSystemName,AllergyDisplayName,CategoryCode,CategoryCodeSystem,CategoryCodeSystemName,CategoryDisplayName,ReactionCode,ReactionCodeSystem,ReactionCodeSystemName,ReactionDisplayName,SeverityCode,SeverityCodeSystem,SeverityCodeName,SeverityDisplayName,StatusCode,StatusCodeSystem,StatusCodeSystemName,StatusDisplayName,EffectiveTimeLow,EffectiveTimeHigh,ObservationCode,ObservationCodeSystem,ObservationDisplayName,ObservationStatusCode,ObservationEffectiveTimeLow,ObservationEffectiveTimeHigh,RepresentedOrganization"
	    Set tableName = "LEADNorth_CDAProfiler_Sections.CCDAllergy"
	    Set className = "LEADNorth.CDAProfiler.Sections.CCDAllergy"
	} ElseIf reportType = "procedures" {
	    Set fields = "ProcedureCode,CodeSystem,CodeSystemName,CodeDisplayName,AuthorTime,Status,EffectiveTimeLow,EffectiveTimeHigh,PerformerID,PerformerName,PerformerOrganization,PerformerAddress,ProcedureClassCode,MoodCode"
	    Set tableName = "LEADNorth_CDAProfiler_Sections.CCDProcedure"
	    Set className = "LEADNorth.CDAProfiler.Sections.CCDProcedure"
	} ElseIf reportType = "socialHistory" {
	    Set fields = "SocialHistoryID,ConceptDescription,ObservationCode,ObservationCodeSystem,ObservationCodeSystemName,ObservationDisplayName,ValueCode,ValueCodeSystem,ValueCodeSystemName,ValueDisplayName,Units,AuthorTime,StatusCode,EffectiveTimeLow,EffectiveTimeHigh"
	    Set tableName = "LEADNorth_CDAProfiler_Sections.CCDSocialHistory"
	    Set className = "LEADNorth.CDAProfiler.Sections.CCDSocialHistory"
	} ElseIf reportType = "results" {
	    Set fields = "TestValue,Units,ReferenceRange,StatusCode,ObservationCode,ObservationCodeDisplayName,ObservationCodeSystem,ObservationCodeSystemName,AuthorTime,OrganizerID,OrganizerName,EffectiveTimeLow,EffectiveTimeHigh,MoodCode"
	    Set tableName = "LEADNorth_CDAProfiler_Sections.CCDResult"
	    Set className = "LEADNorth.CDAProfiler.Sections.CCDResult"
	} ElseIf reportType = "problems" {
	    Set fields = "ValueCode,ValueDisplayName,CodeSystem,CodeSystemName,AuthorTime,Author,ProblemTypeCode,ProblemTypeName,StatusCode,EffectiveTimeLow,EffectiveTimeHigh,ProblemClassCode,MoodCode"
	    Set tableName = "LEADNorth_CDAProfiler_Sections.CCDProblem"
	    Set className = "LEADNorth.CDAProfiler.Sections.CCDProblem"
	} ElseIf reportType = "planOfCare" {
	    Set fields = "PlanOfCareID,EncounterID,EncounterExtension,DisplayName,StatusCode,EffectiveTimeLow,EffectiveTimeHigh,PerformerID,PerformerOrganization,PerformerAddress,PerformerCity,PerformerState,PerformerPostalCode,AuthorTime"
	    Set tableName = "LEADNorth_CDAProfiler_Sections.CCDPlanOfCare"
	    Set className = "LEADNorth.CDAProfiler.Sections.CCDPlanOfCare"
	} ElseIf reportType = "payer" {
	    Set fields = "PayerID,PayerName,PolicyNumber,MemberID,CoveredParty,PayerCode,PayerCodeSystem,PayerCodeSystemName,PayerStatusCode,EffectiveTimeLow,EffectiveTimeHigh,AuthorTime,PerformerIDs,PerformerAddress,PerformerTelecom,PerformerName,LocationAddress,LocationTelecom,LocationName,ParticipantRoleID,ParticipantRoleCode,ParticipantRoleCodeSystem,ParticipantRoleCodeSystemName"
	    Set tableName = "LEADNorth_CDAProfiler_Sections.CCDPayer"
	    Set className = "LEADNorth.CDAProfiler.Sections.CCDPayer"
	} ElseIf reportType = "patient" {
	    Set fields = "PatientMRN,FirstName,LastName,DOB,GenderCode,GenderDisplay,GenderSystem,Address,City,State,ZipCode,Country,PhoneNumber,Email,LanguageCode,MaritalStatusCode,MaritalStatusDisplay,MaritalStatusSystem,RaceCode,RaceDisplay,RaceSystem,EthnicityCode,EthnicityDisplay,EthnicitySystem"
	    Set tableName = "LEADNorth_CDAProfiler_Sections.CCDPatient"
	    Set className = "LEADNorth.CDAProfiler.Sections.CCDPatient"
	} ElseIf reportType = "medications" {
	    Set fields = "MedicationID,DrugName,GenericName,Dose,DoseUnits,Frequency,Route,Site,StartDate,EndDate,Provider,NDC,RxNormCode,GPI,Status"
	    Set tableName = "LEADNorth_CDAProfiler_Sections.CCDMedication"
	    Set className = "LEADNorth.CDAProfiler.Sections.CCDMedication"
	} ElseIf reportType = "immunizations" {
	    Set fields = "ImmunizationID,Route,Dose,DoseUnit,Vaccine,VaccineCode,VaccineCodeSystem,VaccineCodeSystemName,LotNumber,StartDate,EndDate,PerformerID,PerformerAddress,PerformerCity,PerformerState,PerformerPostalCode,StatusCode"
	    Set tableName = "LEADNorth_CDAProfiler_Sections.CCDImmunization"
	    Set className = "LEADNorth.CDAProfiler.Sections.CCDImmunization"
	} ElseIf reportType = "functionalStatus" {
	    Set fields = "FunctionalStatusID,Status,xDate,Description,StatusCode,ObservationCode,ObservationSystem,EffectiveTime"
	    Set tableName = "LEADNorth_CDAProfiler_Sections.CCDFunctionalStatus"
	    Set className = "LEADNorth.CDAProfiler.Sections.CCDFunctionalStatus"
	} ElseIf reportType = "familyHistory" {
	    Set fields = "RelativePerson,RelativeCode,RelativeCodeSystem,OnsetAge,StatusCode,ObservationCode,ObservationDisplayName,ObservationSystem,ObservationID,ObservationIDOid"
	    Set tableName = "LEADNorth_CDAProfiler_Sections.CCDFamilyHistory"
	    Set className = "LEADNorth.CDAProfiler.Sections.CCDFamilyHistory"
	} ElseIf reportType = "documents" {
	    Set fields = "DocumentID,PatientID,DocumentDate,CreatedAt"
	    Set tableName = "LEADNorth_CDAProfiler_Sections.CCDDocument"
	    Set className = "LEADNorth.CDAProfiler.Sections.CCDDocument"
	} ElseIf reportType = "advanceDirective" {
	    Set fields = "AdvanceDirectiveID,DirectiveType,DateSigned,StatusCode,DirectiveID"
	    Set tableName = "LEADNorth_CDAProfiler_Sections.CCDAdvanceDirective"
	    Set className = "LEADNorth.CDAProfiler.Sections.CCDAdvanceDirective"
	} ElseIf reportType = "goals" {
	    Set fields = "GoalID,GoalDescription,GoalCode,GoalCodeSystem,GoalCodeSystemName,GoalStatus,StartDate,EndDate,AuthorTime,AuthorName"
	    Set tableName = "LEADNorth_CDAProfiler_Sections.CCDGoals"
	    Set className = "LEADNorth.CDAProfiler.Sections.CCDGoals"
	} ElseIf reportType = "implants" {
	    Set fields = "ImplantID,DeviceName,DeviceCode,DeviceCodeSystem,DeviceCodeSystemName,ManufacturerModelName,SerialNumber,ImplantStatus,ImplantDate,RemovalDate,AuthorTime"
	    Set tableName = "LEADNorth_CDAProfiler_Sections.CCDImplants"
	    Set className = "LEADNorth.CDAProfiler.Sections.CCDImplants"
	} ElseIf reportType = "encompassingEncounter" {
	    Set fields = "EncounterID,EncounterTypeDisplayName,EncounterTypeCode,EncounterTypeCodeSystem,EncounterTypeCodeSystemName,StartDateTime,EndDateTime,DischargeDisposition,LocationID,LocationName,LocationAddress,LocationTelecom"
	    Set tableName = "LEADNorth_CDAProfiler_Sections.CCDEncompassingEncounter"
	    Set className = "LEADNorth.CDAProfiler.Sections.CCDEncompassingEncounter"
	} ElseIf reportType = "diagnosis" {
	    Set fields = "DiagnosisID,DiagnosisTypeCode,DiagnosisTypeCodeSystem,DiagnosisTypeCodeSystemName,DiagnosisTypeDisplayName,DiagnosisEffectiveTimeLow,DiagnosisEffectiveTimeHigh,DiagnosisCode,DiagnosisCodeSystem,DiagnosisCodeSystemName,DiagnosisCodeDisplayName,DiagnosisStatusCode,DiagnosisEncounterNumber"
	    Set tableName = "LEADNorth_CDAProfiler_Sections.CCDDiagnosis"
	    Set className = "LEADNorth.CDAProfiler.Sections.CCDDiagnosis"
	}
	 Else {
        Return "" 
    }
    
    Set xml = "<Worksheet ss:Name="""_reportType_""">"
    Set xml = xml_"<Table>"
    
    Set xml = xml_"<Row>"
    Set xml = xml_"<Cell><Data ss:Type=""String"">Field</Data></Cell>"
    Set xml = xml_"<Cell><Data ss:Type=""String"">Value</Data></Cell>"
    Set xml = xml_"<Cell><Data ss:Type=""String"">Occurrences</Data></Cell>"
    Set xml = xml_"<Cell><Data ss:Type=""String"">XPath</Data></Cell>"
    Set xml = xml_"<Cell><Data ss:Type=""String"">SDA Mapping</Data></Cell>"
    Set xml = xml_"</Row>"
    
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
            
            Set xPath = $classmethod(className, "GetXPath", field)
            
            Set sdaMapping = "<SDAPATH>"
            
            Set xml = xml_"<Row>"
            Set xml = xml_"<Cell><Data ss:Type=""String"">"_..EncodeXML(field)_"</Data></Cell>"
            Set xml = xml_"<Cell><Data ss:Type=""String"">"_..EncodeXML(value)_"</Data></Cell>"
            Set xml = xml_"<Cell><Data ss:Type=""Number"">"_occurrences_"</Data></Cell>"
            Set xml = xml_"<Cell><Data ss:Type=""String"">""</Data></Cell>"
            Set xml = xml_"<Cell><Data ss:Type=""String"">"_..EncodeXML(sdaMapping)_"</Data></Cell>"
            Set xml = xml_"</Row>"
        }
    }
    
    Set xml = xml_"</Table></Worksheet>"
    Return xml
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

ClientMethod onloadHandler() [ Language = javascript ]
{
    var urlParams = new URLSearchParams(window.location.search);
    var profileID = urlParams.get('profileID');
    zenPage.populateReports();
    zenPage.viewReport();
    if (profileID) {
            document.getElementById('reportSelect').value = profileID;
            zenPage.viewReport();
        }
}

ClientMethod populateReports() [ Language = javascript ]
{
	var reportNames = zenPage.GetDistinctProfileIDs();
	//console.log(reportNames);
	document.getElementById("reportSelect").innerHTML = reportNames;
}

ClassMethod GetDistinctProfileIDs() As %String [ ZenMethod ]
{
    Set query = "SELECT DISTINCT ProfileID FROM LEADNorth_CDAProfiler_Sections.CCDDocument"
    
    Set statement = ##class(%SQL.Statement).%New()
    Set status = statement.%Prepare(query)
    
    If $$$ISERR(status) {
        Return "Error preparing statement: "_$System.Status.GetErrorText(status)
    }
    
    Set resultSet = statement.%Execute()
    
    Set html = ""
    
    While resultSet.%Next() {
        Set profileID = resultSet.%Get("ProfileID")
        Set html = html _ "<option value='"_profileID_"'>" _ profileID _ "</option>"
    }
    
    Return html
}

ClientMethod viewReport() [ Language = javascript ]
{
    zenPage.displayReportData();
}

ClientMethod displayReportData() [ Language = javascript ]
{
    var selectedProfileID = document.getElementById("reportSelect").value;

    var htmlEncounters = zenPage.QS("encounters", selectedProfileID);
    var htmlVitalSigns = zenPage.QS("vitalSigns", selectedProfileID);
    var htmlAllergy = zenPage.QS("allergy", selectedProfileID);
    var htmlProcedures = zenPage.QS("procedures", selectedProfileID);
    var htmlSocialHistory = zenPage.QS("socialHistory", selectedProfileID);
    var htmlResults = zenPage.QS("results", selectedProfileID);
    var htmlProblems = zenPage.QS("problems", selectedProfileID);
    var htmlPlanOfCare = zenPage.QS("planOfCare", selectedProfileID);
    var htmlPayer = zenPage.QS("payer", selectedProfileID);
    var htmlPatient = zenPage.QS("patient", selectedProfileID);
    var htmlMedications = zenPage.QS("medications", selectedProfileID);
    var htmlImmunizations = zenPage.QS("immunizations", selectedProfileID);
    var htmlFunctionalStatus = zenPage.QS("functionalStatus", selectedProfileID);
    var htmlFamilyHistory = zenPage.QS("familyHistory", selectedProfileID);
    var htmlDocuments = zenPage.QS("documents", selectedProfileID);
    var htmlAdvanceDirective = zenPage.QS("advanceDirective", selectedProfileID);
    var htmlGoals = zenPage.QS("goals", selectedProfileID);
    var htmlImplants = zenPage.QS("implants", selectedProfileID);
    var htmlDiagnosis = zenPage.QS("diagnosis", selectedProfileID);
    var htmlEncompassingEncounter = zenPage.QS("encompassingEncounter", selectedProfileID);

    // Replace backslashes in the HTML content
    htmlGoals = htmlGoals.replace(/\\/g, "");
    htmlImplants = htmlImplants.replace(/\\/g, "");
    htmlDiagnosis = htmlDiagnosis.replace(/\\/g, "");
    htmlEncompassingEncounter = htmlEncompassingEncounter.replace(/\\/g, "");
    htmlEncounters = htmlEncounters.replace(/\\/g, "");
    htmlVitalSigns = htmlVitalSigns.replace(/\\/g, "");
    htmlAllergy = htmlAllergy.replace(/\\/g, "");
    htmlProcedures = htmlProcedures.replace(/\\/g, "");
    htmlSocialHistory = htmlSocialHistory.replace(/\\/g, "");
    htmlResults = htmlResults.replace(/\\/g, "");
    htmlProblems = htmlProblems.replace(/\\/g, "");
    htmlPlanOfCare = htmlPlanOfCare.replace(/\\/g, "");
    htmlPayer = htmlPayer.replace(/\\/g, "");
    htmlPatient = htmlPatient.replace(/\\/g, "");
    htmlMedications = htmlMedications.replace(/\\/g, "");
    htmlImmunizations = htmlImmunizations.replace(/\\/g, "");
    htmlFunctionalStatus = htmlFunctionalStatus.replace(/\\/g, "");
    htmlFamilyHistory = htmlFamilyHistory.replace(/\\/g, "");
    htmlDocuments = htmlDocuments.replace(/\\/g, "");
    htmlAdvanceDirective = htmlAdvanceDirective.replace(/\\/g, ""); 

    document.getElementById("goalsReportBody").innerHTML = htmlGoals;
    document.getElementById("implantsReportBody").innerHTML = htmlImplants;
    document.getElementById("diagnosisReportBody").innerHTML = htmlDiagnosis;
    document.getElementById("encompassingEncounterReportBody").innerHTML = htmlEncompassingEncounter;
    document.getElementById("encounterReportBody").innerHTML = htmlEncounters;
    document.getElementById("vitalSignsReportBody").innerHTML = htmlVitalSigns;
    document.getElementById("allergyReportBody").innerHTML = htmlAllergy;
    document.getElementById("procedureReportBody").innerHTML = htmlProcedures;
    document.getElementById("socialHistoryReportBody").innerHTML = htmlSocialHistory;
    document.getElementById("resultsReportBody").innerHTML = htmlResults;
    document.getElementById("problemReportBody").innerHTML = htmlProblems;
    document.getElementById("planOfCareReportBody").innerHTML = htmlPlanOfCare;
    document.getElementById("payerReportBody").innerHTML = htmlPayer;
    document.getElementById("patientReportBody").innerHTML = htmlPatient;
    document.getElementById("medicationReportBody").innerHTML = htmlMedications;
    document.getElementById("immunizationReportBody").innerHTML = htmlImmunizations;
    document.getElementById("functionalStatusReportBody").innerHTML = htmlFunctionalStatus;
    document.getElementById("familyHistoryReportBody").innerHTML = htmlFamilyHistory;
    document.getElementById("documentsReportBody").innerHTML = htmlDocuments;
    document.getElementById("advanceDirectiveReportBody").innerHTML = htmlAdvanceDirective;
}

ClientMethod toggleCollapsible(button) [ Language = javascript ]
{
    button.classList.toggle("active");
    var content = button.nextElementSibling;
    if (content.style.display === "block") {
        content.style.display = "none";
    } else {
        content.style.display = "block";
    }
}

ClassMethod QS(reportType As %String, profileID As %String) As %String [ ZenMethod ]
{
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
        Set fields = "PlanOfCareID,EncounterID,EncounterExtension,DisplayName,StatusCode,EffectiveTimeLow,EffectiveTimeHigh,PerformerID,PerformerOrganization,PerformerAddress,PerformerCity,PerformerState,PerformerPostalCode,AuthorTime"
    } ElseIf reportType = "payer" {
        Set fields = "PayerID,PayerName,PolicyNumber,MemberID,CoveredParty,PayerCode,PayerCodeSystem,PayerCodeSystemName,PayerStatusCode,EffectiveTimeLow,EffectiveTimeHigh,AuthorTime,PerformerIDs,PerformerAddress,PerformerTelecom,PerformerName,LocationAddress,LocationTelecom,LocationName,ParticipantRoleID,ParticipantRoleCode,ParticipantRoleCodeSystem,ParticipantRoleCodeSystemName"
    } ElseIf reportType = "patient" {
        Set fields = "PatientMRN,FirstName,LastName,DOB,GenderCode,GenderDisplay,GenderSystem,Address,City,State,ZipCode,Country,PhoneNumber,Email,LanguageCode,MaritalStatusCode,MaritalStatusDisplay,MaritalStatusSystem,RaceCode,RaceDisplay,RaceSystem,EthnicityCode,EthnicityDisplay,EthnicitySystem"
    } ElseIf reportType = "medications" {
        Set fields = "MedicationID,DrugName,GenericName,Dose,DoseUnits,Frequency,Route,Site,StartDate,EndDate,Provider,NDC,RxNormCode,GPI,Status"
    } ElseIf reportType = "immunizations" {
        Set fields = "ImmunizationID,Route,Dose,DoseUnit,Vaccine,VaccineCode,VaccineCodeSystem,VaccineCodeSystemName,LotNumber,StartDate,EndDate,PerformerID,PerformerAddress,PerformerCity,PerformerState,PerformerPostalCode,StatusCode"
    } ElseIf reportType = "functionalStatus" {
        Set fields = "FunctionalStatusID,Status,xDate,Description,StatusCode,ObservationCode,ObservationSystem,EffectiveTime"
    } ElseIf reportType = "familyHistory" {
        Set fields = "RelativePerson,RelativeCode,RelativeCodeSystem,OnsetAge,StatusCode,ObservationCode,ObservationDisplayName,ObservationSystem,ObservationID,ObservationIDOid"
    } ElseIf reportType = "documents" { // Documents report fields
        Set fields = "DocumentID,PatientID,DocumentDate,CreatedAt"
    } ElseIf reportType = "advanceDirective" {
        Set fields = "AdvanceDirectiveID,DirectiveType,DateSigned,StatusCode,DirectiveID"  // Fields for Advance Directive
    } ElseIf reportType = "goals" {
        Set fields = "GoalID,GoalDescription,GoalCode,GoalCodeSystem,GoalCodeSystemName,GoalStatus,StartDate,EndDate,AuthorTime,AuthorName"
    } ElseIf reportType = "implants" {
        Set fields = "ImplantID,DeviceName,DeviceCode,DeviceCodeSystem,DeviceCodeSystemName,ManufacturerModelName,SerialNumber,ImplantStatus,ImplantDate,RemovalDate,AuthorTime"
    } ElseIf reportType = "encompassingEncounter" {
        Set fields = "EncounterID,EncounterTypeDisplayName,EncounterTypeCode,EncounterTypeCodeSystem,EncounterTypeCodeSystemName,StartDateTime,EndDateTime,DischargeDisposition,LocationID,LocationName,LocationAddress,LocationTelecom"
    } ElseIf reportType = "diagnosis" {
        Set fields = "DiagnosisID,DiagnosisTypeCode,DiagnosisTypeCodeSystem,DiagnosisTypeCodeSystemName,DiagnosisTypeDisplayName,DiagnosisEffectiveTimeLow,DiagnosisEffectiveTimeHigh,DiagnosisCode,DiagnosisCodeSystem,DiagnosisCodeSystemName,DiagnosisCodeDisplayName,DiagnosisStatusCode,DiagnosisEncounterNumber"
    }

    Set html = ""

    For i=1:1:$Length(fields, ",") {
        Set field = $ZStrip($Piece(fields, ",", i), "*W") 

        Set html = html _ "<button class='collapsible' onclick='zenPage.toggleCollapsible(this)'>" _ field _ "</button>"
        Set html = html _ "<div class='content'>"
        Set html = html _ "<table class='report-table'><tr><th>Value</th><th>Occurrences</th><th>XPath</th><th>SDA Mapping</th></tr>"

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
        }  ElseIf reportType = "diagnosis" {
            Set queryString = "SELECT "_field_" AS Value, COUNT(*) AS Occurrences, XPath " _
                              "FROM LEADNorth_CDAProfiler_Sections.CCDDiagnosis WHERE ProfileID = ? " _
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
            } 

            Set html = html _ "<tr><td>" _ value _ "</td><td>" _ occurrences _ "</td><td>" _ xPath _ "</td><td>" _ "<SDAPATH>" _ "</td></tr>"
        }

        Set html = html _ "</table></div>"  
    }

    Quit html
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

}
