Class LEADNorth.CDAProfiler.Sections.CCDProcedure Extends %Persistent
{

Property DocumentID As LEADNorth.CDAProfiler.Sections.CCDDocument [ Required ];

Property ProcedureCode As %String(MAXLEN = 255);

Property CodeSystem As %String(MAXLEN = 255);

Property CodeDisplayName As %String(MAXLEN = 2550);

Property ProcedureClassCode As %String(MAXLEN = 255);

Property CodeSystemName As %String(MAXLEN = 255);

Property MoodCode As %String(MAXLEN = 255);

Property Status As %String(MAXLEN = 255);

Property EffectiveTimeLow As %String(MAXLEN = 255);

Property EffectiveTimeHigh As %String(MAXLEN = 255);

Property PriorityCode As %String(MAXLEN = 50);

Property TargetSiteCode As %String(MAXLEN = 50);

Property PerformerID As %String(MAXLEN = 255);

Property PerformerName As %String(MAXLEN = 255);

Property PerformerOrganization As %String(MAXLEN = 255);

Property PerformerAddress As %String(MAXLEN = 255);

Property AuthorTime As %String(MAXLEN = 50);

Property ProfileID As %String [ Required ];

Property NullValues As %String(MAXLEN = 255);

Property SDAMapping As %String(MAXLEN = 255);

Property XPath As %String(MAXLEN = 255);

Storage Default
{
<Data name="CCDProcedureDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>DocumentID</Value>
</Value>
<Value name="3">
<Value>ProcedureCode</Value>
</Value>
<Value name="4">
<Value>CodeSystem</Value>
</Value>
<Value name="5">
<Value>CodeDisplayName</Value>
</Value>
<Value name="6">
<Value>ProcedureClassCode</Value>
</Value>
<Value name="7">
<Value>CodeSystemName</Value>
</Value>
<Value name="8">
<Value>MoodCode</Value>
</Value>
<Value name="9">
<Value>Status</Value>
</Value>
<Value name="10">
<Value>EffectiveTimeLow</Value>
</Value>
<Value name="11">
<Value>EffectiveTimeHigh</Value>
</Value>
<Value name="12">
<Value>PriorityCode</Value>
</Value>
<Value name="13">
<Value>TargetSiteCode</Value>
</Value>
<Value name="14">
<Value>PerformerID</Value>
</Value>
<Value name="15">
<Value>PerformerName</Value>
</Value>
<Value name="16">
<Value>PerformerOrganization</Value>
</Value>
<Value name="17">
<Value>PerformerAddress</Value>
</Value>
<Value name="18">
<Value>AuthorTime</Value>
</Value>
<Value name="19">
<Value>ProfileID</Value>
</Value>
<Value name="20">
<Value>NullValues</Value>
</Value>
<Value name="21">
<Value>SDAMapping</Value>
</Value>
<Value name="22">
<Value>XPath</Value>
</Value>
</Data>
<DataLocation>^LEADNorth.LEADB04.CCDProcedureD</DataLocation>
<DefaultData>CCDProcedureDefaultData</DefaultData>
<ExtentSize>92</ExtentSize>
<IdLocation>^LEADNorth.LEADB04.CCDProcedureD</IdLocation>
<IndexLocation>^LEADNorth.LEADB04.CCDProcedureI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,16,$lb("-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000"),$lb(21,21,21,21,21,21,21,21,21,21,21,21,21,21,21),$lb(758198320,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,758198320))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb("1","7","14","20","26","32","38","44","50","56","62","68","74","80","86","92"),$lb(0,0,0,1,0,1,0,0,1,0,1,0,0,1,0),$lb(822083584,822083584,922746880,922746880,825491456,825491456,842006528,805306368,905969664,842399744,858914816,838860800,939524096,859308032,875823104,875823104,892338176,805306368,905969664,892731392,909246464,838860800,939524096,909639680,926154752,926154752,942669824,805306368,905969664,943063040,959578112,959578112))</Histogram>
<Selectivity>1</Selectivity>
</Property>
<Property name="AuthorTime">
<AverageFieldSize>14.22</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," 20130710221420.000-0500"," 20170301093920"," 20170301093926"," 20180313181601"," 20180916162307"," 20200605093649"," 20200617171059"," 20210111232143"," 20210715173141"," 20220111160302"," 20220705102322"," 20220731235226"," 20230117163435"," 20230202225027"),$lb(2,1,4,14,4,6,3,7,4,6,4,6,7,4,6),$lb(536870912,0,0,0,842019123,858797873,925905712,805306368,905969664,925905712,942682929,858862385,959526449,825765945,842018870,808792121,825700663,808465969,825241905,825307442,925971761,825243441,842019121,825307441,925906225,808792368,858862131,842020659,858796337,825308977,842019378,540160050))</Histogram>
<OutlierSelectivity>.141304:</OutlierSelectivity>
<Selectivity>1.8667%</Selectivity>
</Property>
<Property name="CodeDisplayName">
<AverageFieldSize>13.38</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," ADMINISTRATION FEE"," BMI34"," BMI34"," BMI35"," BMI36"," CBC W/DIFF WITH PLATELETS *"," COLONIC POLYPECTOMY"," COMP METABOLIC"," DBP3"," HA1C *"," LIPID PROFILE"," ORTHOPEDIC CONSULT"," SBP3"," TSH"," VITAMIN D (25 OH)"),$lb(1,1,7,5,5,1,2,3,1,1,1,1,1,1,1),$lb(536870912,0,1094995273,1094995273,1112361267,0,0,872415232,889192448,889192448,905969664,1112361267,1128416032,1111695447,1330401102,1280265801,1297096781,1129270608,1145196595,1145196595,1212232003,1212232003,1279873097,1279873097,1330795592,1330795592,1396854835,1396854835,1414744064,1414744064,1447646273,542525780))</Histogram>
<Selectivity>2.6316%</Selectivity>
</Property>
<Property name="CodeSystem">
<AverageFieldSize>22.57</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," 2.16.840.1.113883.6.12"," 2.16.840.1.113883.6.12"," 2.16.840.1.113883.6.12"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"),$lb(1,24,24,21,24,24,24,24,24,24,24,24,24,24,24),$lb(536870912,0,841888054,0,0,0,0,825360384,959840256,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,540159537))</Histogram>
<OutlierSelectivity>.75:"2.16.840.1.113883.6.96"</OutlierSelectivity>
<Selectivity>12.5000%</Selectivity>
</Property>
<Property name="CodeSystemName">
<AverageFieldSize>8.92</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," C4"," C4"," CPT-4"," SNOMED CT"," SNOMED CT"," SNOMED CT"," SNOMED CT"," SNOMED CT"," SNOMED CT"," SNOMED CT"," SNOMED CT"," SNOMED CT"," SNOMED CT"," SNOMED-CT"),$lb(2,1,4,2,1,11,11,11,11,11,11,11,11,11,7),$lb(536870912,0,0,0,1127481344,0,0,872415232,1347693876,1129337901,1397641037,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,541283328,759387136,542330447))</Histogram>
<OutlierSelectivity>.706522:"SNOMED CT"</OutlierSelectivity>
<Selectivity>7.3370%</Selectivity>
</Property>
<Property name="DocumentID">
<AverageFieldSize>3.13</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb("3","8","8","8","8","8","8","8","8","8","8","8","8","8","13","22"),$lb(0,1,1,1,1,1,1,1,1,1,1,1,1,0,0),$lb(855638016,855638016,939524096,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,939524096,825425920,825425920,842137600,842137600))</Histogram>
<OutlierSelectivity>.836957:8</OutlierSelectivity>
<Selectivity>1.3587%</Selectivity>
</Property>
<Property name="EffectiveTimeHigh">
<AverageFieldSize>20.18</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," 20140212130114"," 20170117081341-0500"," 20170301093920-0500"," 20170328081847-0400"," 20180904101838-0400"," 20200601101444-0400"," 20200617171100-0400"," 20210104090131-0500"," 20210706084616-0400"," 20210808165149-0400"," 20220301084723-0500"," 20220713165814-0400"," 20230110093541-0500"," 20230117163435-0500"," 202306190000-0600"),$lb(1,4,6,7,4,3,7,4,6,6,4,6,4,8,6),$lb(536870912,0,842019124,875573809,925905201,825308976,858796336,808529977,842543160,925905714,942684464,825765945,842018870,808530224,825700663,808465969,825241904,825242672,925906480,925906480,942684209,825243696,842019632,858796336,925971249,842020657,858796337,808466739,925972019,825308977,909195568,540160050))</Histogram>
<Selectivity>2.0000%</Selectivity>
</Property>
<Property name="EffectiveTimeLow">
<AverageFieldSize>20.18</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," 20140212130114"," 20170103000000-0500"," 20170214000000-0500"," 20170301000000-0500"," 20180820000000-0400"," 20200601000000-0400"," 20200605000000-0400"," 20210104000000-0500"," 20210706000000-0400"," 20210715000000-0400"," 20220111000000-0500"," 20220705000000-0400"," 20230110000000-0500"," 20230110000000-0500"," 202306190000-0600"),$lb(1,4,6,6,4,3,8,4,6,7,4,6,4,21,6),$lb(536870912,0,842019124,875573809,925905200,825242416,842085424,842085424,858796336,925905712,942684210,825765944,842018870,825241648,892350512,808465968,825241904,825242672,925906480,808857648,825569328,825243441,842019121,825307440,925906224,842020656,858796337,0,0,825307184,909195568,540160050))</Histogram>
<Selectivity>2.9412%</Selectivity>
</Property>
<Property name="MoodCode">
<AverageFieldSize>5</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" EVN"," EVN"," EVN"," EVN"," EVN"," EVN"," EVN"," EVN"," EVN"," EVN"," EVN"," EVN"," EVN"," EVN"," EVN"," EVN"),$lb(5,5,5,5,5,5,5,5,5,5,5,5,5,5,5),$lb(541414990,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,541414990))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="NullValues">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="PerformerAddress">
<AverageFieldSize>35.85</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," 131 RINEHART WAYAIKENSC29803-1703US"," 131 RINEHART WAYAIKENSC29803-1703US"," 131 RINEHART WAYAIKENSC29803-1703US"," 131 RINEHART WAYAIKENSC29803-1703US"," 131 RINEHART WAYAIKENSC29803-1703US"," 131 RINEHART WAYAIKENSC29803-1703US"," 131 RINEHART WAYAIKENSC29803-1703US"," 131 RINEHART WAYAIKENSC29803-1703US"," 131 RINEHART WAYAIKENSC29803-1703US"," 131 RINEHART WAYAIKENSC29803-1703US"," 131 RINEHART WAYAIKENSC29803-1703US"," 17 DAWS RD."_$c(10,9,9,9,9,9,9,9,9,9,9)_"BLUE BELL"_$c(10,9,9,9,9,9,9,9,9,9,9)_"MA"_$c(10,9,9,9,9,9,9,9,9,9,9)_"02368"_$c(10,9,9,9,9,9,9,9,9,9,9)_"US"," 2011 WINDSOR SPRING ROADAUGUSTAGA30906-4957US"," 2011 WINDSOR SPRING ROADAUGUSTAGA30906-4957US"),$lb(2,1,37,37,37,37,37,37,37,37,37,37,2,1,47),$lb(536870912,0,0,0,825438496,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,858857554,924861505,825696324,842019121,0,0,540160049))</Histogram>
<OutlierSelectivity>.706522:"131 Rinehart WayAikenSC29803-1703US"</OutlierSelectivity>
<Selectivity>7.3370%</Selectivity>
</Property>
<Property name="PerformerID">
<AverageFieldSize>15.47</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," 1563795232001410"," 1563795232001410"," 1563795232001410"," 1563795232001410"," 1563795232001410"," 1563795232001410"," 1563795232001410"," 1563795232001410"," 1563795232001410"," 1563795232001410"," 1756637090189700"," 1756637090189700"," 2981823"),$lb(2,2,1,18,18,18,18,18,18,18,18,18,2,18,1),$lb(536870912,0,0,0,0,0,825570867,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,892744503,926234166,0,0,825701686,842610737,540162360))</Histogram>
<OutlierSelectivity>.684783:1563795232001410</OutlierSelectivity>
<Selectivity>6.3043%</Selectivity>
</Property>
<Property name="PerformerName">
<AverageFieldSize>9.72</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," FALLAW MD"," FALLAW MD"," FALLAW MD"," FALLAW MD"," FALLAW MD"," FALLAW MD"," FALLAW MD"," FALLAW MD"," FALLAW MD"," FALLAW MD"," MACHADO MD"," MACHADO MD"," MUNIZ MD"),$lb(2,2,1,11,11,11,11,11,11,11,11,11,1,12,2),$lb(536870912,0,0,0,0,0,1178684492,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1178684492,1296122696,0,0,1094928449,1431193946,541939022))</Histogram>
<OutlierSelectivity>.684783:"Fallaw MD"</OutlierSelectivity>
<Selectivity>7.8804%</Selectivity>
</Property>
<Property name="PerformerOrganization">
<AverageFieldSize>31.37</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," CENTER FOR PRIMARY CARE - RINEHART"," CENTER FOR PRIMARY CARE - RINEHART"," CENTER FOR PRIMARY CARE - RINEHART"," CENTER FOR PRIMARY CARE - RINEHART"," CENTER FOR PRIMARY CARE - RINEHART"," CENTER FOR PRIMARY CARE - RINEHART"," CENTER FOR PRIMARY CARE - RINEHART"," CENTER FOR PRIMARY CARE - RINEHART"," CENTER FOR PRIMARY CARE - RINEHART"," CENTER FOR PRIMARY CARE - RINEHART"," CENTER FOR PRIMARY CARE - RINEHART"," CENTER FOR PRIMARY CARE PC - SOUTH"," CENTER FOR PRIMARY CARE PC - SOUTH"," GOOD HEALTH CLINIC"),$lb(2,1,36,36,36,36,36,36,36,36,36,36,25,36,1),$lb(536870912,0,0,0,1128615508,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,757092937,1346576429,0,0,1128615508,1196379972,541544271))</Histogram>
<OutlierSelectivity>.706522:"CENTER FOR PRIMARY CARE - RINEHART"</OutlierSelectivity>
<Selectivity>7.3370%</Selectivity>
</Property>
<Property name="PriorityCode">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="ProcedureClassCode">
<AverageFieldSize>6</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" PROC"," PROC"," PROC"," PROC"," PROC"," PROC"," PROC"," PROC"," PROC"," PROC"," PROC"," PROC"," PROC"," PROC"," PROC"," PROC"),$lb(6,6,6,6,6,6,6,6,6,6,6,6,6,6,6),$lb(542134863,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,542134863))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="ProcedureCode">
<AverageFieldSize>3.66</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," 274025005"," 3075F"," 3079F"," 36415"," G8420"),$lb(2,2,2,2,2,2,2,2,2,2,1,1,4,2,1),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,842478640,842478640,858797877,893779968,960888832,808925510,909390133,859190321,1194865714,541538356))</Histogram>
<OutlierSelectivity>.728261:</OutlierSelectivity>
<Selectivity>1.8116%</Selectivity>
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
<Property name="Status">
<AverageFieldSize>10.97</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" ACTIVE"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"),$lb(1,11,11,11,11,11,11,11,11,11,11,11,11,11,11),$lb(541147988,1094931529,1129270608,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,541282125))</Histogram>
<OutlierSelectivity>.98913:"completed"</OutlierSelectivity>
<Selectivity>1.0870%</Selectivity>
</Property>
<Property name="TargetSiteCode">
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
<BlockCount>-16</BlockCount>
</SQLMap>
<StreamLocation>^LEADNorth.LEADB04.CCDProcedureS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
