Class LEADNorth.CDAProfiler.Sections.CCDDiagnosis Extends %Persistent
{

Property DiagnosisID As %String(MAXLEN = 255);

Property DiagnosisTypeCode As %String(MAXLEN = 255);

Property DiagnosisTypeCodeSystem As %String(MAXLEN = 255);

Property DiagnosisTypeCodeSystemName As %String(MAXLEN = 255);

Property DiagnosisTypeDisplayName As %String(MAXLEN = 255);

Property DiagnosisEffectiveTimeLow As %String(MAXLEN = 255);

Property DiagnosisEffectiveTimeHigh As %String(MAXLEN = 255);

Property DiagnosisCode As %String(MAXLEN = 255);

Property DiagnosisCodeSystem As %String(MAXLEN = 255);

Property DiagnosisCodeSystemName As %String(MAXLEN = 255);

Property DiagnosisCodeDisplayName As %String(MAXLEN = 255);

Property DiagnosisStatusCode As %String(MAXLEN = 255);

Property DiagnosisEncounterNumber As %String(MAXLEN = 255);

Property DocumentID As LEADNorth.CDAProfiler.Sections.CCDDocument [ Required ];

Property ProfileID As %String [ Required ];

Property NullValues As %String(MAXLEN = 255);

Property SDAMapping As %String(MAXLEN = 255);

Property XPath As %String(MAXLEN = 255);

Storage Default
{
<Data name="CCDDiagnosisDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>DiagnosisID</Value>
</Value>
<Value name="3">
<Value>DiagnosisTypeCode</Value>
</Value>
<Value name="4">
<Value>DiagnosisTypeCodeSystem</Value>
</Value>
<Value name="5">
<Value>DiagnosisTypeCodeSystemName</Value>
</Value>
<Value name="6">
<Value>DiagnosisTypeDisplayName</Value>
</Value>
<Value name="7">
<Value>DiagnosisEffectiveTimeLow</Value>
</Value>
<Value name="8">
<Value>DiagnosisEffectiveTimeHigh</Value>
</Value>
<Value name="9">
<Value>DiagnosisCode</Value>
</Value>
<Value name="10">
<Value>DiagnosisCodeSystem</Value>
</Value>
<Value name="11">
<Value>DiagnosisCodeSystemName</Value>
</Value>
<Value name="12">
<Value>DiagnosisCodeDisplayName</Value>
</Value>
<Value name="13">
<Value>DiagnosisStatusCode</Value>
</Value>
<Value name="14">
<Value>DiagnosisEncounterNumber</Value>
</Value>
<Value name="15">
<Value>DocumentID</Value>
</Value>
<Value name="16">
<Value>ProfileID</Value>
</Value>
<Value name="17">
<Value>NullValues</Value>
</Value>
<Value name="18">
<Value>SDAMapping</Value>
</Value>
<Value name="19">
<Value>XPath</Value>
</Value>
</Data>
<DataLocation>^LEADNorth.LEADB04.CCDDiagnosisD</DataLocation>
<DefaultData>CCDDiagnosisDefaultData</DefaultData>
<ExtentSize>19</ExtentSize>
<IdLocation>^LEADNorth.LEADB04.CCDDiagnosisD</IdLocation>
<IndexLocation>^LEADNorth.LEADB04.CCDDiagnosisI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,16,$lb("-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000"),$lb(21,21,21,21,21,21,21,21,21,21,21,21,21,21,21),$lb(758198320,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,758198320))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb("1","2","4","6","8","9","10","11","12","13","14","15","16","17","18","19"),$lb(0,0,0,0,0,0,1,1,1,1,1,1,1,1,1),$lb(822083584,822083584,838860800,838860800,872415232,872415232,905969664,905969664,939524096,939524096,956301312,956301312,825229312,805306368,822083584,822083584,838860800,838860800,855638016,855638016,872415232,872415232,889192448,889192448,905969664,905969664,922746880,922746880,939524096,939524096,956301312,825819136))</Histogram>
<Selectivity>1</Selectivity>
</Property>
<Property name="DiagnosisCode">
<AverageFieldSize>6.63</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," 194828000"," 195967001"," 195967001"," 203523006"," 233604007"," 233604007"," 233604007"," 26929004"," 385093006"," 59621000"),$lb(2,2,2,2,2,1,3,11,1,2,11,11,2,1,1),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,825832504,876098104,892941879,0,0,825832761,842019637,808662322,858994224,0,0,0,0,858994224,909718073,842414386,859321648,859321648,892941874,540358966))</Histogram>
<OutlierSelectivity>.473684:</OutlierSelectivity>
<Selectivity>7.5188%</Selectivity>
</Property>
<Property name="DiagnosisCodeDisplayName">
<AverageFieldSize>9.68</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," ALZHEIMER DISEASE"," ANGINA"," ASTHMA"," ASTHMA"," COMMUNITY ACQUIRED PNEUMONIA"," COMMUNITY ACQUIRED PNEUMONIA"," COSTOCHONDRITIS"," ESSENTIAL HYPERTENSION"," PNEUMONIA"," PNEUMONIA"),$lb(2,2,2,2,2,1,2,2,8,1,30,3,1,1,11),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,1095522888,1280985157,1313294670,1313294670,1398032461,0,0,1095980104,1129270605,0,0,1296913742,1398034243,1129272148,1163088709,1163088709,1347306837,0,0,542133829))</Histogram>
<OutlierSelectivity>.473684:</OutlierSelectivity>
<Selectivity>7.5188%</Selectivity>
</Property>
<Property name="DiagnosisCodeSystem">
<AverageFieldSize>21.68</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"),$lb(2,1,24,24,24,24,24,24,24,24,24,24,24,24,24),$lb(536870912,0,0,0,841888054,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,540159537))</Histogram>
<OutlierSelectivity>.894737:"2.16.840.1.113883.6.96"</OutlierSelectivity>
<Selectivity>10.5263%</Selectivity>
</Property>
<Property name="DiagnosisCodeSystemName">
<AverageFieldSize>6.74</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," SNOMED CT"," SNOMED CT"," SNOMED CT"," SNOMED CT"," SNOMED CT"," SNOMED CT"," SNOMED CT"," SNOMED CT"," SNOMED CT"," SNOMED CT"),$lb(2,2,2,2,2,1,11,11,11,11,11,11,11,11,11),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,1397641037,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,542330447))</Histogram>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="DiagnosisEffectiveTimeHigh">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="DiagnosisEffectiveTimeLow">
<AverageFieldSize>18.05</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" 20110312090051"," 20110925100051"," 20120806100051"," 20121002100051"," 20130130100051"," 20130130100051"," 20130130100051"," 20130711000000.000-0500"," 20130717000000.000-0500"," 202306190000-0600"," 202306190000-0600"," 202306190000-0600"," 202306190000-0600"," 202306190000-0600"," 202306190000-0600"," 202306190000-0600"),$lb(6,4,5,4,16,16,6,8,3,19,19,19,19,19,19),$lb(540160049,858862128,959591729,825243954,842020912,808988726,825241650,842084400,858796339,0,0,0,0,825438257,925970736,825241648,925904944,825438263,842215478,0,0,0,0,0,0,0,0,0,0,0,0,540160050))</Histogram>
<OutlierSelectivity>.368421:"202306190000-0600"</OutlierSelectivity>
<Selectivity>7.0175%</Selectivity>
</Property>
<Property name="DiagnosisEncounterNumber">
<AverageFieldSize>22.37</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" 2.16.840.1.113883.1.13.99999.2"," 2.16.840.1.113883.1.13.99999.2"," 5283815"," 5283815"," 52838151"," 52838151"," 52838151"," 52838152"," 52838152"," A9D97787-EFBA-4658-B0A6-C33A39A5D340"," A9D97787-EFBA-4658-B0A6-C33A39A5D340"," A9D97787-EFBA-4658-B0A6-C33A39A5D340"," A9D97787-EFBA-4658-B0A6-C33A39A5D340"," A9D97787-EFBA-4658-B0A6-C33A39A5D340"," A9D97787-EFBA-4658-B0A6-C33A39A5D340"," A9D97787-EFBA-4658-B0A6-C33A39A5D340"),$lb(32,1,9,8,10,10,8,10,1,38,38,38,38,38,38),$lb(540159537,0,0,841888054,892483635,0,0,0,822083584,0,0,0,0,822083584,838860800,0,0,892483635,1094272057,0,0,0,0,0,0,0,0,0,0,0,0,541145412))</Histogram>
<Selectivity>20.0000%</Selectivity>
</Property>
<Property name="DiagnosisID">
<AverageFieldSize>37.63</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" 1.3.6.1.4.1.22812.11.99930.3.4.1.2.1"," 1.3.6.1.4.1.22812.11.99930.3.4.1.2.1"," 1.3.6.1.4.1.22812.3.99930.3.4.1.2.1"," 1.3.6.1.4.1.22812.3.99930.3.4.1.2.1"," 1.3.6.1.4.1.22812.3.99930.3.4.1.2.1"," 1.3.6.1.4.1.22812.3.99930.3.4.1.2.1"," 1.3.6.1.4.1.22812.3.99930.3.4.1.2.1"," 18B8FAC5-A75A-4ED1-8433-7F4D459C0073"," 4061A4A6-F8D6-4870-B6D5-05E1F3DAB302"," 4FA53FF5-3DE8-47C8-B7C9-1CD201949E76"," 7A3AAF94-00F0-4E1D-8F13-A0CCD08C0640"," A0190413-F3E1-4A17-9A62-90153E610A5D"," B6DAC1F6-DD4E-4AAC-A7CE-1F6EC1EEB827"," B975A197-6908-49F1-876B-D88DA5C0E941"," C5927558-7898-4161-8AAD-A2C94B3339BD"," F2C50FAB-B95D-4002-B33E-50D6E5B66AE1"),$lb(38,19,37,37,37,37,2,1,2,1,1,1,2,1,1),$lb(540094003,0,0,825306681,858667321,0,0,0,0,0,0,0,0,775106102,943863878,825770552,875574833,808857921,1178678579,877019445,927019841,927019841,1093677369,1093677369,1110852673,910442819,959919425,1111045941,1127561522,1127561522,1177699125,541471299))</Histogram>
<OutlierSelectivity>.368421:"1.3.6.1.4.1.22812.3.99930.3.4.1.2.1"</OutlierSelectivity>
<Selectivity>6.3158%</Selectivity>
</Property>
<Property name="DiagnosisStatusCode">
<AverageFieldSize>11</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"),$lb(11,11,11,11,11,11,11,11,11,11,11,11,11,11,11),$lb(541282125,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,541282125))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="DiagnosisTypeCode">
<AverageFieldSize>9</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" 29308-4"," 29308-4"," 29308-4"," 29308-4"," 29308-4"," 29308-4"," 29308-4"," 29308-4"," 29308-4"," 29308-4"," 29308-4"," 29308-4"," 29308-4"," 29308-4"," 29308-4"," 29308-4"),$lb(9,9,9,9,9,9,9,9,9,9,9,9,9,9,9),$lb(540162355,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,540162355))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="DiagnosisTypeCodeSystem">
<AverageFieldSize>23</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" 2.16.840.1.113883.6.1"," 2.16.840.1.113883.6.1"," 2.16.840.1.113883.6.1"," 2.16.840.1.113883.6.1"," 2.16.840.1.113883.6.1"," 2.16.840.1.113883.6.1"," 2.16.840.1.113883.6.1"," 2.16.840.1.113883.6.1"," 2.16.840.1.113883.6.1"," 2.16.840.1.113883.6.1"," 2.16.840.1.113883.6.1"," 2.16.840.1.113883.6.1"," 2.16.840.1.113883.6.1"," 2.16.840.1.113883.6.1"," 2.16.840.1.113883.6.1"," 2.16.840.1.113883.6.1"),$lb(23,23,23,23,23,23,23,23,23,23,23,23,23,23,23),$lb(540159537,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,540159537))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="DiagnosisTypeCodeSystemName">
<AverageFieldSize>7</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" LOINC"," LOINC"," LOINC"," LOINC"," LOINC"," LOINC"," LOINC"," LOINC"," LOINC"," LOINC"," LOINC"," LOINC"," LOINC"," LOINC"," LOINC"," LOINC"),$lb(7,7,7,7,7,7,7,7,7,7,7,7,7,7,7),$lb(541871945,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,541871945))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="DiagnosisTypeDisplayName">
<AverageFieldSize>19.95</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" DIAGNOSIS"," DIAGNOSIS"," ENCOUNTER DIAGNOSIS"," ENCOUNTER DIAGNOSIS"," ENCOUNTER DIAGNOSIS"," ENCOUNTER DIAGNOSIS"," ENCOUNTER DIAGNOSIS"," ENCOUNTER DIAGNOSIS"," ENCOUNTER DIAGNOSIS"," ENCOUNTER DIAGNOSIS"," ENCOUNTER DIAGNOSIS"," ENCOUNTER DIAGNOSIS"," ENCOUNTER DIAGNOSIS"," ENCOUNTER DIAGNOSIS"," ENCOUNTER DIAGNOSIS"," ENCOUNTER DIAGNOSIS"),$lb(11,1,21,21,21,21,21,21,21,21,21,21,21,21,21),$lb(541346113,0,0,1145651527,1162756943,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,541412931))</Histogram>
<Selectivity>33.3333%</Selectivity>
</Property>
<Property name="DocumentID">
<AverageFieldSize>3.47</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb("1","1","3","3","4","4","5","12","12","12","12","12","12","12","22","22"),$lb(1,0,1,0,1,0,0,2,2,2,2,2,2,0,2),$lb(822083584,0,0,822083584,855638016,0,0,855638016,872415232,0,0,872415232,889192448,889192448,825360384,0,0,0,0,0,0,0,0,0,0,0,0,825360384,842137600,0,0,842137600))</Histogram>
<Selectivity>14.2857%</Selectivity>
</Property>
<Property name="NullValues">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="ProfileID">
<AverageFieldSize>11</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"),$lb(11,11,11,11,11,11,11,11,11,11,11,11,11,11,11),$lb(542393683,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,542393683))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="SDAMapping">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
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
<StreamLocation>^LEADNorth.LEADB04.CCDDiagnosisS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
