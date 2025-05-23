Class LEADNorth.CDAProfiler.Sections.CCDEncounter Extends %Persistent
{

Property EncounterNumber As %String(MAXLEN = 255);

Property DocumentID As LEADNorth.CDAProfiler.Sections.CCDDocument [ Required ];

Property EncounterTypeDisplayName As %String(MAXLEN = 255);

Property EncounterTypeCode As %String(MAXLEN = 255);

Property EncounterTypeCodeSystem As %String(MAXLEN = 255);

Property EncounterTypeCodeSystemName As %String(MAXLEN = 255);

Property ReasonForVisit As %String(MAXLEN = 255);

Property VisitDescription As %String(MAXLEN = 255);

Property StatusCode As %String(MAXLEN = 255);

Property StartDateTime As %String(MAXLEN = 255);

Property EndDateTime As %String(MAXLEN = 255);

Property DischargeDisposition As %String(MAXLEN = 255);

Property FacilityName As %String(MAXLEN = 255);

Property FacilityIDAAName As %String(MAXLEN = 255);

Property FacilityIDExtension As %String(MAXLEN = 255);

Property FacilityIDRoot As %String(MAXLEN = 255);

Property PerformerID As %String(MAXLEN = 255);

Property PerformerAddress As %String(MAXLEN = 255);

Property PerformerTelecom As %String(MAXLEN = 255);

Property PerformerName As %String(MAXLEN = 255);

Property AuthorTime As %String(MAXLEN = 255);

Property LocationID As %String(MAXLEN = 255);

Property LocationAddress As %String(MAXLEN = 255);

Property LocationTelecom As %String(MAXLEN = 255);

Property LocationName As %String(MAXLEN = 255);

Property ProfileID As %String [ Required ];

Property XPath As %String(MAXLEN = 255);

Storage Default
{
<Data name="CCDEncounterDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>EncounterNumber</Value>
</Value>
<Value name="3">
<Value>DocumentID</Value>
</Value>
<Value name="4">
<Value>EncounterTypeDisplayName</Value>
</Value>
<Value name="5">
<Value>EncounterTypeCode</Value>
</Value>
<Value name="6">
<Value>EncounterTypeCodeSystem</Value>
</Value>
<Value name="7">
<Value>EncounterTypeCodeSystemName</Value>
</Value>
<Value name="8">
<Value>ReasonForVisit</Value>
</Value>
<Value name="9">
<Value>VisitDescription</Value>
</Value>
<Value name="10">
<Value>StatusCode</Value>
</Value>
<Value name="11">
<Value>StartDateTime</Value>
</Value>
<Value name="12">
<Value>EndDateTime</Value>
</Value>
<Value name="13">
<Value>DischargeDisposition</Value>
</Value>
<Value name="14">
<Value>FacilityName</Value>
</Value>
<Value name="15">
<Value>FacilityIDAAName</Value>
</Value>
<Value name="16">
<Value>FacilityIDExtension</Value>
</Value>
<Value name="17">
<Value>FacilityIDRoot</Value>
</Value>
<Value name="18">
<Value>PerformerID</Value>
</Value>
<Value name="19">
<Value>PerformerAddress</Value>
</Value>
<Value name="20">
<Value>PerformerTelecom</Value>
</Value>
<Value name="21">
<Value>PerformerName</Value>
</Value>
<Value name="22">
<Value>AuthorTime</Value>
</Value>
<Value name="23">
<Value>LocationID</Value>
</Value>
<Value name="24">
<Value>LocationAddress</Value>
</Value>
<Value name="25">
<Value>LocationTelecom</Value>
</Value>
<Value name="26">
<Value>LocationName</Value>
</Value>
<Value name="27">
<Value>ProfileID</Value>
</Value>
<Value name="28">
<Value>XPath</Value>
</Value>
</Data>
<DataLocation>^LEADNorth.LEADB04.CCDEncounterD</DataLocation>
<DefaultData>CCDEncounterDefaultData</DefaultData>
<ExtentSize>38</ExtentSize>
<IdLocation>^LEADNorth.LEADB04.CCDEncounterD</IdLocation>
<IndexLocation>^LEADNorth.LEADB04.CCDEncounterI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,16,$lb("-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000"),$lb(21,21,21,21,21,21,21,21,21,21,21,21,21,21,21),$lb(758198320,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,758198320))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb("1","3","6","9","12","15","18","21","24","26","28","30","32","34","36","38"),$lb(0,0,0,0,1,1,0,1,1,1,0,1,1,1,1),$lb(822083584,822083584,855638016,855638016,905969664,905969664,956301312,956301312,825360384,838860800,889192448,889192448,939524096,825753600,842072064,822083584,872415232,872415232,905969664,905969664,939524096,842530816,858783744,805306368,838860800,838860800,872415232,872415232,905969664,905969664,939524096,859308032))</Histogram>
<Selectivity>1</Selectivity>
</Property>
<Property name="AuthorTime">
<AverageFieldSize>9.74</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," 20161024155432"," 20170218153434"," 20180820110026"," 20190922182949"," 20200605093647"," 20200706083747"," 20210620152944"," 20220301084707"," 20220731235226"," 20230202225026"),$lb(2,2,2,2,2,1,4,4,4,3,6,4,4,6,4),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,842019126,909193266,925905457,925905457,942684210,942684210,959461682,825831481,842018870,909129008,925906480,808466224,825243186,825243186,842019632,858796336,926101810,842020659,858796592,540160050))</Histogram>
<OutlierSelectivity>.447368:</OutlierSelectivity>
<Selectivity>2.7632%</Selectivity>
</Property>
<Property name="DischargeDisposition">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="DocumentID">
<AverageFieldSize>3.18</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb("1","2","3","4","8","8","8","8","8","8","8","8","12","14","16","22"),$lb(0,0,0,0,1,1,1,1,1,1,1,0,1,1,0),$lb(822083584,822083584,838860800,838860800,855638016,855638016,872415232,872415232,939524096,0,0,0,0,0,0,0,0,0,0,0,0,0,0,939524096,825360384,838860800,872415232,872415232,905969664,825622528,842137600,842137600))</Histogram>
<OutlierSelectivity>.552632:8</OutlierSelectivity>
<Selectivity>3.7281%</Selectivity>
</Property>
<Property name="EncounterNumber">
<AverageFieldSize>13.84</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," 162"," 1800192342822480"," 1836583877388010"," 1884796102839520"," 1906969007029730"," 1939822056212640"," 1966447553594250"," 1974930746033130"," 5283815"," 5283815"," 5283815"," 52838151"," 52838152"," 79DAECF1-FF9D-4321-896C-45D3515ED3FC"),$lb(2,1,2,3,3,2,3,3,3,1,9,9,8,8,1),$lb(536870912,0,0,0,825635328,909246464,942682161,808464697,859190584,859190584,942946105,943207479,959460921,808859958,859387954,859387954,909521972,909521972,926169395,825833268,892483635,0,0,0,0,0,822083584,822083584,838860800,892483635,926499905,540490052))</Histogram>
<Selectivity>3.7037%</Selectivity>
</Property>
<Property name="EncounterTypeCode">
<AverageFieldSize>7.39</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," 371531000"," 371531000"," 99213"," 99213"," 99213"," 99214"," 99214"," 99231"," 99231"," 99231"," 99231"," 99231"," 99243"," 99396"," 99396"),$lb(1,11,1,7,7,5,7,4,7,7,7,7,4,3,7),$lb(536870912,0,859255093,0,0,859255093,960049713,0,0,0,0,855638016,872415232,0,0,825491456,858849280,0,0,0,0,0,0,0,0,858849280,875757568,842281728,859387392,0,0,540621107))</Histogram>
<Selectivity>10.0000%</Selectivity>
</Property>
<Property name="EncounterTypeCodeSystem">
<AverageFieldSize>23.42</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," 2.16.840.1.113883.6.12"," 2.16.840.1.113883.6.12"," 2.16.840.1.113883.6.12"," 2.16.840.1.113883.6.12"," 2.16.840.1.113883.6.12"," 2.16.840.1.113883.6.12"," 2.16.840.1.113883.6.12"," 2.16.840.1.113883.6.12"," 2.16.840.1.113883.6.12"," 2.16.840.1.113883.6.12"," 2.16.840.1.113883.6.12"," 2.16.840.1.113883.6.12"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"),$lb(1,24,24,24,24,24,24,24,24,24,24,24,21,24,24),$lb(536870912,0,841888054,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,825360384,959840256,0,0,0,0,540159537))</Histogram>
<OutlierSelectivity>.842105:"2.16.840.1.113883.6.12"</OutlierSelectivity>
<Selectivity>7.8947%</Selectivity>
</Property>
<Property name="EncounterTypeCodeSystemName">
<AverageFieldSize>4.82</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," C4"," C4"," C4"," C4"," C4"," C4"," C4"," CPT"," CPT"," CPT"," CPT"," CPT"," SNOMED"," SNOMED"," SNOMED"),$lb(1,4,4,4,4,4,4,2,5,5,5,5,1,8,8),$lb(536870912,0,1127481344,0,0,0,0,0,0,0,0,0,0,0,0,872415232,1347682304,0,0,0,0,0,0,0,0,1129337856,1397641037,0,0,0,0,542330447))</Histogram>
<Selectivity>20.0000%</Selectivity>
</Property>
<Property name="EncounterTypeDisplayName">
<AverageFieldSize>18.32</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" (99204) OFFICE  VISIT, NEW - LEVEL 4"," 99213 EP DET LOW COMP"," 99213 EP DET LOW COMP"," 99213 EP DET LOW COMP"," 99214 EP COMP MED COMP"," 99214 EP COMP MED COMP"," 99244 CONSULT, LEVEL IV"," ENCOUNTER REPORT"," ENDOCRINOLOGY CONSULT"," EPSV 40-64 YRS *WW (99396)"," INPATIENT"," UNK"," UNK"," UNK"," UNK"," UNK"),$lb(1,23,23,5,24,4,1,3,2,1,1,5,5,5,5),$lb(539507001,674838834,960049713,0,0,0,0,857752912,874530128,0,0,825499717,875831363,960049716,1162756943,1129272654,1146045266,1313099587,1347638816,1162892118,1229869121,1229869121,1431194368,0,0,0,0,0,0,0,0,542461515))</Histogram>
<Selectivity>10.0000%</Selectivity>
</Property>
<Property name="EndDateTime">
<AverageFieldSize>13.24</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," 20161024155441-0400"," 20170403105703-0400"," 20180820110340-0400"," 20190922182957-0400"," 20200605093703-0400"," 20200706083831-0400"," 20210620152951-0400"," 20220301084723-0500"," 20220731235258-0400"," 20230202225330-0500"),$lb(2,2,2,2,2,1,4,4,4,3,6,4,4,6,4),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,842019126,909193266,925905968,925905968,942684210,942684210,959461682,825831481,842018870,909129008,925906480,808466224,825243186,825243186,842019632,858796336,926101810,842020659,858796592,540160050))</Histogram>
<OutlierSelectivity>.394737:</OutlierSelectivity>
<Selectivity>2.7512%</Selectivity>
</Property>
<Property name="FacilityIDAAName">
<AverageFieldSize>24.66</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," 1.2.840.113619.21.1.4778906300703140889.1"," 1.2.840.113619.21.1.4778906300703140889.1"," 1.2.840.113619.21.1.4778906300703140889.1"," 1.2.840.113619.21.1.4778906300703140889.1"," 1.2.840.113619.21.1.4778906300703140889.1"," 1.2.840.113619.21.1.4778906300703140889.1"," 1.2.840.113619.21.1.4778906300703140889.1"," 1.2.840.113619.21.1.4778906300703140889.1"," 1.2.840.113619.21.1.4778906300703140889.1"," 1.2.840.113619.21.1.4778906300703140889.1"),$lb(2,2,2,2,2,1,43,43,43,43,43,43,43,43,43),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,825111086,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,540094002))</Histogram>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="FacilityIDExtension">
<AverageFieldSize>10.84</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," 1446375423000620"," 1621504483007010"," 1820329214511820"," 1820329214511820"," 1820329214511820"," 1820329214511820"," 1820329214511820"," 1820329214511820"," 1820329214511820"," 1820329214511820"),$lb(2,2,2,2,2,1,2,2,18,18,18,18,18,18,18),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,825504822,875836979,909259061,909259061,942813235,0,0,0,0,0,0,0,0,0,0,0,0,0,0,540096562))</Histogram>
<Selectivity>20.0000%</Selectivity>
</Property>
<Property name="FacilityIDRoot">
<AverageFieldSize>24.66</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," 1.2.840.113619.21.1.4778906300703140889.1"," 1.2.840.113619.21.1.4778906300703140889.1"," 1.2.840.113619.21.1.4778906300703140889.1"," 1.2.840.113619.21.1.4778906300703140889.1"," 1.2.840.113619.21.1.4778906300703140889.1"," 1.2.840.113619.21.1.4778906300703140889.1"," 1.2.840.113619.21.1.4778906300703140889.1"," 1.2.840.113619.21.1.4778906300703140889.1"," 1.2.840.113619.21.1.4778906300703140889.1"," 1.2.840.113619.21.1.4778906300703140889.1"),$lb(2,2,2,2,2,1,43,43,43,43,43,43,43,43,43),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,825111086,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,540094002))</Histogram>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="FacilityName">
<AverageFieldSize>27.03</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," CENTER FOR PRIMARY CARE - AIKEN"," CENTER FOR PRIMARY CARE - RINEHART"," CENTER FOR PRIMARY CARE - RINEHART"," CENTER FOR PRIMARY CARE - RINEHART"," CENTER FOR PRIMARY CARE - RINEHART"," CENTER FOR PRIMARY CARE - RINEHART"," CENTER FOR PRIMARY CARE - RINEHART"," COMMUNITY GENERAL HOSPITAL"," GET WELL CLINIC"," GET WELL CLINIC"," LOCAL COMMUNITY HOSPITAL"," LOCAL COMMUNITY HOSPITAL"," LOCAL COMMUNITY HOSPITAL ORGANIZATION"),$lb(2,2,1,27,36,36,36,36,36,2,1,17,1,26,25),$lb(536870912,0,0,0,0,0,1128615508,1095322437,1380535877,0,0,0,0,0,0,0,0,0,0,1162761285,1330466133,1129270605,1195725856,0,0,1195725856,1280262977,0,0,0,542069319,541871939))</Histogram>
<OutlierSelectivity>.421053:"CENTER FOR PRIMARY CARE - RINEHART"</OutlierSelectivity>
<Selectivity>7.2368%</Selectivity>
</Property>
<Property name="LocationAddress">
<AverageFieldSize>25.97</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," 110B SPRINGHALL DRIVE"_$c(10,9,9,9,9,9,9,9,9,9,9)_"SMALLVILLE"_$c(10,9,9,9,9,9,9,9,9,9,9)_"SC"_$c(10,9,9,9,9,9,9,9,9,9,9)_"29445"_$c(10,9,9,9,9,9,9,9,9,9,9)_"US"," 131 RINEHART WAYAIKENSC29803-1703US"," 131 RINEHART WAYAIKENSC29803-1703US"," 131 RINEHART WAYAIKENSC29803-1703US"," 131 RINEHART WAYAIKENSC29803-1703US"," 131 RINEHART WAYAIKENSC29803-1703US"," 131 RINEHART WAYAIKENSC29803-1703US"," 131 RINEHART WAYAIKENSC29803-1703US"," 410 HITCHCOCK PARKWAYAIKENSC29801US"," 410 HITCHCOCK PARKWAYAIKENSC29801US"),$lb(2,2,2,2,2,1,2,37,37,37,37,37,37,1,37),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,825307202,825246240,858857554,0,0,0,0,0,0,0,0,0,0,0,0,825438496,875638816,0,0,540291376))</Histogram>
<Selectivity>14.2857%</Selectivity>
</Property>
<Property name="LocationID">
<AverageFieldSize>10.84</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," 1446375423000620"," 1621504483007010"," 1820329214511820"," 1820329214511820"," 1820329214511820"," 1820329214511820"," 1820329214511820"," 1820329214511820"," 1820329214511820"," 1820329214511820"),$lb(2,2,2,2,2,1,2,2,18,18,18,18,18,18,18),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,825504822,875836979,909259061,909259061,942813235,0,0,0,0,0,0,0,0,0,0,0,0,0,0,540096562))</Histogram>
<Selectivity>20.0000%</Selectivity>
</Property>
<Property name="LocationName">
<AverageFieldSize>27.03</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," CENTER FOR PRIMARY CARE - AIKEN"," CENTER FOR PRIMARY CARE - RINEHART"," CENTER FOR PRIMARY CARE - RINEHART"," CENTER FOR PRIMARY CARE - RINEHART"," CENTER FOR PRIMARY CARE - RINEHART"," CENTER FOR PRIMARY CARE - RINEHART"," CENTER FOR PRIMARY CARE - RINEHART"," COMMUNITY GENERAL HOSPITAL"," GET WELL CLINIC"," GET WELL CLINIC"," LOCAL COMMUNITY HOSPITAL"," LOCAL COMMUNITY HOSPITAL"," LOCAL COMMUNITY HOSPITAL ORGANIZATION"),$lb(2,2,1,27,36,36,36,36,36,2,1,17,1,26,25),$lb(536870912,0,0,0,0,0,1128615508,1095322437,1380535877,0,0,0,0,0,0,0,0,0,0,1162761285,1330466133,1129270605,1195725856,0,0,1195725856,1280262977,0,0,0,542069319,541871939))</Histogram>
<OutlierSelectivity>.421053:"CENTER FOR PRIMARY CARE - RINEHART"</OutlierSelectivity>
<Selectivity>7.2368%</Selectivity>
</Property>
<Property name="LocationTelecom">
<AverageFieldSize>13.32</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," TEL:+1-803-279-6800"," TEL:+1-803-335-2200"," TEL:+1-803-335-2200"," TEL:+1-803-335-2200"," TEL:+1-803-335-2200"," TEL:+1-803-335-2200"," TEL:+1-803-335-2200"," TEL:+1-803-335-2200"," TEL:+1-803-649-6941"," TEL:+1-803-649-6941"),$lb(2,2,2,2,2,1,12,21,21,21,21,21,21,12,21),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,1413827642,842479917,858993965,0,0,0,0,0,0,0,0,0,0,0,0,858993965,909392173,0,0,542393676))</Histogram>
<Selectivity>14.2857%</Selectivity>
</Property>
<Property name="PerformerAddress">
<AverageFieldSize>48.32</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," 1006 HEALTHCARE DRIVE"_$c(10,9,9,9,9,9,9,9,9,9,9)_"PORTLAND"_$c(10,9,9,9,9,9,9,9,9,9,9)_"OR"_$c(10,9,9,9,9,9,9,9,9,9,9)_"97005"_$c(10,9,9,9,9,9,9,9,9,9,9)_"US"," 131 RINEHART WAYAIKENSC29803-1703US"," 131 RINEHART WAYAIKENSC29803-1703US"," 131 RINEHART WAYAIKENSC29803-1703US"," 131 RINEHART WAYAIKENSC29803-1703US"," 131 RINEHART WAYAIKENSC29803-1703US"," 131 RINEHART WAYAIKENSC29803-1703US"," 131 RINEHART WAYAIKENSC29803-1703US"," 131 RINEHART WAYAIKENSC29803-1703US"," GET WELL CLINIC"_$c(10,9,9,9,9,9,9,9,9,9,9)_"1002 HEALTHCARE DR."_$c(10,9,9,9,9,9,9,9,9,9,9)_"PORTLAND"_$c(10,9,9,9,9,9,9,9,9,9,9)_"OR"_$c(10,9,9,9,9,9,9,9,9,9,9)_"97005"_$c(10,9,9,9,9,9,9,9,9,9,9)_"US"," GET WELL CLINIC"_$c(10,9,9,9,9,9,9,9,9,9,9)_"1002 HEALTHCARE DR."_$c(10,9,9,9,9,9,9,9,9,9,9)_"PORTLAND"_$c(10,9,9,9,9,9,9,9,9,9,9)_"OR"_$c(10,9,9,9,9,9,9,9,9,9,9)_"97005"_$c(10,9,9,9,9,9,9,9,9,9,9)_"US"," LOCAL COMMUNITY HOSPITAL"_$c(10,9,9,9,9,9,9,9,9,9,9)_"1034 HEALTHCARE DR."_$c(10,9,9,9,9,9,9,9,9,9,9)_"PORTLAND"_$c(10,9,9,9,9,9,9,9,9,9,9)_"OR"_$c(10,9,9,9,9,9,9,9,9,9,9)_"97005"_$c(10,9,9,9,9,9,9,9,9,9,9)_"US"," LOCAL COMMUNITY HOSPITAL"_$c(10,9,9,9,9,9,9,9,9,9,9)_"1034 HEALTHCARE DR."_$c(10,9,9,9,9,9,9,9,9,9,9)_"PORTLAND"_$c(10,9,9,9,9,9,9,9,9,9,9)_"OR"_$c(10,9,9,9,9,9,9,9,9,9,9)_"97005"_$c(10,9,9,9,9,9,9,9,9,9,9)_"US"),$lb(2,2,1,2,37,37,37,37,37,37,37,1,203,1,212),$lb(536870912,0,0,0,0,0,825241654,808465952,858857554,0,0,0,0,0,0,0,0,0,0,0,0,0,0,825438496,1195725856,0,0,1195725856,1280262977,0,0,541871939))</Histogram>
<OutlierSelectivity>.526316:"131 Rinehart WayAikenSC29803-1703US"</OutlierSelectivity>
<Selectivity>7.8947%</Selectivity>
</Property>
<Property name="PerformerID">
<AverageFieldSize>13.74</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," 1111111111"," 1111111111"," 1111111111"," 1563795232001410"," 1563795232001410"," 1563795232001410"," 1563795232001410"," 1563795232001410"," 1563795232001410"," 1563795232001410"," 1563795232001410"," 1756637090189700"," 1912138983"),$lb(2,2,1,12,12,2,18,18,18,18,18,18,18,2,2),$lb(536870912,0,0,0,0,0,825307441,0,0,0,0,825307441,892744503,0,0,0,0,0,0,0,0,0,0,0,0,0,0,892744503,926234166,926234166,959525425,540096817))</Histogram>
<OutlierSelectivity>.473684:1563795232001410</OutlierSelectivity>
<Selectivity>8.7719%</Selectivity>
</Property>
<Property name="PerformerName">
<AverageFieldSize>23.95</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," ADMIT"_$c(10,9,9,9,9,9,9,9,9,9,9,9)_"AARON"_$c(10,9,9,9,9,9,9,9,9,9,9,9)_"DR"," DALE"_$c(10,9,9,9,9,9,9,9,9,9,9,9)_"OWENS"," MARIA CAROLINACUNHA PINHEIROMACHADO MD"," ROBYNF.FALLAW MD"," ROBYNF.FALLAW MD"," ROBYNF.FALLAW MD"," ROBYNF.FALLAW MD"," ROBYNF.FALLAW MD"," ROBYNF.FALLAW MD"," ROBYNF.FALLAW MD"," SEVEN"_$c(10,9,9,9,9,9,9,9,9,9,9,9)_"HENRY"_$c(10,9,9,9,9,9,9,9,9,9,9,9)_"DR"," SEVEN"_$c(10,9,9,9,9,9,9,9,9,9,9,9)_"HENRY"_$c(10,9,9,9,9,9,9,9,9,9,9,9)_"L"_$c(10,9,9,9,9,9,9,9,9,9,9,9)_"DR"," STAGE"_$c(10,9,9,9,9,9,9,9,9,9,9,9)_"STANLEY"_$c(10,9,9,9,9,9,9,9,9,9,9,9)_"DR"," STAGE"_$c(10,9,9,9,9,9,9,9,9,9,9,9)_"STANLEY"_$c(10,9,9,9,9,9,9,9,9,9,9,9)_"DR"),$lb(2,1,1,1,1,18,18,18,18,18,18,1,75,2,80),$lb(536870912,0,0,0,1094995273,1094995273,1145130053,1145130053,1296126537,1296126537,1380926041,0,0,0,0,0,0,0,0,0,0,0,0,1380926041,1397052997,0,0,1163281742,1413564229,0,0,542331969))</Histogram>
<OutlierSelectivity>.473684:"RobynF.Fallaw MD"</OutlierSelectivity>
<Selectivity>4.7847%</Selectivity>
</Property>
<Property name="PerformerTelecom">
<AverageFieldSize>18.24</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," TEL:+1-(555)555-1002"," TEL:+1-(555)555-1006"," TEL:+1-(555)555-1034"," TEL:+1-803-279-6800"," TEL:+1-803-279-6800"," TEL:+1-803-279-6800"," TEL:+1-803-279-6800"," TEL:+1-803-279-6800"," TEL:+1-803-279-6800"," TEL:+1-803-279-6800"," TEL:+1-803-279-6800"," TEL:+1-803-335-2200"," TEL:+1-803-349-8028"),$lb(2,2,1,20,19,8,21,21,21,21,21,21,21,12,13),$lb(536870912,0,0,0,0,0,1413827642,838860800,905969664,808845312,859045888,674575669,942682925,0,0,0,0,0,0,0,0,0,0,0,0,0,0,842479917,858993965,859122994,876162360,542393676))</Histogram>
<OutlierSelectivity>.473684:"tel:+1-803-279-6800"</OutlierSelectivity>
<Selectivity>6.5789%</Selectivity>
</Property>
<Property name="ProfileID">
<AverageFieldSize>11</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"),$lb(11,11,11,11,11,11,11,11,11,11,11,11,11,11,11),$lb(542393683,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,542393683))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="ReasonForVisit">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="StartDateTime">
<AverageFieldSize>16.79</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," 20111101090051"," 20120806090051"," 20130130090051"," 20161024000000-0400"," 20170214000000-0500"," 20180820000000-0400"," 20190911000000-0400"," 20200605000000-0400"," 20200706000000-0400"," 20210520000000-0400"," 20220111000000-0500"," 20220711000000-0400"," 20230117000000-0500"),$lb(2,2,1,4,4,4,4,4,4,3,6,4,4,6,4),$lb(536870912,0,0,0,0,0,842019121,825307440,842020912,842020912,858796339,858796339,909193266,909193266,925905457,925905457,942684210,942684210,959461681,825831481,842018870,909129008,925906480,808466224,825242930,825242930,842019121,825307440,925970736,842020657,858796337,540160050))</Histogram>
<Selectivity>3.7037%</Selectivity>
</Property>
<Property name="StatusCode">
<AverageFieldSize>6.97</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"),$lb(2,2,2,2,2,1,11,11,11,11,11,11,11,11,11),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,1129270608,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,541282125))</Histogram>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="VisitDescription">
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
<BlockCount>-12</BlockCount>
</SQLMap>
<StreamLocation>^LEADNorth.LEADB04.CCDEncounterS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
