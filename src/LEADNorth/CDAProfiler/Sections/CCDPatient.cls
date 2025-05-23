Class LEADNorth.CDAProfiler.Sections.CCDPatient Extends %Persistent
{

Property PatientMRN As %String(MAXLEN = 255);

Property FirstName As %String(MAXLEN = 255);

Property LastName As %String(MAXLEN = 255);

Property DOB As %String(MAXLEN = 255);

Property GenderCode As %String(MAXLEN = 50);

Property GenderDisplay As %String(MAXLEN = 50);

Property GenderSystem As %String(MAXLEN = 50);

Property Address As %String(MAXLEN = 500);

Property City As %String(MAXLEN = 100);

Property State As %String(MAXLEN = 50);

Property ZipCode As %String(MAXLEN = 20);

Property Country As %String(MAXLEN = 50);

Property PhoneNumber As %String(MAXLEN = 20);

Property Email As %String(MAXLEN = 255);

Property LanguageCode As %String;

Property MaritalStatusCode As %String;

Property MaritalStatusDisplay As %String;

Property MaritalStatusSystem As %String;

Property RaceCode As %String;

Property RaceDisplay As %String;

Property RaceSystem As %String;

Property EthnicityCode As %String;

Property EthnicityDisplay As %String;

Property EthnicitySystem As %String;

Property InsurancePolicyNumber As %String(MAXLEN = 100);

Property InsuranceProvider As %String(MAXLEN = 255);

Property ProfileID As %String [ Required ];

Property XPath As %String(MAXLEN = 255);

Storage Default
{
<Data name="CCDPatientDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>PatientMRN</Value>
</Value>
<Value name="3">
<Value>FirstName</Value>
</Value>
<Value name="4">
<Value>LastName</Value>
</Value>
<Value name="5">
<Value>DOB</Value>
</Value>
<Value name="6">
<Value>GenderCode</Value>
</Value>
<Value name="7">
<Value>GenderDisplay</Value>
</Value>
<Value name="8">
<Value>GenderSystem</Value>
</Value>
<Value name="9">
<Value>Address</Value>
</Value>
<Value name="10">
<Value>City</Value>
</Value>
<Value name="11">
<Value>State</Value>
</Value>
<Value name="12">
<Value>ZipCode</Value>
</Value>
<Value name="13">
<Value>Country</Value>
</Value>
<Value name="14">
<Value>PhoneNumber</Value>
</Value>
<Value name="15">
<Value>Email</Value>
</Value>
<Value name="16">
<Value>LanguageCode</Value>
</Value>
<Value name="17">
<Value>MaritalStatusCode</Value>
</Value>
<Value name="18">
<Value>MaritalStatusDisplay</Value>
</Value>
<Value name="19">
<Value>MaritalStatusSystem</Value>
</Value>
<Value name="20">
<Value>RaceCode</Value>
</Value>
<Value name="21">
<Value>RaceDisplay</Value>
</Value>
<Value name="22">
<Value>RaceSystem</Value>
</Value>
<Value name="23">
<Value>EthnicityCode</Value>
</Value>
<Value name="24">
<Value>EthnicityDisplay</Value>
</Value>
<Value name="25">
<Value>EthnicitySystem</Value>
</Value>
<Value name="26">
<Value>InsurancePolicyNumber</Value>
</Value>
<Value name="27">
<Value>InsuranceProvider</Value>
</Value>
<Value name="28">
<Value>ProfileID</Value>
</Value>
<Value name="29">
<Value>XPath</Value>
</Value>
</Data>
<DataLocation>^LEADNorth.LEADNDB04.CCDPatientD</DataLocation>
<DefaultData>CCDPatientDefaultData</DefaultData>
<ExtentSize>22</ExtentSize>
<IdLocation>^LEADNorth.LEADNDB04.CCDPatientD</IdLocation>
<IndexLocation>^LEADNorth.LEADNDB04.CCDPatientI</IndexLocation>
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
<Property name="Address">
<AverageFieldSize>15.73</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" 123 MAIN STREET"," 1234 SIX FORKS"," 1234 SIX FORKS"," 1234 SIX FORKS"," 17 DAWS RD."," 17 DAWS RD."," 17 DAWS RD."," 17 DAWS RD."," 2 ELECTRIC AVE"," 2324 MAIN STREET"," 266 YORK STREET"," 345 MAIN STREET"," 456 MAIN STREET"," 4567 RESIDENCE RD"," 567 MAIN STREET"," 8745 W WILLENOW RD"),$lb(4,16,16,2,13,13,13,1,2,2,1,1,4,1,1),$lb(540095027,541933897,874533705,0,0,0,0,842216480,924861505,0,0,0,0,0,0,825696324,840975692,541412421,858928160,858928160,909516889,842413600,859059488,859059488,875902496,541933897,924865093,875902519,892745504,892745504,943141941,540555060))</Histogram>
<OutlierSelectivity>.318182:"17 Daws Rd."</OutlierSelectivity>
<Selectivity>6.1983%</Selectivity>
</Property>
<Property name="City">
<AverageFieldSize>9.82</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" AIKEN"," BEAVERTON"," BLUE BELL"," BLUE BELL"," BLUE BELL"," BLUE BELL"," BOSTON"," BOSTON"," BOSTON"," MORTON"," PORTLAND"," PORTLAND"," PORTLAND"," PORTLAND"," PORTLAND"," SMALLVILLE"),$lb(1,2,11,11,11,2,8,8,1,1,10,10,10,10,1),$lb(541149515,1095322437,1111834966,1161909829,1280656672,0,0,0,0,0,0,1280656672,1330861135,0,0,0,0,1112494932,1297044052,1297044052,1347375700,0,0,0,0,0,0,0,0,1347375700,1397571916,542330177))</Histogram>
<Selectivity>14.2857%</Selectivity>
</Property>
<Property name="Country">
<AverageFieldSize>4.05</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" US"," US"," US"," US"," US"," US"," US"," US"," US"," US"," US"," US"," US"," US"," US"," USA"),$lb(4,4,4,4,4,4,4,4,4,4,4,4,4,4,3),$lb(542462720,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1090519040,542462785))</Histogram>
<OutlierSelectivity>.954545:"US"</OutlierSelectivity>
<Selectivity>4.5455%</Selectivity>
</Property>
<Property name="DOB">
<AverageFieldSize>10.68</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" 19420621"," 19440101"," 19470407"," 19480202"," 19501015"," 19540202"," 19540323000000.000-0600"," 19541125"," 19541125"," 19541125"," 19541125"," 19541125"," 19541125"," 19621022"," 19621022"," 19801215"),$lb(4,4,4,3,4,6,5,10,10,10,10,10,3,10,3),$lb(540096820,842020402,875573552,875573552,925905968,925905968,942682672,876097586,892350768,808529969,875573808,842019328,858927920,808661555,825307701,0,0,0,0,0,0,0,0,0,0,892612913,909259056,0,0,909259056,942682418,540096824))</Histogram>
<OutlierSelectivity>.318182:19541125</OutlierSelectivity>
<Selectivity>5.2448%</Selectivity>
</Property>
<Property name="Email">
<AverageFieldSize>4.55</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," MAILTO:EMAIL@GMAIL.COM"," MAILTO:ISBELLA.JONES.CCD@GMAIL.COM"),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,1,8),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1296124236,1162690889,1230193221,541933897))</Histogram>
<OutlierSelectivity>.909091:</OutlierSelectivity>
<Selectivity>4.5455%</Selectivity>
</Property>
<Property name="EthnicityCode">
<AverageFieldSize>7.45</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," 2186-5"," 2186-5"," 2186-5"," 2186-5"," 2186-5"," 2186-5"," 2186-5"," 2186-5"," 2186-5"," 2186-5"," 2186-5"," 2186-5"," 2186-5"," 2186-5"),$lb(2,1,8,8,8,8,8,8,8,8,8,8,8,8,8),$lb(536870912,0,0,0,842086454,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,540160312))</Histogram>
<OutlierSelectivity>.863636:"2186-5"</OutlierSelectivity>
<Selectivity>6.8182%</Selectivity>
</Property>
<Property name="EthnicityDisplay">
<AverageFieldSize>21.82</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," NOT HISPANIC OR LATINO"," NOT HISPANIC OR LATINO"," NOT HISPANIC OR LATINO"," NOT HISPANIC OR LATINO"," NOT HISPANIC OR LATINO"," NOT HISPANIC OR LATINO"," NOT HISPANIC OR LATINO"," NOT HISPANIC OR LATINO"," NOT HISPANIC OR LATINO"," NOT HISPANIC OR LATINO"," NOT HISPANIC OR LATINO"," NOT HISPANIC OR LATINO"," NOT HISPANIC OR LATINO"," NOT HISPANIC OR LATINO"),$lb(2,1,24,24,24,24,24,24,24,24,24,24,24,24,24),$lb(536870912,0,0,0,1313821728,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,542003028))</Histogram>
<OutlierSelectivity>.863636:"Not Hispanic or Latino"</OutlierSelectivity>
<Selectivity>6.8182%</Selectivity>
</Property>
<Property name="EthnicitySystem">
<AverageFieldSize>22.91</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," 2.16.840.1.113883.6.238"," 2.16.840.1.113883.6.238"," 2.16.840.1.113883.6.238"," 2.16.840.1.113883.6.238"," 2.16.840.1.113883.6.238"," 2.16.840.1.113883.6.238"," 2.16.840.1.113883.6.238"," 2.16.840.1.113883.6.238"," 2.16.840.1.113883.6.238"," 2.16.840.1.113883.6.238"," 2.16.840.1.113883.6.238"," 2.16.840.1.113883.6.238"," 2.16.840.1.113883.6.238"," 2.16.840.1.113883.6.238"),$lb(2,1,25,25,25,25,25,25,25,25,25,25,25,25,25),$lb(536870912,0,0,0,841888054,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,540159537))</Histogram>
<OutlierSelectivity>.909091:"2.16.840.1.113883.6.238"</OutlierSelectivity>
<Selectivity>9.0909%</Selectivity>
</Property>
<Property name="FirstName">
<AverageFieldSize>7.59</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" ADAM"," ADAM"," ADAM"," ADAM"," ADAM"," EVE"," FOURTEST"," ISABELLA"," JOHN"," MARY"," MORTICIA"," ONETEST"," STEVE"," THREETEST"," TWOTEST"," VICTORIA"),$lb(6,6,6,6,1,1,1,1,1,2,1,1,1,2,1),$lb(541148225,0,0,0,0,0,0,0,0,1094992205,1163281664,1163281664,1179604306,1179604306,1230192962,1230192962,1246709838,1246709838,1296126553,1095915776,1330795593,1297044052,1330529620,1330529620,1398031702,1398031702,1414025797,1213351237,1464816709,1415008084,1447641940,542525763))</Histogram>
<OutlierSelectivity>.409091:"Adam"</OutlierSelectivity>
<Selectivity>4.9242%</Selectivity>
</Property>
<Property name="GenderCode">
<AverageFieldSize>3</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" F"," F"," F"," F"," F"," M"," M"," M"," M"," M"," M"," M"," M"," M"," M"," M"),$lb(3,3,3,3,1,3,3,3,3,3,3,3,3,3,3),$lb(541458432,0,0,0,0,0,0,0,0,1174405120,1291845632,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,541917184))</Histogram>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="GenderDisplay">
<AverageFieldSize>5.55</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," FEMALE"," FEMALE"," FEMALE"," MALE"," MALE"," MALE"," MALE"," MALE"," MALE"," MALE"," MALE"," MALE"),$lb(2,2,2,1,8,8,1,6,6,6,6,6,6,6,6),$lb(536870912,0,0,0,0,0,0,0,1178946881,0,0,0,0,1178946881,1296124997,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,541933900))</Histogram>
<Selectivity>33.3333%</Selectivity>
</Property>
<Property name="GenderSystem">
<AverageFieldSize>23</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" 2.16.840.1.113883.5.1"," 2.16.840.1.113883.5.1"," 2.16.840.1.113883.5.1"," 2.16.840.1.113883.5.1"," 2.16.840.1.113883.5.1"," 2.16.840.1.113883.5.1"," 2.16.840.1.113883.5.1"," 2.16.840.1.113883.5.1"," 2.16.840.1.113883.5.1"," 2.16.840.1.113883.5.1"," 2.16.840.1.113883.5.1"," 2.16.840.1.113883.5.1"," 2.16.840.1.113883.5.1"," 2.16.840.1.113883.5.1"," 2.16.840.1.113883.5.1"," 2.16.840.1.113883.5.1"),$lb(23,23,23,23,23,23,23,23,23,23,23,23,23,23,23),$lb(540159537,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,540159537))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="InsurancePolicyNumber">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="InsuranceProvider">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="LanguageCode">
<AverageFieldSize>4.68</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," ENG"," ENG"," ENG"," ENG"," FR-CN"," FR-CN"," FR-CN"," FR-CN"," FR-CN"," FR-CN"," FR-CN"," ITA"),$lb(2,2,2,1,5,5,5,1,7,7,7,7,7,7,1),$lb(536870912,0,0,0,0,0,0,0,1162757888,0,0,0,0,0,0,1162757888,1179790659,0,0,0,0,0,0,0,0,0,0,0,0,1179790659,1230258432,541676609))</Histogram>
<Selectivity>25.0000%</Selectivity>
</Property>
<Property name="LastName">
<AverageFieldSize>10.95</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" ADAMS"," BWHCKDRISKTEST"," BWHCKDRISKTEST"," BWHCKDRISKTEST"," EVERYMAN"," EVERYMAN"," EVERYMAN"," EVERYMAN"," EVERYMAN"," EVERYMAN"," EVERYWOMAN"," JONES"," JONES"," WADE"," WILLIAMS"," WILLIAMSON"),$lb(1,16,16,1,10,10,10,10,10,6,1,7,1,2,9),$lb(541148225,1094992205,1113016387,0,0,0,0,1113016387,1163281746,0,0,0,0,0,0,0,0,0,0,1296125440,1464814913,1163281746,1246711365,0,0,1246711365,1463895109,1094993152,1229737033,0,1330511872,542591308))</Histogram>
<OutlierSelectivity>.409091:"Everyman"</OutlierSelectivity>
<Selectivity>7.3864%</Selectivity>
</Property>
<Property name="MaritalStatusCode">
<AverageFieldSize>2.41</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," M"," M"," M"," M"," M"," M"," M"," M"," S"),$lb(2,2,2,2,2,2,1,3,3,3,3,3,3,3,1),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,1291845632,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1291845632,1392508928,542310400))</Histogram>
<Selectivity>33.3333%</Selectivity>
</Property>
<Property name="MaritalStatusDisplay">
<AverageFieldSize>4.82</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," MARRIED"," MARRIED"," MARRIED"," MARRIED"," MARRIED"," MARRIED"," MARRIED"," MARRIED"," SINGLE"),$lb(2,2,2,2,2,2,1,9,9,9,9,9,9,9,1),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,1296126546,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1296126546,1397313095,542329166))</Histogram>
<Selectivity>33.3333%</Selectivity>
</Property>
<Property name="MaritalStatusSystem">
<AverageFieldSize>10.59</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," 2.16.840.1.113883.5.2"," 2.16.840.1.113883.5.2"," 2.16.840.1.113883.5.2"," 2.16.840.1.113883.5.2"," 2.16.840.1.113883.5.2"," 2.16.840.1.113883.5.2"," 2.16.840.1.113883.5.2"," 2.16.840.1.113883.5.2"," 2.16.840.1.113883.5.2"),$lb(2,2,2,2,2,2,1,23,23,23,23,23,23,23,23),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,841888054,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,540159537))</Histogram>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="PatientMRN">
<AverageFieldSize>10.18</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" 106"," 107624055"," 107624104"," 107624139"," 110107073916280"," 110107073916280"," 12345"," 12345"," 12345"," 12345"," 12345"," 12345"," 230420"," 9473"," 98765432"," 9999"),$lb(3,7,8,2,17,2,7,7,7,7,7,1,1,2,2),$lb(540094518,905969664,926298676,808793344,825242624,808714240,859373568,808924722,825241904,0,0,825241904,842216501,0,0,0,0,0,0,0,0,0,0,825373492,842215476,842215476,959723315,876032768,943142453,943142453,960051456,540621113))</Histogram>
<OutlierSelectivity>.318182:12345</OutlierSelectivity>
<Selectivity>5.6818%</Selectivity>
</Property>
<Property name="PhoneNumber">
<AverageFieldSize>19.09</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," TEL:(503) 325-7464"," TEL:(508)555-1212"," TEL:(508)666-1616"," TEL:(781)555-1212"," TEL:(781)555-1212"," TEL:(781)555-1212"," TEL:(781)555-1212"," TEL:+1(444)444-4444"," TEL:+1-(555)555-3333"," TEL:+1-(555)555-3333"," TEL:+1-(555)555-3333"," TEL:+1-(555)555-3333"," TEL:+1-(555)555-3333"," TEL:+1-555-777-3333"," TEL:+13093548275"),$lb(1,8,10,6,19,19,19,5,7,22,22,22,22,8,7),$lb(536870912,0,1413827642,858333235,942224693,892679469,909522477,892352553,926429481,0,0,0,0,0,0,674707505,724641844,674509876,757609781,0,0,0,0,0,0,0,0,674575669,892679469,758461749,858798387,542393676))</Histogram>
<OutlierSelectivity>.318182:"tel:(781)555-1212"</OutlierSelectivity>
<Selectivity>6.1983%</Selectivity>
</Property>
<Property name="ProfileID">
<AverageFieldSize>11</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"),$lb(11,11,11,11,11,11,11,11,11,11,11,11,11,11,11),$lb(542393683,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,542393683))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="RaceCode">
<AverageFieldSize>7.18</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," 2054-5"," 2054-5"," 2054-5"," 2106-3"," 2106-3"," 2106-3"," 2106-3"," 2106-3"," 2106-3"," 2106-3"," 2106-3"," 2106-3"," 2106-3"," 2106-3"),$lb(2,1,8,8,2,8,8,8,8,8,8,8,8,8,8),$lb(536870912,0,0,0,842020148,0,0,0,0,808793133,825243181,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,540160304))</Histogram>
<Selectivity>33.3333%</Selectivity>
</Property>
<Property name="RaceDisplay">
<AverageFieldSize>11.77</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," BLACK OR AFRICAN AMERICAN"," BLACK OR AFRICAN AMERICAN"," BLACK OR AFRICAN AMERICAN"," WHITE"," WHITE"," WHITE"," WHITE"," WHITE"," WHITE"," WHITE"," WHITE"," WHITE"," WHITE"," WHITE"),$lb(2,1,27,27,1,7,7,7,7,7,7,7,7,7,7),$lb(536870912,0,0,0,1112293699,0,0,0,0,1112293699,1464355156,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,542591049))</Histogram>
<Selectivity>33.3333%</Selectivity>
</Property>
<Property name="RaceSystem">
<AverageFieldSize>21.86</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," 2.16.840.1.113883.6.238"," 2.16.840.1.113883.6.238"," 2.16.840.1.113883.6.238"," 2.16.840.1.113883.6.238"," 2.16.840.1.113883.6.238"," 2.16.840.1.113883.6.238"," 2.16.840.1.113883.6.238"," 2.16.840.1.113883.6.238"," 2.16.840.1.113883.6.238"," 2.16.840.1.113883.6.238"," 2.16.840.1.113883.6.238"," 2.16.840.1.113883.6.238"," 2.16.840.1.113883.6.238"," 2.16.840.1.113883.6.238"),$lb(2,1,25,25,25,25,25,25,25,25,25,25,25,25,25),$lb(536870912,0,0,0,841888054,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,540159537))</Histogram>
<OutlierSelectivity>.863636:"2.16.840.1.113883.6.238"</OutlierSelectivity>
<Selectivity>13.6364%</Selectivity>
</Property>
<Property name="State">
<AverageFieldSize>4</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" IL"," MA"," MA"," MA"," MA"," MA"," MA"," OR"," OR"," OR"," OR"," OR"," OR"," OR"," SC"," SC"),$lb(1,4,4,4,4,4,1,4,4,4,4,4,4,1,4),$lb(541674496,1229717504,1296105472,0,0,0,0,0,0,0,0,0,0,1296105472,1330774016,0,0,0,0,0,0,0,0,0,0,0,0,1330774016,1396899840,0,0,542327552))</Histogram>
<Selectivity>25.0000%</Selectivity>
</Property>
<Property name="XPath">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="ZipCode">
<AverageFieldSize>7.27</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" 02109"," 02109"," 02109"," 02368"," 02368"," 02368"," 02368"," 29803"," 61550-"," 97005"," 97005"," 97005"," 97005"," 97005"," 97005-"," 97867"),$lb(7,7,3,7,7,7,1,1,1,7,7,7,7,6,3),$lb(540029489,0,0,0,0,825243904,859191296,0,0,0,0,0,0,808596278,842610736,842610736,909194549,909194549,959918128,0,0,0,0,0,0,0,0,0,754974720,808465709,943077120,540620600))</Histogram>
<Selectivity>12.5000%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^LEADNorth.LEADNDB04.CCDPatientS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
