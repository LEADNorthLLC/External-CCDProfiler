## Installation Instructions

### Deploy Frontend Files
- Copy the contents of `Angular/dist/ln-dpt/browser` into your CSP folder (e.g., `C:\InterSystems\HealthShareDemo\CSP\user\LeadNorth`).

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
  - Under **CSP Files Physical Path**, specify the path to your installed `index.html` file (from step 1)

#### REST Web Application(see https://github.com/LEADNorthLLC/CCDProfiler/blob/main/IRIS/WebService.png)
- **Name:** `/csp/LeadNorth/api`
- **Description:** `LEAD North CCD Profiling Tool APIs`
- **Dispatch class:** `LEADNorth.REST.Handler`
  
