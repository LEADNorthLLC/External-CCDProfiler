Class LEADNorth.CDAProfiler.Sections.CCDAllergy Extends %Persistent
{

Property AllergyID As %String;

Property DocumentID As LEADNorth.CDAProfiler.Sections.CCDDocument [ Required ];

Property AllergyCode As %String(MAXLEN = 255);

Property AllergyCodeSystem As %String(MAXLEN = 255);

Property AllergyCodeSystemName As %String(MAXLEN = 255);

Property AllergyDisplayName As %String(MAXLEN = 255);

Property CategoryCode As %String(MAXLEN = 255);

Property CategoryCodeSystem As %String(MAXLEN = 255);

Property CategoryCodeSystemName As %String(MAXLEN = 255);

Property CategoryDisplayName As %String(MAXLEN = 255);

Property ReactionCode As %String(MAXLEN = 255);

Property ReactionCodeSystem As %String(MAXLEN = 255);

Property ReactionCodeSystemName As %String(MAXLEN = 255);

Property ReactionDisplayName As %String(MAXLEN = 255);

Property SeverityCode As %String(MAXLEN = 50);

Property SeverityCodeSystem As %String(MAXLEN = 50);

Property SeverityCodeName As %String(MAXLEN = 50);

Property SeverityDisplayName As %String(MAXLEN = 50);

Property Provider As %String(MAXLEN = 255);

Property ActIdExtension As %String(MAXLEN = 255);

Property ActIdRoot As %String(MAXLEN = 255);

Property ActClassCode As %String(MAXLEN = 20);

Property ActMoodCode As %String(MAXLEN = 20);

Property ActStatusCode As %String(MAXLEN = 20);

Property EffectiveTimeLow As %String;

Property EffectiveTimeHigh As %String;

Property ObservationCode As %String(MAXLEN = 20);

Property ObservationCodeSystem As %String(MAXLEN = 255);

Property ObservationDisplayName As %String(MAXLEN = 255);

Property ObservationStatusCode As %String(MAXLEN = 20);

Property ObservationEffectiveTimeLow As %String;

Property ObservationEffectiveTimeHigh As %String;

Property StatusCode As %String(MAXLEN = 20);

Property StatusCodeSystem As %String(MAXLEN = 255);

Property StatusCodeSystemName As %String(MAXLEN = 255);

Property StatusDisplayName As %String(MAXLEN = 255);

Property ReferenceAllergyId As %String(MAXLEN = 255);

Property ReferenceReactionId As %String(MAXLEN = 255);

Property ReferenceSeverityId As %String(MAXLEN = 255);

Property ReferenceStatusId As %String(MAXLEN = 255);

Property RepresentedOrganization As %String(MAXLEN = 255);

Property ProfileID As %String [ Required ];

Property XPath As %String(MAXLEN = 255);

Storage Default
{
<Data name="CCDAllergyDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>AllergyID</Value>
</Value>
<Value name="3">
<Value>DocumentID</Value>
</Value>
<Value name="4">
<Value>AllergyCode</Value>
</Value>
<Value name="5">
<Value>AllergyCodeSystem</Value>
</Value>
<Value name="6">
<Value>AllergyCodeSystemName</Value>
</Value>
<Value name="7">
<Value>AllergyDisplayName</Value>
</Value>
<Value name="8">
<Value>CategoryCode</Value>
</Value>
<Value name="9">
<Value>CategoryCodeSystem</Value>
</Value>
<Value name="10">
<Value>CategoryCodeSystemName</Value>
</Value>
<Value name="11">
<Value>CategoryDisplayName</Value>
</Value>
<Value name="12">
<Value>ReactionCode</Value>
</Value>
<Value name="13">
<Value>ReactionCodeSystem</Value>
</Value>
<Value name="14">
<Value>ReactionCodeSystemName</Value>
</Value>
<Value name="15">
<Value>ReactionDisplayName</Value>
</Value>
<Value name="16">
<Value>SeverityCode</Value>
</Value>
<Value name="17">
<Value>SeverityCodeSystem</Value>
</Value>
<Value name="18">
<Value>SeverityCodeName</Value>
</Value>
<Value name="19">
<Value>SeverityDisplayName</Value>
</Value>
<Value name="20">
<Value>Provider</Value>
</Value>
<Value name="21">
<Value>ActIdExtension</Value>
</Value>
<Value name="22">
<Value>ActIdRoot</Value>
</Value>
<Value name="23">
<Value>ActClassCode</Value>
</Value>
<Value name="24">
<Value>ActMoodCode</Value>
</Value>
<Value name="25">
<Value>ActStatusCode</Value>
</Value>
<Value name="26">
<Value>EffectiveTimeLow</Value>
</Value>
<Value name="27">
<Value>EffectiveTimeHigh</Value>
</Value>
<Value name="28">
<Value>ObservationCode</Value>
</Value>
<Value name="29">
<Value>ObservationCodeSystem</Value>
</Value>
<Value name="30">
<Value>ObservationDisplayName</Value>
</Value>
<Value name="31">
<Value>ObservationStatusCode</Value>
</Value>
<Value name="32">
<Value>ObservationEffectiveTimeLow</Value>
</Value>
<Value name="33">
<Value>ObservationEffectiveTimeHigh</Value>
</Value>
<Value name="34">
<Value>StatusCode</Value>
</Value>
<Value name="35">
<Value>StatusCodeSystem</Value>
</Value>
<Value name="36">
<Value>StatusCodeSystemName</Value>
</Value>
<Value name="37">
<Value>StatusDisplayName</Value>
</Value>
<Value name="38">
<Value>ReferenceAllergyId</Value>
</Value>
<Value name="39">
<Value>ReferenceReactionId</Value>
</Value>
<Value name="40">
<Value>ReferenceSeverityId</Value>
</Value>
<Value name="41">
<Value>ReferenceStatusId</Value>
</Value>
<Value name="42">
<Value>RepresentedOrganization</Value>
</Value>
<Value name="43">
<Value>ProfileID</Value>
</Value>
<Value name="44">
<Value>XPath</Value>
</Value>
</Data>
<DataLocation>^LEADNorth.LEADNDB04.CCDAllergyD</DataLocation>
<DefaultData>CCDAllergyDefaultData</DefaultData>
<ExtentSize>38</ExtentSize>
<IdLocation>^LEADNorth.LEADNDB04.CCDAllergyD</IdLocation>
<IndexLocation>^LEADNorth.LEADNDB04.CCDAllergyI</IndexLocation>
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
<Property name="ActClassCode">
<AverageFieldSize>5</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" ACT"," ACT"," ACT"," ACT"," ACT"," ACT"," ACT"," ACT"," ACT"," ACT"," ACT"," ACT"," ACT"," ACT"," ACT"," ACT"),$lb(5,5,5,5,5,5,5,5,5,5,5,5,5,5,5),$lb(541147988,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,541147988))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="ActIdExtension">
<AverageFieldSize>6.92</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," 1"," 1"," 1792940973199390.1"," 613618700107"," 613618700107"," 6136187001071"," 624373800001"," 624373800001"," 624373800001"),$lb(2,2,2,2,2,2,1,3,2,1,14,13,2,14,14),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,822083584,0,0,0,926495289,825702706,909194038,0,0,0,822083584,825439793,842281783,0,0,0,0,540422708))</Histogram>
<OutlierSelectivity>.5:</OutlierSelectivity>
<Selectivity>8.3333%</Selectivity>
</Property>
<Property name="ActIdRoot">
<AverageFieldSize>33.76</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," 1.2.840.113619.21.1.4778906300703140889.3.1"," 1.3.6.1.4.1.16517"," 1.3.6.1.4.1.22812.11.99930.3.4.10"," 1.3.6.1.4.1.22812.11.99930.3.4.10"," 1.3.6.1.4.1.22812.3.99930.3.4.10"," 1.3.6.1.4.1.22812.3.99930.3.4.10"," 36E3E930-7B14-11DB-9FE1-0800200C9A66"," 36E3E930-7B14-11DB-9FE1-0800200C9A66"," 36E3E930-7B14-11DB-9FE1-0800200C9A66"," 36E3E930-7B14-11DB-9FE1-0800200C9A66"," 36E3E930-7B14-11DB-9FE1-0800200C9A66"," 36E3E930-7B14-11DB-9FE1-0800200C9A66"," 36E3E930-7B14-11DB-9FE1-0800200C9A66"," 36E3E930-7B14-11DB-9FE1-0800200C9A66"," 8726AA93-451C-4596-A709-99C806E9D08B"),$lb(1,3,13,35,19,34,1,38,38,38,38,38,38,38,1),$lb(536870912,0,825111086,841889844,858666542,825636145,842151985,0,0,825306681,858667321,0,0,825111342,859194675,0,0,0,0,0,0,0,0,0,0,0,0,0,0,859194675,943141430,540555058))</Histogram>
<OutlierSelectivity>.421053:"36e3e930-7b14-11db-9fe1-0800200c9a66"</OutlierSelectivity>
<Selectivity>8.2707%</Selectivity>
</Property>
<Property name="ActMoodCode">
<AverageFieldSize>5</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" EVN"," EVN"," EVN"," EVN"," EVN"," EVN"," EVN"," EVN"," EVN"," EVN"," EVN"," EVN"," EVN"," EVN"," EVN"," EVN"),$lb(5,5,5,5,5,5,5,5,5,5,5,5,5,5,5),$lb(541414990,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,541414990))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="ActStatusCode">
<AverageFieldSize>9.03</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" ACTIVE"," ACTIVE"," ACTIVE"," ACTIVE"," ACTIVE"," ACTIVE"," ACTIVE"," ACTIVE"," ACTIVE"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"),$lb(8,8,8,8,8,8,8,8,1,11,11,11,11,11,11),$lb(541147988,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1094931529,1129270608,0,0,0,0,0,0,0,0,0,0,0,0,541282125))</Histogram>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="AllergyCode">
<AverageFieldSize>5.03</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," 1191"," 1191"," 1191"," 2670"," 2670"," 2670"," 314422"," 314422"," 7980"," 7982"," 7982"),$lb(2,2,2,2,1,6,6,1,6,6,1,8,1,4,6),$lb(536870912,0,0,0,0,0,0,0,0,0,825309489,0,0,0,0,825309489,842413872,0,0,0,0,842413872,858862644,0,0,858862644,926496816,805306368,838860800,0,0,540490040))</Histogram>
<Selectivity>14.2857%</Selectivity>
</Property>
<Property name="AllergyCodeSystem">
<AverageFieldSize>17.63</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," 2.16.840.1.113883.6.88"," 2.16.840.1.113883.6.88"," 2.16.840.1.113883.6.88"," 2.16.840.1.113883.6.88"," 2.16.840.1.113883.6.88"," 2.16.840.1.113883.6.88"," 2.16.840.1.113883.6.88"," 2.16.840.1.113883.6.88"," 2.16.840.1.113883.6.88"," 2.16.840.1.113883.6.88"," 2.16.840.1.113883.6.88"," 2.16.840.1.113883.6.96"),$lb(2,2,2,1,24,24,24,24,24,24,24,24,24,24,21),$lb(536870912,0,0,0,0,0,0,0,841888054,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,943194112,959840256,540159537))</Histogram>
<Selectivity>33.3333%</Selectivity>
</Property>
<Property name="AllergyCodeSystemName">
<AverageFieldSize>6.34</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," RXNORM"," RXNORM"," RXNORM"," RXNORM"," RXNORM"," RXNORM"," RXNORM"," RXNORM"," RXNORM"," RXNORM"," RXNORM"," SNOMED CT"),$lb(2,2,2,1,8,8,8,8,8,8,8,8,8,8,1),$lb(536870912,0,0,0,0,0,0,0,1381518927,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1381518927,1397641037,542330447))</Histogram>
<Selectivity>33.3333%</Selectivity>
</Property>
<Property name="AllergyDisplayName">
<AverageFieldSize>11.5</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," ALLERGENIC EXTRACT, PENICILLIN"," ALLERGENIC EXTRACT, PENICILLIN"," ASPIRIN"," ASPIRIN"," ASPIRIN"," CODEINE"," CODEINE"," CODEINE"," PENICILLIN G BENZATHINE"," PENICILLIN G BENZATHINE"," SUBSTANCE"),$lb(2,2,2,2,1,32,2,9,9,1,9,9,1,25,1),$lb(536870912,0,0,0,0,0,0,0,0,0,1095519301,0,0,1280066898,1397770578,0,0,0,0,1095979081,1129268293,0,0,0,0,1129268293,1346719305,0,0,1346719305,1398096467,542332226))</Histogram>
<Selectivity>12.5000%</Selectivity>
</Property>
<Property name="AllergyID">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="CategoryCode">
<AverageFieldSize>11</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" 282100009"," 282100009"," 282100009"," 282100009"," 282100009"," 282100009"," 416098002"," 416098002"," 416098002"," 416098002"," 416098002"," 416098002"," 416098002"," 419199007"," 419199007"," 419199007"),$lb(11,11,11,11,11,1,11,11,11,11,11,11,3,11,11),$lb(540162098,0,0,0,0,0,0,0,0,0,0,842543665,875640368,0,0,0,0,0,0,0,0,0,0,0,0,909130040,959527225,0,0,0,0,540291385))</Histogram>
<Selectivity>33.3333%</Selectivity>
</Property>
<Property name="CategoryCodeSystem">
<AverageFieldSize>24</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"),$lb(24,24,24,24,24,24,24,24,24,24,24,24,24,24,24),$lb(540159537,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,540159537))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="CategoryCodeSystemName">
<AverageFieldSize>9.82</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," SNOMED CT"," SNOMED CT"," SNOMED CT"," SNOMED CT"," SNOMED CT"," SNOMED CT"," SNOMED CT"," SNOMED CT"," SNOMED CT"," SNOMED CT"," SNOMED CT"," SNOMED CT"," SNOMED CT"," SNOMED CT"),$lb(2,1,11,11,11,11,11,11,11,11,11,11,11,11,11),$lb(536870912,0,0,0,1397641037,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,542330447))</Histogram>
<OutlierSelectivity>.868421:"SNOMED CT"</OutlierSelectivity>
<Selectivity>13.1579%</Selectivity>
</Property>
<Property name="CategoryDisplayName">
<AverageFieldSize>19.63</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," ADVERSE REACTION TO SUBSTANCE"," ADVERSE REACTION TO SUBSTANCE"," ADVERSE REACTION TO SUBSTANCE"," ADVERSE REACTION TO SUBSTANCE"," ADVERSE REACTION TO SUBSTANCE"," ALLERGY TO SUBSTANCE (DISORDER)"," DRUG ALLERGY"," DRUG ALLERGY"," DRUG ALLERGY"," DRUG ALLERGY"," DRUG ALLERGY"," DRUG ALLERGY"," DRUG ALLERGY"," DRUG ALLERGY"),$lb(2,1,31,31,31,31,2,1,14,14,14,14,14,14,14),$lb(536870912,0,0,0,1094997573,0,0,0,0,0,0,0,0,1146504530,1280066898,1095519301,1146246471,0,0,0,0,0,0,0,0,0,0,0,0,0,0,541348437))</Histogram>
<Selectivity>16.6667%</Selectivity>
</Property>
<Property name="DocumentID">
<AverageFieldSize>3.53</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb("1","2","3","4","5","7","8","10","11","13","15","17","20","21","21","22"),$lb(0,0,0,0,0,0,0,1,1,1,1,0,1,2,1),$lb(822083584,822083584,838860800,838860800,855638016,855638016,872415232,872415232,889192448,889192448,922746880,922746880,939524096,939524096,825229312,805306368,822083584,822083584,855638016,855638016,889192448,889192448,922746880,825688064,842006528,805306368,822083584,0,0,822083584,838860800,842137600))</Histogram>
<Selectivity>5.2632%</Selectivity>
</Property>
<Property name="EffectiveTimeHigh">
<AverageFieldSize>5.16</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," 20100103"," 20100103"," 20100103"," 20100103"," 20100103"," 20100103"," 20100103"," 20100103"),$lb(2,2,2,2,2,2,2,1,10,10,10,10,10,10,10),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,842019120,0,0,0,0,0,0,0,0,0,0,0,0,0,0,540160049))</Histogram>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="EffectiveTimeLow">
<AverageFieldSize>11.82</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," 19980110"," 20010110000000"," 20090902"," 20090902"," 20090902"," 20090902"," 20090902"," 20110110"," 20120806"," 20121002100051"," 20140212130251"," 20140212130357"," 20141003103026-0500"," 20161024000000-0400"),$lb(2,1,1,4,10,10,10,10,3,4,5,4,12,5,4),$lb(536870912,0,0,0,825833784,825833784,842018865,825241905,959461680,0,0,0,0,0,0,0,0,809054265,825307185,825241905,842020912,808988726,825241650,842084400,875573809,842346752,859125504,808595762,825241651,875638832,909193266,540160049))</Histogram>
<OutlierSelectivity>.394737:20090902</OutlierSelectivity>
<Selectivity>4.3233%</Selectivity>
</Property>
<Property name="ObservationCode">
<AverageFieldSize>11</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" 416098002"," 416098002"," 416098002"," 416098002"," 416098002"," 416098002"," ASSERTION"," ASSERTION"," ASSERTION"," ASSERTION"," ASSERTION"," ASSERTION"," ASSERTION"," ASSERTION"," ASSERTION"," ASSERTION"),$lb(11,11,11,11,11,1,11,11,11,11,11,11,11,11,11),$lb(540291382,0,0,0,0,0,0,0,0,0,0,875640368,1095979845,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,541152083))</Histogram>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="ObservationCodeSystem">
<AverageFieldSize>23.39</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" 2.16.840.1.113883.5.4"," 2.16.840.1.113883.5.4"," 2.16.840.1.113883.5.4"," 2.16.840.1.113883.5.4"," 2.16.840.1.113883.5.4"," 2.16.840.1.113883.5.4"," 2.16.840.1.113883.5.4"," 2.16.840.1.113883.5.4"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"),$lb(23,23,23,23,23,23,23,19,24,24,24,24,24,24,24),$lb(540159537,0,0,0,0,0,0,0,0,0,0,0,0,0,0,892220416,908998966,0,0,0,0,0,0,0,0,0,0,0,0,0,0,540159537))</Histogram>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="ObservationDisplayName">
<AverageFieldSize>7.21</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," DRUG ALLERGY"," DRUG ALLERGY"," DRUG ALLERGY"," DRUG ALLERGY"," DRUG ALLERGY"," DRUG ALLERGY"," DRUG ALLERGY"," DRUG ALLERGY"),$lb(2,2,2,2,2,2,2,1,14,14,14,14,14,14,14),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1146246471,0,0,0,0,0,0,0,0,0,0,0,0,0,0,541348437))</Histogram>
<Selectivity>33.3333%</Selectivity>
</Property>
<Property name="ObservationEffectiveTimeHigh">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="ObservationEffectiveTimeLow">
<AverageFieldSize>11.32</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," 19980110"," 20010110000000"," 20110110"," 20110215"," 20110215"," 20110215"," 20110215"," 20110215"," 20110215"," 20120806100051"," 20140212130114"," 20140212130333"," 20140212130431"," 20161024000000-0400"),$lb(2,1,1,3,6,10,10,10,10,10,4,4,12,12,4),$lb(536870912,0,0,0,825833784,825833784,842018865,808529969,825307185,825307136,842085632,0,0,0,0,0,0,0,0,0,0,825242161,842020912,842020912,875573809,825308160,858993408,858993408,875770112,875573809,909193266,540160049))</Histogram>
<OutlierSelectivity>.394737:20110215</OutlierSelectivity>
<Selectivity>4.6559%</Selectivity>
</Property>
<Property name="ObservationStatusCode">
<AverageFieldSize>11</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"),$lb(11,11,11,11,11,11,11,11,11,11,11,11,11,11,11),$lb(541282125,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,541282125))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="ProfileID">
<AverageFieldSize>11</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"),$lb(11,11,11,11,11,11,11,11,11,11,11,11,11,11,11),$lb(542393683,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,542393683))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="Provider">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="ReactionCode">
<AverageFieldSize>4.84</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," ASSERTION"," ASSERTION"," ASSERTION"," ASSERTION"," ASSERTION"," ASSERTION"),$lb(2,2,2,2,2,2,2,2,2,1,11,11,11,11,11),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1095979845,0,0,0,0,0,0,0,0,0,0,541152083))</Histogram>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="ReactionCodeSystem">
<AverageFieldSize>8.63</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," 2.16.840.1.113883.5.4"," 2.16.840.1.113883.5.4"," 2.16.840.1.113883.5.4"," 2.16.840.1.113883.5.4"," 2.16.840.1.113883.5.4"," 2.16.840.1.113883.5.4"),$lb(2,2,2,2,2,2,2,2,2,1,23,23,23,23,23),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,841888054,0,0,0,0,0,0,0,0,0,0,540159537))</Histogram>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="ReactionCodeSystemName">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="ReactionDisplayName">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="ReferenceAllergyId">
<AverageFieldSize>2.47</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," #ALLERGY2"),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,1),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,591481932,539181388))</Histogram>
<OutlierSelectivity>.947368:</OutlierSelectivity>
<Selectivity>2.6316%</Selectivity>
</Property>
<Property name="ReferenceReactionId">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="ReferenceSeverityId">
<AverageFieldSize>11.42</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," #ID0EBAAARACA"," #ID0EBAABNACA"," #ID0EBACBLACA"," #ID0EBACCMACA"," #REACTION1"," #REACTION1"," #REACTION2"," #REACTION2"," #REACTION2"," #REACTION3"," #REACTION3"," #REACTION3"," #REACTION4166639"),$lb(2,2,1,9,8,9,2,12,10,12,12,10,12,12,10),$lb(536870912,0,0,0,0,0,592004144,1095909699,1112424771,1094864449,1128418369,1112293699,1129136451,1229205573,1380270403,0,0,822083584,838860800,0,0,0,0,838860800,855638016,0,0,0,0,855638016,875640374,539185733))</Histogram>
<Selectivity>5.0000%</Selectivity>
</Property>
<Property name="ReferenceStatusId">
<AverageFieldSize>10.53</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"),$lb(1,11,11,11,11,11,11,11,11,11,11,11,11,11,11),$lb(536870912,0,1129270608,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,541282125))</Histogram>
<OutlierSelectivity>.947368:"completed"</OutlierSelectivity>
<Selectivity>5.2632%</Selectivity>
</Property>
<Property name="RepresentedOrganization">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="SeverityCode">
<AverageFieldSize>6.39</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," 371924009"," 371924009"," 371924009"," 371924009"," 371924009"," 371924009"," 371924009"," 399166001"," 6736007"),$lb(2,2,2,2,2,2,1,11,11,11,11,11,11,2,1),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,859255097,0,0,0,0,0,0,0,0,0,0,0,0,925972786,960049462,859388209,909587254,540423987))</Histogram>
<Selectivity>25.0000%</Selectivity>
</Property>
<Property name="SeverityCodeName">
<AverageFieldSize>6.5</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," SNOMED CT"," SNOMED CT"," SNOMED CT"," SNOMED CT"," SNOMED CT"," SNOMED CT"," SNOMED CT"," SNOMED CT"," SNOMED CT"),$lb(2,2,2,2,2,2,1,11,11,11,11,11,11,11,11),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,1397641037,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,542330447))</Histogram>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="SeverityCodeSystem">
<AverageFieldSize>13</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"),$lb(2,2,2,2,2,2,1,24,24,24,24,24,24,24,24),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,841888054,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,540159537))</Histogram>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="SeverityDisplayName">
<AverageFieldSize>9.53</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," MODERATE TO SEVERE"," MODERATE TO SEVERE"," MODERATE TO SEVERE"," MODERATE TO SEVERE"," MODERATE TO SEVERE"," MODERATE TO SEVERE"," MODERATE TO SEVERE"," MODERATE TO SEVERE"),$lb(2,2,2,2,2,2,2,1,20,20,20,20,20,20,20),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1297040453,0,0,0,0,0,0,0,0,0,0,0,0,0,0,541937476))</Histogram>
<Selectivity>33.3333%</Selectivity>
</Property>
<Property name="StatusCode">
<AverageFieldSize>9.03</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" ACTIVE"," ACTIVE"," ACTIVE"," ACTIVE"," ACTIVE"," ACTIVE"," ACTIVE"," ACTIVE"," ACTIVE"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"),$lb(8,8,8,8,8,8,8,8,1,11,11,11,11,11,11),$lb(541147988,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1094931529,1129270608,0,0,0,0,0,0,0,0,0,0,0,0,541282125))</Histogram>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="StatusCodeSystem">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="StatusCodeSystemName">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="StatusDisplayName">
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
<BlockCount>-8</BlockCount>
</SQLMap>
<StreamLocation>^LEADNorth.LEADNDB04.CCDAllergyS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
