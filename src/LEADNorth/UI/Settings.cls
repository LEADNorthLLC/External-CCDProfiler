Class LEADNorth.UI.Settings Extends %ZEN.Component.page
{

/// Class name of application this page belongs to.
Parameter APPLICATION = "LEADNorth.CDAProfiler";

/// Displayed name of this page.
Parameter PAGENAME = "Settings";

/// Domain used for localization.
Parameter DOMAIN = "LEADNorth.CDAProfiler";

/// This Style block contains page-specific CSS style definitions.
XData Style
{
<style type="text/css">
  body {
    font-family: var(--font_8);
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
  .section {
    margin-bottom: 30px;
  }
  .section h2 {
    color: #2c3e50;
    margin-bottom: 10px;
  }
  .container {
    padding: 20px;
    padding-bottom: 80px;
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
  .form-group {
    margin-bottom: 15px;
  }
  .form-group label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
  }
  .form-group select, .form-group button, .form-group input[type="file"] {
    width: 100%;
    padding: 10px;
    font-size: 16px;
    margin-top: 5px;
  }
  .editable-div {
    width: 100%;
    min-height: 150px;
    border: 1px solid #ccc;
    padding: 10px;
    font-size: 16px;
    white-space: pre-wrap;
    overflow-wrap: break-word;
    background-color: #fff;
  }
  .response-box {
    width: 100%;
    min-height: 150px;
    border: 1px solid #2c3e50;
    background-color: #e8f5e9;
    padding: 10px;
    font-size: 16px;
    color: #2c3e50;
    overflow-y: auto;
    white-space: pre-wrap;
    word-wrap: break-word;
  }
  #chatInput {
	width: 50%;
    min-height: 25px;
    border: 1px solid #2c3e50;
    background-color: white;
    padding: 10px;
    font-size: 16px;
    color: #2c3e50;
    overflow-y: auto;
    white-space: pre-wrap;
    word-wrap: break-word;
  }
  #submitQuestion {
	  width: 25%;
  }
  .loader {
  border: 16px solid #f3f3f3; 
  border-top: 16px solid #3498db;
  border-radius: 50%;
  width: 120px;
  height: 120px;
  animation: spin 2s linear infinite;
  margin: 0 auto;
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

#successBanner {
	display: none;
  position: fixed;
  bottom: 50%;
    left: 37.5%;
    width: 25%;
  background-color: #4CAF50;
  color: white;
  text-align: center;
  padding: 15px;
  font-size: 18px;
  transition: bottom 0.5s ease-in-out; 
}

#successBanner.show {
  display: block;
}

</style>
}

/// This XML block defines the contents of this page.
XData Contents [ XMLNamespace = "http://www.intersystems.com/zen" ]
{
<page xmlns="http://www.intersystems.com/zen" title="Settings">
  <html>

    <div class="navbar">
      <a href="LEADNorth.UI.Index.cls">Dashboard</a>
      <a href="LEADNorth.UI.DataImporter.cls">Import Data</a>
      <a href="LEADNorth.UI.Reports.cls">Reports</a>
      <a href="LEADNorth.UI.Settings.cls">Settings</a>
      <a href="LEADNorth.UI.Help.cls">Help</a>
    </div>

    <div class="container">
      <h1>Settings</h1>
      
      <div class="section" id="xslt-editor">
        <h2>Edit XSLT XPath Expressions</h2>
        <div class="form-group">
          <label for="xsltBlock">Select XSLT Block:</label>
          <select id="xsltBlock" name="xsltBlock" onchange="zenPage.loadXSLTContent()">
            <option value="MetadataXSLT">MetadataXSLT</option>
            <option value="AllergyXSLT">AllergyXSLT</option>
            <option value="MedicationsXSLT">MedicationsXSLT</option>
            <option value="ProblemsXSLT">ProblemsXSLT</option>
            <option value="ProceduresXSLT">ProceduresXSLT</option>
            <option value="ResultsXSLT">ResultsXSLT</option>
            <option value="VitalSignsXSLT">VitalSignsXSLT</option>
            <option value="ImmunizationsXSLT">ImmunizationsXSLT</option>
            <option value="PlanOfCareXSLT">PlanOfCareXSLT</option>
            <option value="SocialHistoryXSLT">SocialHistoryXSLT</option>
            <option value="FunctionalStatusXSLT">FunctionalStatusXSLT</option>
            <option value="FamilyHistoryXSLT">FamilyHistoryXSLT</option>
            <option value="AdvanceDirectiveXSLT">AdvanceDirectiveXSLT</option>
            <option value="EncounterXSLT">EncounterXSLT</option>
            <option value="PayerXSLT">PayerXSLT</option>
            <option value="PatientXSLT">PatientXSLT</option>
            <option value="DiagnosisXSLT">DiagnosisXSLT</option>
            <option value="ImplantsXSLT">ImplantsXSLT</option>
            <option value="GoalsXSLT">GoalsXSLT</option>
            <option value="EncompassingEncounterXSLT">EncompassingEncounterXSLT</option>
          </select>
        </div>
        <div class="form-group">
          <label for="xpathContent">Edit XPath Expressions:</label>
          <div id="xpathContent" class="editable-div" contenteditable="true"></div>
        </div>
        
        <div class="form-group">
          <button type="button" onclick="zenPage.saveXPaths()">Save XPaths</button>
        </div>
        <div class="form-group">
          <label for="sampleData">Path to CCD:</label>
          <input id="sampleData" name="sampleData" onchange=""/>
        </div>
        <div class="form-group">
          <button type="button" onclick="zenPage.applyXSLT()">Apply XSLT</button>
        </div>
        <div class="form-group">
          <label for="transformedOutput">Transformed Output:</label>
          <div id="transformedOutput" class="response-box"></div>
        </div>
      <!--<div class="section" id="chatgpt-section">
        <h2>Chat with ChatGPT</h2>
        <div class="form-group">
          <label for="chatInput">Ask anything to ChatGPT:</label>
          <input id="chatInput" placeholder="Type your question here..."></input>
          <button id="submitQuestion" type="button" onclick="zenPage.askChatGPT()">Submit</button>
        </div>
        <div class="form-group">
          <label for="chatResponse">Response from ChatGPT:</label>
          <div id="chatResponse" class="response-box"></div>
        </div>
      </div>-->
        <div class="form-group">
          <label for="profileIDSelect">Select ProfileID to Delete Data:</label>
          <select id="profileIDSelect" name="profileIDSelect">
            <option value="" >Select Profile ID</option>
          </select>
        </div>
        <div class="form-group">
          <button type="button" onclick="zenPage.deleteProfileData()">Delete Data for Selected ProfileID</button>
        </div>

        <div class="form-group">
          <button type="button" onclick="zenPage.deleteAllData()">Delete All Data</button>
        </div>
      
      </div>
      <div id="successBanner">XSLT file saved successfully!</div>
    </div>


    <div class="footer">
      <p>2024 by LEAD North LLC</p>
    </div>

  </html>
</page>
}

ClientMethod deleteProfileData() [ Language = javascript ]
{
    var profileID = document.getElementById('profileIDSelect').value;

    if (!profileID) {
        alert('Please select a Profile ID.');
        return;
    }

    profileID = encodeURIComponent(profileID);

    var confirmation = confirm("Are you sure you want to delete all data for Profile ID " + decodeURIComponent(profileID) + "? This action cannot be undone.");
    
    if (confirmation) {
        var response = zenPage.DeleteDataByProfile(profileID);
        alert(response);
    }
    var profileIDOptions = zenPage.PopulateProfileIDs();
    document.getElementById("profileIDSelect").innerHTML = profileIDOptions;
}

ClientMethod deleteAllData() [ Language = javascript ]
{
    var confirmation = confirm("Are you sure you want to delete all data? This action cannot be undone.");
    if (confirmation) {
        var response = zenPage.DeleteAllData2();
        alert(response);
    }
    var profileIDOptions = zenPage.PopulateProfileIDs();
    document.getElementById("profileIDSelect").innerHTML = profileIDOptions;
}

ClassMethod DeleteDataByProfile(profileID As %String) As %String [ ZenMethod ]
{
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

        Return "Data successfully deleted for ProfileID: "_profileID
    } Catch ex {
        Return "Error deleting data for ProfileID: "_profileID_" - "_ex.DisplayString()
    }
}

/// Server-side method to delete all data.
ClassMethod DeleteAllData2() As %String [ ZenMethod ]
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

        Return "All data successfully deleted."
    } Catch ex {
        Return "Error deleting all data: "_ex.DisplayString()
    }
}

/// Server-side method to populate ProfileIDs in the dropdown.
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
    
    Return html
}

/// Client-side JavaScript methods for handling content.
ClientMethod applyXSLT() [ Language = javascript ]
{
    var ccdPath = document.getElementById('sampleData').value;
    var xsltBlock = document.getElementById('xsltBlock').value;
	ccdPath = ccdPath.replace(/"/g, '');
	var response = zenPage.ApplyXSLTToCCD(ccdPath, xsltBlock);
	document.getElementById('transformedOutput').innerText = response;
}

ClassMethod ApplyXSLTToCCD(ccdFilePath As %String, xsltBlock As %String) As %Stream.GlobalCharacter [ ZenMethod ]
{
    Set ccdStream = ##class(LEADNorth.CDAProfiler.CCDProcessor).FileToStream(ccdFilePath, xsltBlock)
    
    If ccdStream = "" {
        Quit "Error: Failed to load CCD file or apply XSLT."
    }
    
    Set transformedOutput = ccdStream.Read()
    While 'ccdStream.AtEnd {
        Set transformedOutput = transformedOutput _ ccdStream.Read()
    }
    
    Quit transformedOutput
}

ClientMethod loadXSLTContent() [ Language = javascript ]
{
    var xsltBlock = document.getElementById('xsltBlock').value; 
    var response = zenPage.GetXSLTContent(xsltBlock)
        document.getElementById('xpathContent').innerText = response;
}

ClientMethod saveXPaths() [ Language = javascript ]
{
    var xsltBlock = document.getElementById('xsltBlock').value;
    var xpathContent = document.getElementById('xpathContent').innerText;

    var confirmation = confirm("Are you sure you want to overwrite the XSLT content for block " + xsltBlock + "? This action cannot be undone.");

    if (confirmation) {
        var response = zenPage.SaveXSLTContent(xsltBlock, xpathContent) 
            //alert(response);
            zenPage.showSuccessBanner();
            
    } else {
        alert("Save action canceled.");
    }
}

ClientMethod showSuccessBanner() [ Language = javascript ]
{
    var banner = document.getElementById("successBanner");
    banner.classList.add("show");

    setTimeout(function() {
        banner.classList.remove("show");
    }, 3000);
}

ClientMethod onloadHandler() [ Language = javascript ]
{
    var profileIDOptions = zenPage.PopulateProfileIDs();
    document.getElementById("profileIDSelect").innerHTML = profileIDOptions;
    zenPage.loadXSLTContent();
}

/// Server-side method to retrieve XSLT content for the selected block.
ClassMethod GetXSLTContent(xsltBlock As %String) As %String [ ZenMethod ]
{
    Set className = "LEADNorth.CDAProfiler.XSLT.CDAParser" // Target class name
    Set xdata = ##class(%Dictionary.XDataDefinition).IDKEYOpen(className, xsltBlock)
    If xdata = $$$NULLOREF {
        Quit "XData block not found!"
    }
    Quit xdata.Data.Read()
}

ClassMethod SaveXSLTContent(xsltBlock As %String, xpathContent As %String) As %String [ ZenMethod ]
{
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

/*
ClientMethod askChatGPT() [ Language = javascript ]
{
    document.getElementById('chatResponse').innerHTML = '<div class="loader"></div>';

    setTimeout(function() {
        var question = document.getElementById('chatInput').value;
        var answer = null;
        var xSLT = document.getElementById('xpathContent').innerText;

        var answer = zenPage.ChatGPTAPI(question, xSLT);

        try {
            var jsonResponse = JSON.parse(answer);

            if (jsonResponse.choices && jsonResponse.choices.length > 0) {
                answer = jsonResponse.choices[0].message.content;
            } else {
                answer = "Error: No valid response from ChatGPT.";
            }
        } catch (e) {
            answer = "Error parsing response: " + answer;
        }

        console.log(answer);

        answer = answer.replace(/```xml/g, "").replace(/```/g, "");

        document.getElementById('chatResponse').innerText = answer;

    }, 100);
}

ClassMethod ChatGPTAPI(question As %String, xSLT As %String) As %String [ ZenMethod ]
{
    Set apiKey = "your key"
    Set apiUrl = "https://api.openai.com/v1/chat/completions"
    Set request = ##class(%Net.HttpRequest).%New()
    Set request.Server = "api.openai.com"
    Set request.SSLConfiguration = "ChatGPT"  
    Set request.Https = 1  // Use HTTPS
    Set request.ContentType = "application/json"
    Set request.Timeout = "60"
    Do request.SetHeader("Authorization", "Bearer "_apiKey)
    

    Set prompt = "The user asks: "_question_"For your own reference, this is the XSLT the user is viewing, if relevant to their question:"_xSLT_". Be sure to use the correct prefix. And do not omit any code. Write out the full responses."

    Set jsonRequest = ##class(%DynamicObject).%New()
    Set jsonRequest.model = "gpt-4"

    Set messagesArray = ##class(%DynamicArray).%New()
    
    Set systemMessage = ##class(%DynamicObject).%New()
    Set systemMessage.role = "system"
    Set systemMessage.content = "You are a helpful assistant."
    Do messagesArray.%Push(systemMessage)

    Set userMessage = ##class(%DynamicObject).%New()
    Set userMessage.role = "user"
    Set userMessage.content = prompt
    Do messagesArray.%Push(userMessage)

    Set jsonRequest.messages = messagesArray

    Do request.EntityBody.Write(jsonRequest.%ToJSON())

    Set status = request.Post("/v1/chat/completions")
    If $$$ISERR(status) {
        Return "Error sending request to ChatGPT API: "_$System.Status.GetErrorText(status)
    }

    Set responseBody = request.HttpResponse.Data.Read()
    

    Try {
	    Return responseBody
        Set responseJSON = {}.%FromJSON(responseBody)

        If $IsObject(responseJSON.choices) {
            Set chatResponse = responseJSON.choices.GetAt(1).message.content
            Write "ChatGPT response: "_chatResponse
        } Else {
            Write "Error: Invalid response format from ChatGPT."
        }
    } Catch ex {
        Write "Error: Invalid JSON format received from ChatGPT. Raw response: "_responseBody
    }
}
*/
}
