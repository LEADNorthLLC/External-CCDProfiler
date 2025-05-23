/// Created using the page template: Default
Class LEADNorth.UI.DataImporter Extends %ZEN.Component.page
{

/// Class name of application this page belongs to.
Parameter APPLICATION = "LEADNorth.CDAProfiler";

/// Displayed name of this page.
Parameter PAGENAME = "Data Importer";

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
    font-family: var(--font_8);
  }
  .navbar a {
    color: white;
    text-decoration: none;
    padding: 0 15px;
    font-family: var(--font_8);
  }
  .navbar a:hover {
    background-color: #34495e;
    border-radius: 4px;
  }
  .container {
    padding: 20px;
    font-family: var(--font_8);
  }
  .form-group {
    margin-bottom: 15px;
    font-family: var(--font_8);
  }
  .form-group label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
    font-family: var(--font_8);
  }
  .form-group input[type="file"],
  .form-group input[type="text"],
  .form-group select,
  .form-group button {
    width: 100%;
    padding: 10px;
    font-size: 16px;
    margin-top: 5px;
    font-family: var(--font_8);
  }
  .footer {
    background-color: #2c3e50;
    color: white;
    text-align: center;
    padding: 15px;
    position: fixed;
    bottom: 0;
    width: 100%;
    font-family: var(--font_8);
  }
</style>
}

/// This XML block defines the contents of this page.
XData Contents [ XMLNamespace = "http://www.intersystems.com/zen" ]
{
<page xmlns="http://www.intersystems.com/zen" title="Import Data">
  <html>

    <div class="navbar">
      <a href="LEADNorth.UI.Index.cls">Dashboard</a>
      <a href="LEADNorth.UI.DataImporter.cls">Import Data</a>
      <a href="LEADNorth.UI.Reports.cls">Reports</a>
      <a href="LEADNorth.UI.Settings.cls">Settings</a>
      <a href="LEADNorth.UI.Help.cls">Help</a>
    </div>

    <div class="container">
      <h1>Import Data</h1>
      <p>Select the data source you wish to import from.</p>

      <div class="form-group">
        <label for="importType">Select Import Type:</label>
        <select id="importType" onchange="zenPage.updateImportType()">
          <option value="bulk">Bulk Import</option>
          <option value="api">API Import</option>
          <option value="database">Database Import</option>
        </select>
      </div>

      <div class="form-group" id="bulkImportInputs">
        <label for="directoryPath">Enter Directory Path:</label>
        <input type="text" id="directoryPath" placeholder="Enter directory path for bulk import"/>
      </div>

      <div class="form-group" id="apiImportInputs" style="display:none;">
        <label for="fileUpload">Select Files to Upload:</label>
        <input type="file" id="fileUpload"/>
      </div>

      <div class="form-group" id="databaseImportInputs" style="display:none;">
        <label for="numDocuments">Number of Documents to Import:</label>
        <input type="number" id="numDocuments" placeholder="Enter number of documents to import" min="1"/>
        <label for="filterDocuments">Filter ID on:</label>
        <input id="filterDocuments" placeholder=""/>
      </div>

      <div class="form-group" id="profileIDInput">
        <label for="profileID">Enter Profile Name:</label>
        <input type="text" id="profileID" placeholder="Enter profile name"/>
      </div>

      <div class="form-group">
        <button type="button" onclick="zenPage.startImport()">Start Import</button>
      </div>

      <div id="importResult"></div>
    </div>

    <div class="footer">
      <p>2024 by LEAD North LLC</p>
    </div>

  </html>
</page>
}

ClientMethod updateImportType() [ Language = javascript ]
{
    var importType = document.getElementById("importType").value;

    document.getElementById("bulkImportInputs").style.display = "none";
    document.getElementById("apiImportInputs").style.display = "none";
    document.getElementById("databaseImportInputs").style.display = "none";

    if (importType === "bulk") {
        document.getElementById("bulkImportInputs").style.display = "block";
    } else if (importType === "api") {
        document.getElementById("apiImportInputs").style.display = "block";
    } else if (importType === "database") {
        document.getElementById("databaseImportInputs").style.display = "block";
    }
}

ClientMethod startImport() [ Language = javascript ]
{
    var importType = document.getElementById("importType").value;
    var profileID = document.getElementById("profileID").value;

    var profileIDPattern = /^[a-zA-Z0-9]+$/;

    if (!profileID) {
        alert("You must enter a profile name.");
        return;
    }

    if (!profileIDPattern.test(profileID)) {
        alert("Profile name can only contain letters and numbers.");
        return;
    }

    if (importType === "bulk") {
        var directoryPath = document.getElementById("directoryPath").value;

        if (!directoryPath) {
            alert("You must enter a directory path for bulk import.");
            return;
        }

        directoryPath = directoryPath.replace(/"/g, ''); // sanitize

        console.log("Starting bulk import for directory: " + directoryPath + " and profile: " + profileID);

        zenPage.processImport(directoryPath, profileID, importType, "", function(response) {
            console.log("Bulk import response: ", response);
            try {
                var responseObj = JSON.parse(response);
                if (responseObj.message) {
                    document.getElementById("importResult").innerHTML = "<p>" + responseObj.message + "</p>";
                } else {
                    document.getElementById("importResult").innerHTML = "<p>Import completed successfully.</p>";
                }
            } catch (ex) {
                alert("Error parsing the response: " + ex.message);
                console.error(ex);
            }
        });
    } else if (importType === "api") {
        var fileInput = document.getElementById("fileUpload");

        if (fileInput.files.length === 0) {
            alert("Please select one or more files to upload.");
            return;
        }

        var files = [];
        for (var i = 0; i < fileInput.files.length; i++) {
            files.push(fileInput.files[i].name);
        }
        var filesStr = files.join(',');

        console.log("Starting API import for files: " + filesStr + " and profile: " + profileID);

        zenPage.processImport(filesStr, profileID, importType, "", function(response) {
            console.log("API import response: ", response);
            try {
                var responseObj = JSON.parse(response);
                if (responseObj.message) {
                    document.getElementById("importResult").innerHTML = "<p>" + responseObj.message + "</p>";
                } else {
                    document.getElementById("importResult").innerHTML = "<p>API import completed successfully.</p>";
                }
            } catch (ex) {
                alert("Error parsing the response: " + ex.message);
                console.error(ex);
            }
        });
    } else if (importType === "database") {
        var numDocuments = document.getElementById("numDocuments").value;
        var filterDocuments = document.getElementById("filterDocuments").value;

        if (!numDocuments || numDocuments <= 0) {
            alert("You must enter a valid number of documents to import.");
            return;
        }

        console.log("Starting database import for " + numDocuments + " documents and profile: " + profileID);

        zenPage.processImport("", profileID, importType, numDocuments, filterDocuments, function(response) {
            console.log("Database import response: ", response);
            try {
                var responseObj = JSON.parse(response);
                if (responseObj.message) {
                    document.getElementById("importResult").innerHTML = "<p>" + responseObj.message + "</p>";
                } else {
                    document.getElementById("importResult").innerHTML = "<p>Database import completed successfully.</p>";
                }
            } catch (ex) {
                alert("Error parsing the response: " + ex.message);
                console.error(ex);
            }
        });
    }
}

ClientMethod sendImportRequest(formData, importType) [ Language = javascript ]
{
    zenPage.processImport(formData, importType)("processImport", {
        formData: formData,
        importType: importType
    }, function(response) {
        if (response.status === "success") {
            alert("Import completed successfully.");
        } else {
            alert("Import failed: " + response.error);
        }
    });
}

ClassMethod processImport(importData As %String, profileID As %String, importType As %String, numDocuments As %Integer = 0, filterDocuments As %String) As %String [ ZenMethod ]
{
    Try {
        If importType = "bulk" {
            Set directoryPath = importData

            Set sc = ##class(LEADNorth.CDAProfiler.CCDProcessor).ProcessCCDDirectory(directoryPath, profileID)
            If $$$ISERR(sc) {
                Return {"message":"Bulk import failed.error"}
            }

            Return {"message":"Bulk import completed successfully."}.%ToJSON()
        }
        ElseIf importType = "api" {
            Set files = $ListFromString(importData, ",")

            For i=1:1:$ListLength(files) {
                Set fileName = $ListGet(files, i)
                Set sc = ##class(LEADNorth.CDAProfiler.CCDProcessor).ProcessCCD(fileName, profileID)
                If $$$ISERR(sc) {
                    Return {"message":"API import failed. error"}
                }
            }

            Return {"message":"API import completed successfully."}.%ToJSON()
        }
        ElseIf importType = "database" {
            If numDocuments <= 0 {
                Return {"message":"Invalid number of documents specified."}.%ToJSON()
            }

            Set sc = ##class(LEADNorth.CDAProfiler.CCDProcessor).ProcessLatestCCDs(numDocuments, profileID, filterDocuments)
            If $$$ISERR(sc) {
                Return {"message":"Database import failed. error"}
            }

            Return {"message":"Database import completed successfully."}.%ToJSON()
        }
    } Catch ex {
        Return {"message":"An error occurred during import. error"}
    }
}

}
