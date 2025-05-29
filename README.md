# About
LEAD North's CCD Profiler is a full-stack tool for profiling and analyzing CCDA documents leveraging InterSystems technology. Designed for healthcare developers and data analysts, this tool simplifies the process of importing, parsing, validating, and exporting CCD data.

It supports both manual and automated (ZPM/IPM) installation, offers a dynamic Angular-based frontend, and enables users to manage XSLT transformations directly from the browser. The profiler generates summary dashboards and configurable Excel exports, making it ideal for quality assurance, data completeness checks, and interoperability validation.

# Installation Instructions

## Option 1(Manual Installation):
### Deploy Frontend Files
- Copy the contents of `Angular/dist/ln-dpt/browser` into your desired CSP folder (e.g., `C:\InterSystems\HealthShareDemo\CSP\user\LeadNorth`).

### Import Classes
- Import the class definitions by loading the file `IRIS/LEADNorth.xml` into your InterSystems IRIS instance.

### Configure Web Applications

#### CSP/ZEN Web Application(see https://github.com/LEADNorthLLC/External-CCDProfiler/blob/main/IRIS/WebService.png)
- **Name:** `/csp/LeadNorth`
- **Description:** `LEAD North CCD Profiling Tool`
- **Settings to configure:**
  - **Enable Application:** Checked
  - **Inbound Web Services:** Enabled
  - Under **Security Settings**, select your desired authentication methods
  - Under **CSP Files Physical Path**, specify the path to your installed `index.html` file (from "Deploy Frontend Files")

#### REST Web Application(see https://github.com/LEADNorthLLC/External-CCDProfiler/blob/main/IRIS/APIWebService.png)
- **Name:** `/csp/LeadNorth/api`
- **Description:** `LEAD North CCD Profiling Tool APIs`
- **Dispatch class:** `LEADNorth.REST.Handler`

- Open the tool by navigating to http://[server]:[port]/csp/LeadNorth/index.html#/index
  
## Option 2(ZPM/IPM):
- Download this repository as a zip file.
- Extract all contents to a folder on your machine.
- In terminal, open the ZPM shell and enter the following: load "path-to-your-folder"
- Open the tool by navigating to http://[server]:[port]/csp/LeadNorth/index.html#/index
- NOTE: If installing version 1.0.0 from the Open Exchange, you must install the tool in the "USER" namespace. This issue has been fixed in later versions. For the latest, visit the Github repo


# Getting Started

## Home Page
On the home page, you can begin importing CCD data. There are two current options for doing so. You can upload CCD's from a directory containing the xml files. If you are using UCR and have loaded CCD's into the repository, you can pull documents from there using the "Repository Import." Within the Start Import button, you will notice a settings icon. Click on this to customize your import! You can choose which sections you would like to profile or not profile. Once you are ready, simply click Start Import. When your report has been generated, you will see a card pop up below in the "Summary of Imported CCDA Data" section. This card will tell you what sections were profiled in your report(as a percentage).

## Reports Page
On the Reports page, you can view the data that was imported/profiled. Click on a section to expand the details and see the values for the individual fields. **NOTE: Metadata is not an actual section that was profiled. Instead, it contains information on all of the sections contained within the CCD's and which of those contain actual data(some sections are sent but not populated with any data, as is indicated by [section](no data))**. Any fields/sections that were not found will be grey, indicating that they were never encountered. Optionally, you can export the data to an Excel spreadsheet. Similar to imports, exports allow you to configure which sections you would like to include in the Excel spreadsheet. There is also an option to deidentify typical fields that contain PHI/identifying information. As is noted, this is not a 100% guarantee that all PHI will be removed. **To avoid issues with PHI, please review your data if you intend to share the export.**

## Configuration Page
The configuration page allows users to interact with the backend from the frontend. There are three tabs/pages here: Edit XSLT, Test XSLT, and Manage Data. Each section that is profiled has an associated XSLT block that is used to extract data from the CCD documents. On the Edit XSLT tab, users can quickly modify Xpaths for a certain field in a section. For example, if MRN's are coming in a different field, users can modify the Xpath on the fly to capture that data. The next tab, Test XSLT, allows users to validate the XSLT against a CCD and view the output. This is especially helpful when making changes via the frontend. Manage Data allows the user to delete generated profiling reports 1 by 1 or to erase all data at once. **NOTE: this action cannot be undone, proceed with caution!**
