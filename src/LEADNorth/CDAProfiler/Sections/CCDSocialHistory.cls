Class LEADNorth.CDAProfiler.Sections.CCDSocialHistory Extends %Persistent
{

Property SocialHistoryID As %String(MAXLEN = 255);

Property DocumentID As LEADNorth.CDAProfiler.Sections.CCDDocument;

Property ConceptDescription As %String(MAXLEN = 255);

Property ObservationCode As %String(MAXLEN = 255);

Property ObservationCodeSystem As %String(MAXLEN = 255);

Property ObservationCodeSystemName As %String(MAXLEN = 255);

Property ObservationDisplayName As %String(MAXLEN = 255);

Property ValueCode As %String(MAXLEN = 255);

Property ValueCodeSystem As %String(MAXLEN = 255);

Property ValueCodeSystemName As %String(MAXLEN = 255);

Property ValueDisplayName As %String(MAXLEN = 1000);

Property Units As %String(MAXLEN = 50);

Property StatusCode As %String(MAXLEN = 20);

Property ObservationIDExtension As %String(MAXLEN = 255);

Property ObservationIDRoot As %String(MAXLEN = 255);

Property AuthorTime As %String;

Property Author As %String;

Property EffectiveTimeLow As %String;

Property EffectiveTimeHigh As %String;

Property ProfileID As %String [ Required ];

Property XPath As %String(MAXLEN = 255);

Storage Default
{
<Data name="CCDSocialHistoryDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>SocialHistoryID</Value>
</Value>
<Value name="3">
<Value>DocumentID</Value>
</Value>
<Value name="4">
<Value>ConceptDescription</Value>
</Value>
<Value name="5">
<Value>ObservationCode</Value>
</Value>
<Value name="6">
<Value>ObservationCodeSystem</Value>
</Value>
<Value name="7">
<Value>ObservationCodeSystemName</Value>
</Value>
<Value name="8">
<Value>ObservationDisplayName</Value>
</Value>
<Value name="9">
<Value>ValueCode</Value>
</Value>
<Value name="10">
<Value>ValueCodeSystem</Value>
</Value>
<Value name="11">
<Value>ValueCodeSystemName</Value>
</Value>
<Value name="12">
<Value>ValueDisplayName</Value>
</Value>
<Value name="13">
<Value>Units</Value>
</Value>
<Value name="14">
<Value>StatusCode</Value>
</Value>
<Value name="15">
<Value>ObservationIDExtension</Value>
</Value>
<Value name="16">
<Value>ObservationIDRoot</Value>
</Value>
<Value name="17">
<Value>AuthorTime</Value>
</Value>
<Value name="18">
<Value>Author</Value>
</Value>
<Value name="19">
<Value>EffectiveTimeLow</Value>
</Value>
<Value name="20">
<Value>EffectiveTimeHigh</Value>
</Value>
<Value name="21">
<Value>ProfileID</Value>
</Value>
<Value name="22">
<Value>XPath</Value>
</Value>
</Data>
<DataLocation>^LEADNorthDB04.CCDSocialHi11ECD</DataLocation>
<DefaultData>CCDSocialHistoryDefaultData</DefaultData>
<ExtentSize>33</ExtentSize>
<IdLocation>^LEADNorthDB04.CCDSocialHi11ECD</IdLocation>
<IndexLocation>^LEADNorthDB04.CCDSocialHi11ECI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,16,$lb("-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000"),$lb(21,21,21,21,21,21,21,21,21,21,21,21,21,21,21),$lb(758198320,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,758198320))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb("1","3","6","9","11","13","15","17","19","21","23","25","27","29","31","33"),$lb(0,0,0,0,1,1,1,1,0,1,1,1,1,0,1),$lb(822083584,822083584,855638016,855638016,905969664,905969664,956301312,956301312,825294848,822083584,855638016,855638016,889192448,889192448,922746880,922746880,956301312,825819136,842072064,822083584,855638016,855638016,889192448,889192448,922746880,922746880,956301312,842596352,858849280,822083584,855638016,858980352))</Histogram>
<Selectivity>1</Selectivity>
</Property>
<Property name="Author">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="AuthorTime">
<AverageFieldSize>7.67</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," 20111028100051"," 20120925100051"," 20121002100051"," 20130710214841.000-0500"," 20190911165042"," 20190911165046"),$lb(2,2,2,2,2,2,2,2,2,1,4,5,4,4,14),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,842019121,825307186,842021170,809054773,825241650,842084400,858797873,858797873,959461681,838860800,905969664,540160049))</Histogram>
<OutlierSelectivity>.636364:</OutlierSelectivity>
<Selectivity>3.3058%</Selectivity>
</Property>
<Property name="ConceptDescription">
<AverageFieldSize>5.18</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," #SOC1"," #SOC1"," #SOC2"," #SOC2"," #SOC3"," #SOC3"," #SOCIALHISTORY1"," #SOCIALHISTORY3"),$lb(2,2,2,2,2,2,2,1,7,5,7,5,7,5,15),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,592662339,0,0,822083584,838860800,0,0,838860800,855638016,0,0,855638016,1229016136,822083584,855638016,539185999))</Histogram>
<OutlierSelectivity>.545455:</OutlierSelectivity>
<Selectivity>7.5758%</Selectivity>
</Property>
<Property name="DocumentID">
<AverageFieldSize>3.58</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb("1","3","5","7","7","8","10","10","11","12","12","13","15","17","20","22"),$lb(0,0,0,1,0,0,2,1,1,2,1,1,1,0,1),$lb(822083584,822083584,855638016,855638016,889192448,889192448,922746880,0,0,922746880,939524096,939524096,825229312,0,0,805306368,822083584,822083584,838860800,0,0,838860800,855638016,855638016,889192448,889192448,922746880,825688064,842006528,805306368,838860800,842137600))</Histogram>
<Selectivity>5.5556%</Selectivity>
</Property>
<Property name="EffectiveTimeHigh">
<AverageFieldSize>5.18</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," 1972"," 1972"," 1972"," 1972"," 1972"," 1972"," 20190911164841-0400"," 20190911164841-0400"),$lb(2,2,2,2,2,2,2,1,6,6,6,6,6,1,21),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,825833266,0,0,0,0,0,0,0,0,0,0,825833266,842019129,0,0,540160049))</Histogram>
<Selectivity>33.3333%</Selectivity>
</Property>
<Property name="EffectiveTimeLow">
<AverageFieldSize>7.12</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," 1947"," 1947"," 1973"," 1973"," 1973"," 1973"," 2012"," 2012"," 2012"," 20140212"," 20140212"," 20190911164841-0400"," 20190911164841-0400"),$lb(2,2,1,6,3,6,6,6,1,6,6,4,10,4,21),$lb(536870912,0,0,0,0,0,825832503,0,0,876019712,926089216,0,0,0,0,0,0,825833267,842019122,0,0,0,0,838860800,875573809,0,0,875573809,959461681,0,0,540160049))</Histogram>
<Selectivity>14.2857%</Selectivity>
</Property>
<Property name="ObservationCode">
<AverageFieldSize>10.27</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," 160573003"," 160573003"," 230056004"," 230056004"," 230056004"," 230056004"," 72109-2"," 72166-2"," ASSERTION"," ASSERTION"," ASSERTION"," ASSERTION"," ASSERTION"," ASSERTION"," ASSERTION"),$lb(1,11,1,11,11,11,1,4,1,11,11,11,11,11,11),$lb(536870912,0,825634869,0,0,825634869,842215472,0,0,0,0,0,0,842215472,926036272,809053490,909520178,926036278,1095979845,0,0,0,0,0,0,0,0,0,0,0,0,541152083))</Histogram>
<Selectivity>14.2857%</Selectivity>
</Property>
<Property name="ObservationCodeSystem">
<AverageFieldSize>23.52</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" 2.16.840.1.113883.5.4"," 2.16.840.1.113883.5.4"," 2.16.840.1.113883.5.4"," 2.16.840.1.113883.5.4"," 2.16.840.1.113883.5.4"," 2.16.840.1.113883.5.4"," 2.16.840.1.113883.6.1"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"),$lb(23,23,23,23,23,19,21,24,24,24,24,24,24,24,24),$lb(540159537,0,0,0,0,0,0,0,0,0,0,892220416,908996864,822083584,959840256,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,540159537))</Histogram>
<Selectivity>33.3333%</Selectivity>
</Property>
<Property name="ObservationCodeSystemName">
<AverageFieldSize>5.48</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," ACTCODE"," ACTCODE"," ACTCODE"," ACTCODE"," HL7ACTCODE"," LOINC"," SNOMED CT"," SNOMEDCT"),$lb(2,2,2,2,2,2,2,1,9,9,9,1,1,1,7),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1094931523,0,0,0,0,0,0,1094931523,1212954433,1212954433,1280264526,1280264526,1397641037,541283328,1129578496,542330447))</Histogram>
<OutlierSelectivity>.545455:</OutlierSelectivity>
<Selectivity>7.5758%</Selectivity>
</Property>
<Property name="ObservationDisplayName">
<AverageFieldSize>13.97</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," ALCOHOL CONSUMPTION"," ALCOHOL HISTORY"," ASSERTION"," ASSERTION"," ASSERTION"," ASSERTION"," CIGARETTE SMOKING"," CIGARETTE SMOKING"," CIGARETTE SMOKING"," CIGARETTE SMOKING"," EMPLOYMENT"," MARITAL STATUS"," TOBACCO USE AND EXPOSURE"),$lb(2,2,1,9,2,11,11,11,1,19,19,19,1,1,1),$lb(536870912,0,0,0,0,0,1095517007,1129270867,1212765012,1279479624,1397966162,0,0,0,0,0,0,1095979845,1128875841,0,0,0,0,0,0,1128875841,1162694732,1162694732,1296126537,1296126537,1414480449,542396226))</Histogram>
<Selectivity>10.0000%</Selectivity>
</Property>
<Property name="ObservationIDExtension">
<AverageFieldSize>4.15</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," 1"," 1"," 1"," 12882-1568234921000"," 300015-1568234921000"),$lb(2,2,2,2,2,2,2,2,2,2,1,3,3,2,1),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,822083584,0,0,0,0,0,842545202,825374776,858796080,540225584))</Histogram>
<OutlierSelectivity>.727273:</OutlierSelectivity>
<Selectivity>5.4545%</Selectivity>
</Property>
<Property name="ObservationIDRoot">
<AverageFieldSize>27.73</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," 1.2.840.113619.21.1.4778906300703140889.3.11"," 1.3.6.1.4.1.16517"," 1.3.6.1.4.1.16517"," 1.3.6.1.4.1.16517"," 2.16.840.1.113883.19"," 2EA18518-01F0-430C-8E49-E1DDC85BCF92"," 37F76C51-6411-4E1D-8A37-957FD49D2CEF"," 37F76C51-6411-4E1D-8A37-957FD49D2CEF"," 45EFB604-7049-4A2E-AD33-D38556C9636C"," 45EFB604-7049-4A2E-AD33-D38556C9636C"," 9B56C25D-9104-45EE-9FA4-E0F3AFAA01C1"," 9B56C25D-9104-45EE-9FA4-E0F3AFAA01C1"," D065ED71-C4A2-43B7-BFC1-FD412404C942"),$lb(2,2,1,3,19,19,1,2,1,38,1,38,1,38,1),$lb(536870912,0,0,0,0,0,825111086,841889844,858666542,0,0,0,0,825111342,841888054,774977070,1161900344,843399473,859260471,0,0,859260471,875906374,0,0,875906374,960640310,0,0,960640310,1144010293,541339702))</Histogram>
<Selectivity>8.3333%</Selectivity>
</Property>
<Property name="ProfileID">
<AverageFieldSize>11</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"),$lb(11,11,11,11,11,11,11,11,11,11,11,11,11,11,11),$lb(542393683,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,542393683))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="SocialHistoryID">
<AverageFieldSize>4.15</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," 1"," 1"," 1"," 12882-1568234921000"," 300015-1568234921000"),$lb(2,2,2,2,2,2,2,2,2,2,1,3,3,2,1),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,822083584,0,0,0,0,0,842545202,825374776,858796080,540225584))</Histogram>
<OutlierSelectivity>.727273:</OutlierSelectivity>
<Selectivity>5.4545%</Selectivity>
</Property>
<Property name="StatusCode">
<AverageFieldSize>11</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"),$lb(11,11,11,11,11,11,11,11,11,11,11,11,11,11,11),$lb(541282125,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,541282125))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="Units">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="ValueCode">
<AverageFieldSize>5.82</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," 219006"," 266919005"," 266919005"," 266919005"," 266927001"," 428041000124106"," 449868002"),$lb(2,2,2,2,2,2,2,2,1,2,11,11,5,1,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,842086704,825831472,909523249,0,0,0,0,825831472,842477616,842413625,875706416,842543156,876165174,540292153))</Histogram>
<OutlierSelectivity>.606061:</OutlierSelectivity>
<Selectivity>7.8788%</Selectivity>
</Property>
<Property name="ValueCodeSystem">
<AverageFieldSize>12</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"),$lb(2,2,2,2,2,2,2,1,24,24,24,24,24,24,24),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,841888054,0,0,0,0,0,0,0,0,0,0,0,0,0,0,540159537))</Histogram>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="ValueCodeSystemName">
<AverageFieldSize>5.76</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," SNOMED CT"," SNOMED CT"," SNOMED CT"," SNOMED CT"," SNOMED CT"," SNOMED CT"," SNOMEDCT"),$lb(2,2,2,2,2,2,2,2,1,11,11,11,11,11,7),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1397641037,0,0,0,0,0,0,0,0,0,0,541283328,1129578496,542330447))</Histogram>
<Selectivity>33.3333%</Selectivity>
</Property>
<Property name="ValueDisplayName">
<AverageFieldSize>10.18</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," ALCOHOL HISTORY"," CURRENT SOME DAY SMOKER"," CURRENTLY EMPLOYED"," NEVER SMOKED TOBACCO (FINDING)"," NEVER SMOKER"," NEVER SMOKER"," NEVER SMOKER"," UNKNOWN IF EVER SMOKED"),$lb(2,2,2,2,2,2,2,1,1,8,1,12,14,14,1),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1095517007,1095517007,1129665106,542330701,1280909381,1129665106,1313166917,1142969423,1375731712,0,0,0,0,1313166917,1431194446,542461515))</Histogram>
<OutlierSelectivity>.545455:</OutlierSelectivity>
<Selectivity>5.0505%</Selectivity>
</Property>
<Property name="XPath">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^LEADNorthDB04.CCDSocialHi11ECS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
