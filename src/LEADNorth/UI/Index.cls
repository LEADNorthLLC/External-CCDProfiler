/// Created using the page template: Default
Class LEADNorth.UI.Index Extends %ZEN.Component.page
{

/// Class name of application this page belongs to.
Parameter APPLICATION = "LEADNorth.CDAProfiler";

/// Displayed name of this page.
Parameter PAGENAME = "CDA Profiler Dashboard";

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
  .dashboard {
    display: flex;
    flex-wrap: wrap;
    font-family: var(--font_8);
  }
  .widget {
    background-color: white;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    margin: 10px;
    padding: 15px;
    flex: 1;
    min-width: 300px;
    font-family: var(--font_8);
  }
  .widget h3 {
    margin-top: 0;
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
<page xmlns="http://www.intersystems.com/zen" title="CDA Profiler Dashboard">
  <html>

    <div class="navbar">
      <a href="LEADNorth.UI.Index.cls">Dashboard</a>
      <a href="LEADNorth.UI.DataImporter.cls">Import Data</a>
      <a href="LEADNorth.UI.Reports.cls">Reports</a>
      <a href="LEADNorth.UI.Settings.cls">Settings</a>
      <a href="LEADNorth.UI.Help.cls">Help</a>
    </div>

    <div class="container">
      <h1>Welcome to the CDA Profiler Dashboard</h1>
      
      <div class="dashboard">

        <div class="widget" id="data-quality-widget">
          <h3>Data Quality Summary</h3>
          <div id="data-quality-chart">[Data Quality Chart]</div>
        </div>

        <div class="widget" id="import-status-widget">
          <h3>Recent Imports</h3>
          <ul id="import-list">
            <li>Import 1 - Success</li>
            <li>Import 2 - Failed</li>
            <li>Import 3 - In Progress</li>
          </ul>
        </div>

        <div class="widget" id="validation-results-widget">
          <h3>Validation Results</h3>
          <table>
            <thead>
              <tr>
                <th>Document</th>
                <th>Status</th>
                <th>Errors</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>Document 1</td>
                <td>Valid</td>
                <td>0</td>
              </tr>
              <tr>
                <td>Document 2</td>
                <td>Invalid</td>
                <td>3</td>
              </tr>
              <tr>
                <td>Document 3</td>
                <td>Valid</td>
                <td>0</td>
              </tr>
            </tbody>
          </table>
        </div>

        <div class="widget" id="reports-widget">
    <h3>Recent Reports</h3>
    <ul id="report-list">
    </ul>
</div>


      </div> 
    </div> 

    <div class="footer">
      <p>2024 by LEAD North LLC</p>
    </div>

  </html>
</page>
}

ClientMethod onloadHandler() [ Language = javascript ]
{
    zenPage.populateReports();
}

ClassMethod GetDistinctProfileIDs() As %String [ ZenMethod ]
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
        
        Set html = html _ "<li><a href='LEADNorth.UI.Reports.cls?profileID="_profileID_"'>Report for Profile "_profileID_" - Generated on "_reportDate_"</a></li>"
    }
    
    Return html
}

ClientMethod populateReports() [ Language = javascript ]
{
    var reportLinks = zenPage.GetDistinctProfileIDs();
    
    document.getElementById("reports-widget").innerHTML = "<h3>Recent Reports</h3><ul>" + reportLinks + "</ul>";
}

}
