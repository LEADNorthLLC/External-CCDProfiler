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
            Set norm = $ZCONVERT(part, "L")
            If '$D(seen(norm)) {
                Set seen(norm) = 1
                Set display(norm) = part
            }
        }
    }

    Set out = ""
    Set key = ""
    For {
        Set key = $Order(display(key))
        Quit:key=""
        Set out = out_", "_display(key)
    }

    If $Extract(out,1)="," Set out=$Extract(out,2,*)
	//w out
    Quit out
}

Storage Default
{
<Data name="CCDDocumentDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>ProfileID</Value>
</Value>
<Value name="3">
<Value>PatientID</Value>
</Value>
<Value name="4">
<Value>DocumentType</Value>
</Value>
<Value name="5">
<Value>DocumentDate</Value>
</Value>
<Value name="6">
<Value>XPath</Value>
</Value>
<Value name="7">
<Value>CreatedAt</Value>
</Value>
<Value name="8">
<Value>SectionsPresent</Value>
</Value>
<Value name="9">
<Value>AllSections</Value>
</Value>
</Data>
<DataLocation>^LEADNorth.LEADDB04.CCDDocumentD</DataLocation>
<DefaultData>CCDDocumentDefaultData</DefaultData>
<ExtentSize>22</ExtentSize>
<IdLocation>^LEADNorth.LEADDB04.CCDDocumentD</IdLocation>
<IndexLocation>^LEADNorth.LEADDB04.CCDDocumentI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,16,$lb("-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000"),$lb(21,21,21,21,21,21,21,21,21,21,21,21,21,21,21),$lb(758198320,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,758198320))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb("1","2","4","6","8","10","12","14","15","16","17","18","19","20","21","22"),$lb(0,0,0,0,0,1,1,1,1,1,1,1,0,1,1),$lb(822083584,822083584,838860800,838860800,872415232,872415232,905969664,905969664,939524096,939524096,825229312,805306368,838860800,838860800,872415232,872415232,889192448,889192448,905969664,905969664,922746880,922746880,939524096,939524096,956301312,825819136,842006528,805306368,822083584,822083584,838860800,842137600))</Histogram>
<Selectivity>1</Selectivity>
</Property>
<Property name="CreatedAt">
<AverageFieldSize>21</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb("2025-02-10 11:11:00","2025-02-10 11:11:01","2025-02-10 11:11:02","2025-02-10 11:11:03","2025-02-10 11:11:04","2025-02-10 11:11:07","2025-02-10 11:11:08","2025-02-10 11:11:09","2025-02-10 11:11:09","2025-02-10 11:11:09","2025-02-10 11:11:09","2025-02-10 11:11:10","2025-02-10 11:11:10","2025-02-10 11:11:10","2025-02-10 11:11:10","2025-02-10 11:11:10"),$lb(18,18,18,18,18,18,18,20,20,20,17,20,20,20,20),$lb(842019381,805306368,822083584,822083584,838860800,838860800,855638016,855638016,872415232,872415232,922746880,922746880,939524096,939524096,956301312,0,0,0,0,0,0,809041920,825229312,0,0,0,0,0,0,0,0,842019381))</Histogram>
<Selectivity>11.1111%</Selectivity>
</Property>
<Property name="DocumentDate">
<AverageFieldSize>4.09</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(59988,59988,59988,59988,62027,62852,62852,63020,63230,63230,63230,63230,63230,63475,66508,66644),$lb(5,5,5,0,2,5,1,2,5,5,5,5,2,1,2),$lb(892942648,0,0,0,0,0,0,892942648,909258802,808597248,943010304,0,0,842544434,858796592,808595456,842215424,0,0,0,0,0,0,0,0,842215424,876033280,859060021,909455416,892352512,909390848,909522484))</Histogram>
<Selectivity>11.1111%</Selectivity>
</Property>
<Property name="DocumentID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="DocumentType">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="PatientID">
<AverageFieldSize>5.45</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" 106"," 107624055"," 107624104"," 107624139"," 110107073916280"," 110107073916280"," 12345"," 12345"," 12345"," 12345"," 12345"," 12345"," 230420"," 9473"," 98765432"," 9999"),$lb(3,7,8,2,17,2,7,7,7,7,7,1,1,2,2),$lb(540094518,905969664,926298676,808793344,825242624,808714240,859373568,808924722,825241904,0,0,825241904,842216501,0,0,0,0,0,0,0,0,0,0,825373492,842215476,842215476,959723315,876032768,943142453,943142453,960051456,540621113))</Histogram>
<OutlierSelectivity>.318182:12345</OutlierSelectivity>
<Selectivity>5.6818%</Selectivity>
</Property>
<Property name="ProfileID">
<AverageFieldSize>11</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"),$lb(11,11,11,11,11,11,11,11,11,11,11,11,11,11,11),$lb(542393683,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,542393683))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="XPath">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^LEADNorth.LEADDB04.CCDDocumentS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
