Class LEADNorth.CDAProfiler.Sections.CCDDocument Extends %Persistent
{

Property DocumentID As %Integer [ Identity, Required ];

Property ProfileID As %String [ Required ];

Property PatientID As %String(MAXLEN = 255);

Property DocumentType As %String(MAXLEN = 255);

Property DocumentDate As %Date;

/// Property used to track which of the profiled sections are present
Property SectionsPresent As %String(MAXLEN = 1000);

/// Property used to track all sections that are present
Property AllSections As %String(MAXLEN = 1000);

/// Property to determine which sections have encounter numbers
Property SectionsWithEncounterNumbers As %String(MAXLEN = 32000);

Property XPath As %String(MAXLEN = 255);

Property CreatedAt As %TimeStamp [ InitialExpression = {$zdatetime($horolog,3,1)}, ReadOnly ];

/// do ##class(LEADNorth.CDAProfiler.Sections.CCDDocument).GetUniqueSections("YK")
ClassMethod GetUniqueSections(pProfileID As %String = "") As %String
{
    If pProfileID = "" {
        Quit "ProfileID cannot be null"
    }

    Set sql = "SELECT AllSections FROM LEADNorth_CDAProfiler_Sections.CCDDocument WHERE ProfileID = ?"
    Set stmt = ##class(%SQL.Statement).%New()
    Set sc = stmt.%Prepare(sql)
    If sc '= $$$OK {
        Quit "SQL prepare failed: "_$SYSTEM.Status.GetErrorText(sc)
    }

    Set rs = stmt.%Execute(pProfileID)
    If rs.%SQLCODE '= 0 {
        Quit "SQL execute failed: "_rs.%Message
    }

    Kill seen, display
    While rs.%Next() {
        Set raw = rs.%Get("AllSections")
        Continue:raw=""

        For i=1:1:$L(raw, ",") {
            Set part = $ZStrip($P(raw, ",", i), "<>W")
            Continue:part=""

            Set base   = $ZStrip($P(part, "(", 1), "<>W")
            Continue:base=""
            Set norm   = $ZConvert(base, "L")
            Continue:norm=""

            Set status = $Piece($Piece(part, "(", 2), ")", 1)

            If '$D(seen(norm)) {
                If $ZConvert(status, "L")="has data" {
                    Set seen(norm)=1
                    Set display(norm)=base_"(has data)"
                } Else  {
                    Set seen(norm)=0
                    Set display(norm)=base_"(no data)"
                }
            } Else {
                // upgrade a 'no data' to 'has data' if it appears later
                If 'seen(norm), $ZConvert(status, "L")="has data" {
                    Set seen(norm)=1
                    Set display(norm)=base_"(has data)"
                }
            }
        }
    }

    Set out = ""
    Set key = ""
    For  {
        Set key = $Order(display(key))
        Quit:key=""
        Set out = out_", "_display(key)
    }
    If $Extract(out,1)="," Set out=$Extract(out,2,*)
    Quit out
}

Storage Default
{

}

}
