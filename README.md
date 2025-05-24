# Installation Instructions

## Option 1(Manual Installation):
### Deploy Frontend Files
- Copy the contents of `Angular/dist/ln-dpt/browser` into your desired CSP folder (e.g., `C:\InterSystems\HealthShareDemo\CSP\user\LeadNorth`).

### Import Classes
- Import the class definitions by loading the file `IRIS/LEADNorth.xml` into your InterSystems IRIS instance.

### Configure Web Applications

#### CSP/ZEN Web Application(see https://github.com/LEADNorthLLC/CCDProfiler/blob/main/IRIS/APIWebService.png)
- **Name:** `/csp/LeadNorth`
- **Description:** `LEAD North CCD Profiling Tool`
- **Settings to configure:**
  - **Enable Application:** Checked
  - **Inbound Web Services:** Enabled
  - Under **Security Settings**, select your desired authentication methods
  - Under **CSP Files Physical Path**, specify the path to your installed `index.html` file (from "Deploy Frontend Files")

#### REST Web Application(see https://github.com/LEADNorthLLC/CCDProfiler/blob/main/IRIS/WebService.png)
- **Name:** `/csp/LeadNorth/api`
- **Description:** `LEAD North CCD Profiling Tool APIs`
- **Dispatch class:** `LEADNorth.REST.Handler`

- Open the tool by navigating to http://[server]:[port]/csp/LeadNorth/index.html#/index
  
## Option 2(ZPM/IPM):
- Download this repository as a zip file.
- Extract all contents to a folder on your machine.
- In terminal, open the ZPM shell and enter the following: load <path to extracted folder>
- Open the tool by navigating to http://[server]:[port]/csp/LeadNorth/index.html#/index


# Getting Started
1. Within the repository, there is a sample CCD(PHI safe)
2. Goto this page http://[server]:[port]/csp/LeadNorth/index.html#/index and enter the directory where the sample file exists and provide a profile name. Click Start Import...
3. Once the import is complete, you can view a quick summary on the home page, or you can navigate to the Reports section to get a more detailed breakdown of the data. From there, you can export the report to an excel sheet.
