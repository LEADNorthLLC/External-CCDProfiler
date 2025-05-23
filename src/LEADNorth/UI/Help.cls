/// Created using the page template: Default
Class LEADNorth.UI.Help Extends %ZEN.Component.page
{

/// Class name of application this page belongs to.
Parameter APPLICATION = "LEADNorth.CDAProfiler";

/// Displayed name of this page.
Parameter PAGENAME = "Help";

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
  .section {
    margin-bottom: 30px;
    font-family: var(--font_8);
  }
  .section h2 {
    color: #2c3e50;
    margin-bottom: 10px;
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
<page xmlns="http://www.intersystems.com/zen" title="Help">
  <html>

    <div class="navbar">
      <a href="LEADNorth.UI.Index.cls">Dashboard</a>
      <a href="LEADNorth.UI.DataImporter.cls">Import Data</a>
      <a href="LEADNorth.UI.Reports.cls">Reports</a>
      <a href="LEADNorth.UI.Settings.cls">Settings</a>
      <a href="LEADNorth.UI.Help.cls">Help</a>
    </div>

    <div class="container">
      <h1>Help / Documentation</h1>
      
      <div class="section" id="getting-started">
        <h2>Getting Started</h2>
        <p>This section will provide an overview of how to begin using the CDA Profiler tool, including initial setup and basic navigation.</p>
      </div>
      
      <div class="section" id="importing-data">
        <h2>Importing Data</h2>
        <p>Instructions on how to import data files into the system. This section will cover supported file formats, how to use the import tool, and troubleshooting tips.</p>
      </div>
      
      <div class="section" id="generating-reports">
        <h2>Generating Reports</h2>
        <p>Guide to generating and interpreting reports. Details will include customizing report templates, exporting reports, and analyzing data.</p>
      </div>

      <div class="section" id="system-settings">
        <h2>System Settings</h2>
        <p>Overview of the various settings available in the CDA Profiler. This section will explain how to configure system preferences, user roles, and other administrative tasks.</p>
      </div>

      <div class="section" id="troubleshooting-faq">
        <h2>Troubleshooting / FAQ</h2>
        <p>This section will provide solutions to common issues and answer frequently asked questions.</p>
      </div>
    </div>

    <div class="footer">
      <p>2024 by LEAD North LLC</p>
    </div>

  </html>
</page>
}

}
