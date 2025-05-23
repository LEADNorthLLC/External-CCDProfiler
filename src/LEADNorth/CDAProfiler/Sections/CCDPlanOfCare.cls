Class LEADNorth.CDAProfiler.Sections.CCDPlanOfCare Extends %Persistent
{

Property PlanOfCareID As %String(MAXLEN = 255);

Property DocumentID As LEADNorth.CDAProfiler.Sections.CCDDocument [ Required ];

Property EncounterID As %String(MAXLEN = 255);

Property EncounterExtension As %String(MAXLEN = 255);

Property DisplayName As %String(MAXLEN = 255);

Property StatusCode As %String(MAXLEN = 100);

Property EffectiveTimeLow As %String(MAXLEN = 50);

Property EffectiveTimeHigh As %String(MAXLEN = 50);

Property PerformerID As %String(MAXLEN = 255);

Property PerformerOrganization As %String(MAXLEN = 255);

Property PerformerAddress As %String(MAXLEN = 255);

Property PerformerCity As %String(MAXLEN = 255);

Property PerformerState As %String(MAXLEN = 255);

Property PerformerPostalCode As %String(MAXLEN = 255);

Property AuthorTime As %String(MAXLEN = 50);

Property ProfileID As %String [ Required ];

Property NullValues As %String(MAXLEN = 255);

Property SDAMapping As %String(MAXLEN = 255);

Property XPath As %String(MAXLEN = 255);

Storage Default
{
<Data name="CCDPlanOfCareDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>PlanOfCareID</Value>
</Value>
<Value name="3">
<Value>DocumentID</Value>
</Value>
<Value name="4">
<Value>EncounterID</Value>
</Value>
<Value name="5">
<Value>EncounterExtension</Value>
</Value>
<Value name="6">
<Value>DisplayName</Value>
</Value>
<Value name="7">
<Value>StatusCode</Value>
</Value>
<Value name="8">
<Value>EffectiveTimeLow</Value>
</Value>
<Value name="9">
<Value>EffectiveTimeHigh</Value>
</Value>
<Value name="10">
<Value>PerformerID</Value>
</Value>
<Value name="11">
<Value>PerformerOrganization</Value>
</Value>
<Value name="12">
<Value>PerformerAddress</Value>
</Value>
<Value name="13">
<Value>PerformerCity</Value>
</Value>
<Value name="14">
<Value>PerformerState</Value>
</Value>
<Value name="15">
<Value>PerformerPostalCode</Value>
</Value>
<Value name="16">
<Value>AuthorTime</Value>
</Value>
<Value name="17">
<Value>ProfileID</Value>
</Value>
<Value name="18">
<Value>NullValues</Value>
</Value>
<Value name="19">
<Value>SDAMapping</Value>
</Value>
<Value name="20">
<Value>XPath</Value>
</Value>
</Data>
<DataLocation>^LEADNorth.LEDB04.CCDPlanOfCareD</DataLocation>
<DefaultData>CCDPlanOfCareDefaultData</DefaultData>
<ExtentSize>17</ExtentSize>
<IdLocation>^LEADNorth.LEDB04.CCDPlanOfCareD</IdLocation>
<IndexLocation>^LEADNorth.LEDB04.CCDPlanOfCareI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,16,$lb("-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000"),$lb(21,21,21,21,21,21,21,21,21,21,21,21,21,21,21),$lb(758198320,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,758198320))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb("1","2","4","5","6","7","8","9","10","11","12","13","14","15","16","17"),$lb(0,0,0,0,0,0,0,0,1,1,1,1,1,1,1),$lb(822083584,822083584,838860800,838860800,872415232,872415232,889192448,889192448,905969664,905969664,922746880,922746880,939524096,939524096,956301312,956301312,825229312,805306368,822083584,822083584,838860800,838860800,855638016,855638016,872415232,872415232,889192448,889192448,905969664,905969664,922746880,825688064))</Histogram>
<Selectivity>1</Selectivity>
</Property>
<Property name="AuthorTime">
<AverageFieldSize>6.94</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," 20180313181535"," 20180820110015"," 20200605093537"," 20220711161155"," 20230117163624"," 20230117163740"),$lb(2,2,2,2,2,2,2,2,2,1,6,3,4,4,12),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,842019128,858862385,942813233,825765944,842018870,808465968,842020657,842020657,858796337,909259776,926167040,540160050))</Histogram>
<OutlierSelectivity>.647059:</OutlierSelectivity>
<Selectivity>5.8824%</Selectivity>
</Property>
<Property name="DisplayName">
<AverageFieldSize>10.12</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," CARDIOVASCULAR STRESS TEST, NUCLEAR WITH EXERCISE"," MAMMOGRAM, SCREENING, BOTH BREASTS (OFFICE SCHEDULES)"," ORTHOPEDIC CONSULT"," ORTHOPEDIC CONSULT"),$lb(2,2,2,2,2,2,2,2,2,2,2,1,1,1,20),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1128354372,1128354372,1296125261,1296125261,1330795592,0,0,542069332))</Histogram>
<OutlierSelectivity>.764706:</OutlierSelectivity>
<Selectivity>7.8431%</Selectivity>
</Property>
<Property name="DocumentID">
<AverageFieldSize>3.35</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb("3","4","7","8","8","8","8","8","8","8","10","11","12","18","20","21"),$lb(0,0,0,1,1,1,1,1,1,0,1,1,1,0,1),$lb(855638016,855638016,872415232,872415232,922746880,922746880,939524096,0,0,0,0,0,0,0,0,0,0,0,0,939524096,825229312,805306368,822083584,822083584,838860800,838860800,939524096,825753600,842006528,805306368,822083584,842072064))</Histogram>
<OutlierSelectivity>.411765:8</OutlierSelectivity>
<Selectivity>5.8824%</Selectivity>
</Property>
<Property name="EffectiveTimeHigh">
<AverageFieldSize>8.71</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," 20180316102739-0400"," 20180904085930-0400"," 20200728170854-0400"," 20220711161156-0400"," 20230713093000-0400"," 20230725161500-0400"),$lb(2,2,2,2,2,2,2,2,2,1,6,3,4,4,7),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,842019128,858863153,959460400,825765945,842018871,808466226,842020657,842020657,858797873,825438265,842346806,540160050))</Histogram>
<OutlierSelectivity>.647059:</OutlierSelectivity>
<Selectivity>5.8824%</Selectivity>
</Property>
<Property name="EffectiveTimeLow">
<AverageFieldSize>8.71</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," 20180313000000-0400"," 20180820000000-0400"," 20200605000000-0400"," 20220711000000-0400"," 20230713091500-0400"," 20230725154500-0400"),$lb(2,2,2,2,2,2,2,2,2,1,6,3,4,4,7),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,842019128,858862384,942813232,825765944,842018870,808465968,842020657,842020657,858797873,825438265,842346805,540160050))</Histogram>
<OutlierSelectivity>.647059:</OutlierSelectivity>
<Selectivity>5.8824%</Selectivity>
</Property>
<Property name="EncounterExtension">
<AverageFieldSize>6.59</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," 1836583877387940"," 1850381957861220"," 1906968842979750"," 1973175084689790"," 3260918"," 3260922"),$lb(2,2,2,2,2,2,2,2,2,1,3,2,3,1,6),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,825766710,859190584,892351288,943009843,959460921,808859958,926101815,825833267,858928688,825753600,842137600,540226102))</Histogram>
<OutlierSelectivity>.647059:</OutlierSelectivity>
<Selectivity>5.8824%</Selectivity>
</Property>
<Property name="EncounterID">
<AverageFieldSize>18.24</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," 1.2.840.113619.21.1.4778906300703140889.3.12.1"," 1.2.840.113619.21.1.4778906300703140889.3.12.1"," 1.2.840.113619.21.1.4778906300703140889.3.12.3"," 1.2.840.113619.21.1.4778906300703140889.3.12.3"," 1.2.840.113619.21.1.4778906300703140889.3.12.3"," 1.2.840.113619.21.1.4778906300703140889.3.12.3"),$lb(2,2,2,2,2,2,2,2,2,1,48,46,48,48,48),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,825111086,0,0,822083584,855638016,0,0,0,0,0,0,540094002))</Histogram>
<Selectivity>33.3333%</Selectivity>
</Property>
<Property name="NullValues">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="PerformerAddress">
<AverageFieldSize>5.12</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," 1120 15ST STREET"," 302 UNIVERSITY PARKWAY"," 811 13TH STREET"),$lb(2,2,2,2,2,2,2,2,2,2,2,2,1,1,1),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,825307696,825307696,858796576,858796576,942747936,540553521))</Histogram>
<OutlierSelectivity>.823529:</OutlierSelectivity>
<Selectivity>5.8824%</Selectivity>
</Property>
<Property name="PerformerCity">
<AverageFieldSize>3.12</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," AIKEN"," AUGUSTA"," AUGUSTA"),$lb(2,2,2,2,2,2,2,2,2,2,2,2,1,2,9),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1095322437,1229669710,1430738259,0,0,541152583))</Histogram>
<OutlierSelectivity>.823529:</OutlierSelectivity>
<Selectivity>8.8235%</Selectivity>
</Property>
<Property name="PerformerID">
<AverageFieldSize>4.82</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," 1741089351252180"," 1773930087003910"," 1787848927861440"),$lb(2,2,2,2,2,2,2,2,2,2,2,2,1,3,3),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,825701425,875638840,926103859,926103859,943142964,540096312))</Histogram>
<OutlierSelectivity>.823529:</OutlierSelectivity>
<Selectivity>5.8824%</Selectivity>
</Property>
<Property name="PerformerOrganization">
<AverageFieldSize>6.94</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," AIKEN REGIONAL MEDICAL CENTER"," AUGUSTA UNIVERSITY CONCIERGE"," LEGEND ORTHOPEDICS- AUGUSTA"),$lb(2,2,2,2,2,2,2,2,2,2,2,2,1,2,1),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1095322437,1229669710,1430738259,1096107861,1279608645,541869383))</Histogram>
<OutlierSelectivity>.823529:</OutlierSelectivity>
<Selectivity>5.8824%</Selectivity>
</Property>
<Property name="PerformerPostalCode">
<AverageFieldSize>2.88</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," 29801"," 30901"," 30901"),$lb(2,2,2,2,2,2,2,2,2,2,2,2,1,1,7),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,842610736,842610736,858798384,0,0,540225593))</Histogram>
<OutlierSelectivity>.823529:</OutlierSelectivity>
<Selectivity>8.8235%</Selectivity>
</Property>
<Property name="PerformerState">
<AverageFieldSize>2.35</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," GA"," GA"," SC"),$lb(2,2,2,2,2,2,2,2,2,2,2,2,1,4,1),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1195442176,0,0,1195442176,1396899840,542327552))</Histogram>
<OutlierSelectivity>.823529:</OutlierSelectivity>
<Selectivity>8.8235%</Selectivity>
</Property>
<Property name="PlanOfCareID">
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
<Property name="StatusCode">
<AverageFieldSize>3.06</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," NEW"," NEW"," NEW"," NEW"," NEW"," NEW"),$lb(2,2,2,2,2,2,2,2,2,1,5,5,5,5,5),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1313167104,0,0,0,0,0,0,0,0,0,0,542000471))</Histogram>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="XPath">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^LEADNorth.LEDB04.CCDPlanOfCareS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
