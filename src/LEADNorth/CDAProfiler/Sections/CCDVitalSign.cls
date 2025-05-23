Class LEADNorth.CDAProfiler.Sections.CCDVitalSign Extends %Persistent
{

Property DocumentID As LEADNorth.CDAProfiler.Sections.CCDDocument;

Property VitalSignID As %String(MAXLEN = 255);

Property xDate As %String(MAXLEN = 255);

Property Value As %String(MAXLEN = 255);

Property Unit As %String(MAXLEN = 255);

Property Description As %String(MAXLEN = 255);

Property OrganizerClassCode As %String(MAXLEN = 20);

Property OrganizerMoodCode As %String(MAXLEN = 20);

Property OrganizerCode As %String(MAXLEN = 20);

Property OrganizerCodeSystem As %String(MAXLEN = 255);

Property OrganizerDisplayName As %String(MAXLEN = 255);

Property OrganizerStatusCode As %String(MAXLEN = 20);

Property OrganizerEffectiveTimeLow As %String;

Property OrganizerEffectiveTimeHigh As %String;

Property ObservationIDExtension As %String(MAXLEN = 255);

Property ObservationIDRoot As %String(MAXLEN = 255);

Property ObservationCode As %String(MAXLEN = 20);

Property ObservationCodeSystem As %String(MAXLEN = 255);

Property ObservationDisplayName As %String(MAXLEN = 255);

Property ObservationStatusCode As %String(MAXLEN = 20);

Property ObservationEffectiveTimeLow As %String;

Property ObservationEffectiveTimeHigh As %String;

Property AuthorTime As %String;

Property ProfileID As %String [ Required ];

Property TranslationCode As %String(MAXLEN = 20);

Property TranslationCodeSystem As %String(MAXLEN = 255);

Property TranslationDisplayName As %String(MAXLEN = 255);

Property InterpretationCode As %String(MAXLEN = 20);

Property MethodCode As %String(MAXLEN = 20);

Property XPath As %String(MAXLEN = 255);

Storage Default
{
<Data name="CCDVitalSignDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>DocumentID</Value>
</Value>
<Value name="3">
<Value>VitalSignID</Value>
</Value>
<Value name="4">
<Value>xDate</Value>
</Value>
<Value name="5">
<Value>Value</Value>
</Value>
<Value name="6">
<Value>Unit</Value>
</Value>
<Value name="7">
<Value>Description</Value>
</Value>
<Value name="8">
<Value>OrganizerClassCode</Value>
</Value>
<Value name="9">
<Value>OrganizerMoodCode</Value>
</Value>
<Value name="10">
<Value>OrganizerCode</Value>
</Value>
<Value name="11">
<Value>OrganizerCodeSystem</Value>
</Value>
<Value name="12">
<Value>OrganizerDisplayName</Value>
</Value>
<Value name="13">
<Value>OrganizerStatusCode</Value>
</Value>
<Value name="14">
<Value>OrganizerEffectiveTimeLow</Value>
</Value>
<Value name="15">
<Value>OrganizerEffectiveTimeHigh</Value>
</Value>
<Value name="16">
<Value>ObservationIDExtension</Value>
</Value>
<Value name="17">
<Value>ObservationIDRoot</Value>
</Value>
<Value name="18">
<Value>ObservationCode</Value>
</Value>
<Value name="19">
<Value>ObservationCodeSystem</Value>
</Value>
<Value name="20">
<Value>ObservationDisplayName</Value>
</Value>
<Value name="21">
<Value>ObservationStatusCode</Value>
</Value>
<Value name="22">
<Value>ObservationEffectiveTimeLow</Value>
</Value>
<Value name="23">
<Value>ObservationEffectiveTimeHigh</Value>
</Value>
<Value name="24">
<Value>AuthorTime</Value>
</Value>
<Value name="25">
<Value>ProfileID</Value>
</Value>
<Value name="26">
<Value>TranslationCode</Value>
</Value>
<Value name="27">
<Value>TranslationCodeSystem</Value>
</Value>
<Value name="28">
<Value>TranslationDisplayName</Value>
</Value>
<Value name="29">
<Value>InterpretationCode</Value>
</Value>
<Value name="30">
<Value>MethodCode</Value>
</Value>
<Value name="31">
<Value>XPath</Value>
</Value>
</Data>
<DataLocation>^LEADNorth.LEADB04.CCDVitalSignD</DataLocation>
<DefaultData>CCDVitalSignDefaultData</DefaultData>
<ExtentSize>107</ExtentSize>
<IdLocation>^LEADNorth.LEADB04.CCDVitalSignD</IdLocation>
<IndexLocation>^LEADNorth.LEADB04.CCDVitalSignI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,16,$lb("-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000"),$lb(21,21,21,21,21,21,21,21,21,21,21,21,21,21,21),$lb(758198320,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,758198320))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb("1","8","16","23","30","37","44","51","58","65","72","79","86","93","100","107"),$lb(0,0,0,0,1,0,0,1,0,0,1,0,0,0,2),$lb(822083584,822083584,939524096,939524096,825622528,825622528,842203136,842203136,858783744,805306368,922746880,859242496,875823104,875823104,892403712,822083584,939524096,892862464,909443072,909443072,926023680,838860800,956301312,926482432,943063040,943063040,959643648,959643648,825241600,805306368,922746880,825243392))</Histogram>
<Selectivity>1</Selectivity>
</Property>
<Property name="AuthorTime">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="Description">
<AverageFieldSize>17.91</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" BMI"," BODY MASS INDEX CALCULATED"," BODY TEMPERATURE"," BP DIASTOLIC"," BP SYSTOLIC"," BP SYSTOLIC"," HEART RATE"," HEIGHT"," HEIGHT"," HEIGHT/LENGTH MEASURED"," INTRAVASCULAR SYSTOLIC"," NO VITAL SIGN DATA IS APPLICABLE"," PATIENT BODY WEIGHT - MEASURED"," SYSTOLIC BLOOD PRESSURE"," WEIGHT"," WEIGHT MEASURED"),$lb(2,6,2,4,13,1,3,8,7,1,1,1,1,1,7),$lb(541216073,1296629760,1329879328,1296126803,1413827920,1329879328,1344291913,1145651539,1398362964,0,0,1112547411,1212498258,1095914528,1229408340,0,0,0,793527630,1212500295,1229870162,1229870162,1313808470,1313808470,1346458697,1346458697,1398362964,1398362964,1464158535,0,541934913,542590281))</Histogram>
<OutlierSelectivity>.17757:"Height"</OutlierSelectivity>
<Selectivity>2.4922%</Selectivity>
</Property>
<Property name="DocumentID">
<AverageFieldSize>3.36</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb("1","2","3","3","4","4","5","6","7","8","10","11","12","16","21","22"),$lb(0,0,1,0,1,0,0,0,0,0,1,1,1,0,1),$lb(822083584,822083584,838860800,838860800,855638016,0,0,855638016,872415232,0,0,872415232,889192448,889192448,905969664,905969664,922746880,922746880,939524096,939524096,825229312,805306368,822083584,822083584,838860800,838860800,905969664,825622528,842072064,822083584,838860800,842137600))</Histogram>
<Selectivity>5.5556%</Selectivity>
</Property>
<Property name="InterpretationCode">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="MethodCode">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="ObservationCode">
<AverageFieldSize>7.75</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," 2710-2"," 3141-9"," 3141-9"," 3141-9"," 39156-5"," 39156-5"," 8302-2"," 8302-2"," 8302-2"," 8462-4"," 8462-4"," 8480-6"," 8480-6"," 8480-6"," 9279-1"),$lb(1,1,8,8,2,9,1,8,8,2,8,3,8,8,1),$lb(536870912,0,842477872,842477872,858862641,0,0,0,0,825504045,959526198,0,0,859386165,942878770,0,0,0,0,858796589,875967021,0,0,909258036,942681398,0,0,0,0,942946352,959592249,540619319))</Histogram>
<Selectivity>7.1429%</Selectivity>
</Property>
<Property name="ObservationCodeSystem">
<AverageFieldSize>21.63</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," 2.16.840.1.113883.6.1"," 2.16.840.1.113883.6.1"," 2.16.840.1.113883.6.1"," 2.16.840.1.113883.6.1"," 2.16.840.1.113883.6.1"," 2.16.840.1.113883.6.1"," 2.16.840.1.113883.6.1"," 2.16.840.1.113883.6.1"," 2.16.840.1.113883.6.1"," 2.16.840.1.113883.6.1"," 2.16.840.1.113883.6.1"," 2.16.840.1.113883.6.1"," 2.16.840.1.113883.6.1"," 2.16.840.1.113883.6.1"," 2.16.840.1.113883.6.1"),$lb(1,23,23,23,23,23,23,23,23,23,23,23,23,23,23),$lb(536870912,0,841888054,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,540159537))</Histogram>
<OutlierSelectivity>.934579:"2.16.840.1.113883.6.1"</OutlierSelectivity>
<Selectivity>6.5421%</Selectivity>
</Property>
<Property name="ObservationDisplayName">
<AverageFieldSize>17.91</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" BMI"," BODY MASS INDEX CALCULATED"," BODY TEMPERATURE"," BP DIASTOLIC"," BP SYSTOLIC"," BP SYSTOLIC"," HEART RATE"," HEIGHT"," HEIGHT"," HEIGHT/LENGTH MEASURED"," INTRAVASCULAR SYSTOLIC"," NO VITAL SIGN DATA IS APPLICABLE"," PATIENT BODY WEIGHT - MEASURED"," SYSTOLIC BLOOD PRESSURE"," WEIGHT"," WEIGHT MEASURED"),$lb(2,6,2,4,13,1,3,8,7,1,1,1,1,1,7),$lb(541216073,1296629760,1329879328,1296126803,1413827920,1329879328,1344291913,1145651539,1398362964,0,0,1112547411,1212498258,1095914528,1229408340,0,0,0,793527630,1212500295,1229870162,1229870162,1313808470,1313808470,1346458697,1346458697,1398362964,1398362964,1464158535,0,541934913,542590281))</Histogram>
<OutlierSelectivity>.17757:"Height"</OutlierSelectivity>
<Selectivity>2.4922%</Selectivity>
</Property>
<Property name="ObservationEffectiveTimeHigh">
<AverageFieldSize>13.79</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" 19991114"," 19991114"," 20000407"," 20000407"," 20110925"," 20111002"," 20120330"," 20120815"," 20121002"," 20130130"," 20130710220000.000-0500"," 20140212130333"," 20141001103026-0500"," 20190911164841-0400"," 202306190000-0600"," 202306190000-0600"),$lb(10,1,10,3,5,4,6,5,4,6,4,5,4,3,19),$lb(540096825,0,0,825833785,842018864,0,0,808464436,825307193,809054773,825241650,825307184,842019635,858992640,942748928,808988981,825241650,842084400,858796339,825438208,925970482,858797873,875573809,808595762,825241649,875638832,959461681,825831481,842215478,0,0,540160050))</Histogram>
<Selectivity>4.3478%</Selectivity>
</Property>
<Property name="ObservationEffectiveTimeLow">
<AverageFieldSize>13.79</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" 19991114"," 19991114"," 20000407"," 20000407"," 20110925"," 20111002"," 20120330"," 20120815"," 20121002"," 20130130"," 20130710220000.000-0500"," 20140212130333"," 20141001103026-0500"," 20190911164841-0400"," 202306190000-0600"," 202306190000-0600"),$lb(10,1,10,3,5,4,6,5,4,6,4,5,4,3,19),$lb(540096825,0,0,825833785,842018864,0,0,808464436,825307193,809054773,825241650,825307184,842019635,858992640,942748928,808988981,825241650,842084400,858796339,825438208,925970482,858797873,875573809,808595762,825241649,875638832,959461681,825831481,842215478,0,0,540160050))</Histogram>
<Selectivity>4.3478%</Selectivity>
</Property>
<Property name="ObservationIDExtension">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="ObservationIDRoot">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="ObservationStatusCode">
<AverageFieldSize>11</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"),$lb(11,11,11,11,11,11,11,11,11,11,11,11,11,11,11),$lb(541282125,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,541282125))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="OrganizerClassCode">
<AverageFieldSize>9</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" CLUSTER"," CLUSTER"," CLUSTER"," CLUSTER"," CLUSTER"," CLUSTER"," CLUSTER"," CLUSTER"," CLUSTER"," CLUSTER"," CLUSTER"," CLUSTER"," CLUSTER"," CLUSTER"," CLUSTER"," CLUSTER"),$lb(9,9,9,9,9,9,9,9,9,9,9,9,9,9,9),$lb(541281365,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,541281365))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="OrganizerCode">
<AverageFieldSize>9.92</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" 46680005"," 46680005"," 46680005"," 46680005"," 46680005"," 46680005"," 46680005"," 46680005"," 46680005"," 46680005"," 46680005"," 46680005"," 46680005"," 46680005"," 74728-7"," 74728-7"),$lb(10,10,10,10,10,10,10,10,10,10,10,10,10,1,9),$lb(540292662,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,875968056,926168882,0,0,540488759))</Histogram>
<OutlierSelectivity>.915888:46680005</OutlierSelectivity>
<Selectivity>8.4112%</Selectivity>
</Property>
<Property name="OrganizerCodeSystem">
<AverageFieldSize>23.92</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" 2.16.840.1.113883.6.1"," 2.16.840.1.113883.6.1"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"),$lb(23,21,24,24,24,24,24,24,24,24,24,24,24,24,24),$lb(540159537,0,0,822083584,959840256,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,540159537))</Histogram>
<OutlierSelectivity>.915888:"2.16.840.1.113883.6.96"</OutlierSelectivity>
<Selectivity>8.4112%</Selectivity>
</Property>
<Property name="OrganizerDisplayName">
<AverageFieldSize>13</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" VITAL SIGNS"," VITAL SIGNS"," VITAL SIGNS"," VITAL SIGNS"," VITAL SIGNS"," VITAL SIGNS"," VITAL SIGNS"," VITAL SIGNS"," VITAL SIGNS"," VITAL SIGNS"," VITAL SIGNS"," VITAL SIGNS"," VITAL SIGNS"," VITAL SIGNS"," VITAL SIGNS"," VITAL SIGNS"),$lb(13,13,13,13,13,13,13,13,13,13,13,13,13,13,13),$lb(542525780,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,542525780))</Histogram>
<OutlierSelectivity>.803738:"Vital signs"</OutlierSelectivity>
<Selectivity>6.5421%</Selectivity>
</Property>
<Property name="OrganizerEffectiveTimeHigh">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="OrganizerEffectiveTimeLow">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="OrganizerMoodCode">
<AverageFieldSize>5</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" EVN"," EVN"," EVN"," EVN"," EVN"," EVN"," EVN"," EVN"," EVN"," EVN"," EVN"," EVN"," EVN"," EVN"," EVN"," EVN"),$lb(5,5,5,5,5,5,5,5,5,5,5,5,5,5,5),$lb(541414990,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,541414990))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="OrganizerStatusCode">
<AverageFieldSize>11</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"),$lb(11,11,11,11,11,11,11,11,11,11,11,11,11,11,11),$lb(541282125,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,541282125))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="ProfileID">
<AverageFieldSize>11</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"),$lb(11,11,11,11,11,11,11,11,11,11,11,11,11,11,11),$lb(542393683,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,542393683))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="TranslationCode">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="TranslationCodeSystem">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="TranslationDisplayName">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="Unit">
<AverageFieldSize>5.99</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," %"," 1"," 1"," CM"," CM"," KG"," KG"," MM[HG]"," MM[HG]"," MM[HG]"," MM[HG]"," MM[HG]"," [IN_US]"," [LB_AV]"," [LB_AV]"),$lb(1,1,3,1,4,1,4,1,8,8,8,8,1,2,9),$lb(536870912,0,620756992,620756992,822083584,0,0,822083584,1129119744,0,0,1129119744,1262944256,0,0,1262944256,1296915272,0,0,0,0,0,0,0,0,1296915272,1531530847,1229872981,1279418177,0,0,542854210))</Histogram>
<OutlierSelectivity>.327103:"mm[Hg]"</OutlierSelectivity>
<Selectivity>5.6075%</Selectivity>
</Property>
<Property name="Value">
<AverageFieldSize>4.87</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," 100"," 120"," 132"," 145"," 160"," 177"," 178"," 2.15"," 25.8"," 37.2"," 68"," 80"," 86"," 88"," 99"),$lb(1,2,2,2,2,2,3,1,2,1,1,1,2,2,1),$lb(536870912,0,825241600,808452096,842006528,842006528,858914816,858914816,875888640,875888640,909115392,909115392,926351360,922746880,939524096,825702400,841888053,774976768,892221440,842346040,859254322,859254322,909639680,909639680,942669824,805306368,905969664,905969664,939524096,943194112,960036864,540621056))</Histogram>
<Selectivity>1.6949%</Selectivity>
</Property>
<Property name="VitalSignID">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="XPath">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="xDate">
<AverageFieldSize>12.19</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," 19991114"," 20000407"," 20000407"," 20110312"," 20111002"," 20120330"," 20120806"," 20121002"," 20130130"," 20130710220000.000-0500"," 20140212130114"," 20141001103026-0500"," 202306190000-0600"," 202306190000-0600"),$lb(2,1,1,10,3,5,4,6,5,4,6,4,5,3,19),$lb(536870912,0,0,0,825833785,825833785,842018864,0,0,808464436,825307187,808661298,825241650,825307184,842019635,858992640,942683648,808988726,825241650,842084400,858796339,825438208,925970482,858797873,875573809,808595762,825241649,825504048,842215478,0,0,540160050))</Histogram>
<Selectivity>4.7619%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-16</BlockCount>
</SQLMap>
<StreamLocation>^LEADNorth.LEADB04.CCDVitalSignS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
