Class LEADNorth.CDAProfiler.Sections.CCDFunctionalStatus Extends %Persistent
{

Property FunctionalStatusID As %String(MAXLEN = 255);

Property DocumentID As LEADNorth.CDAProfiler.Sections.CCDDocument;

Property Status As %String(MAXLEN = 255);

Property xDate As %String(MAXLEN = 255);

Property Description As %String(MAXLEN = 255);

Property StatusCode As %String(MAXLEN = 100);

Property ObservationCode As %String(MAXLEN = 255);

Property ObservationSystem As %String(MAXLEN = 255);

Property EffectiveTime As %String(MAXLEN = 255);

Property ProfileID As %String [ Required ];

Property XPath As %String(MAXLEN = 255);

Storage Default
{
<Data name="CCDFunctionalStatusDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>FunctionalStatusID</Value>
</Value>
<Value name="3">
<Value>DocumentID</Value>
</Value>
<Value name="4">
<Value>Status</Value>
</Value>
<Value name="5">
<Value>xDate</Value>
</Value>
<Value name="6">
<Value>Description</Value>
</Value>
<Value name="7">
<Value>StatusCode</Value>
</Value>
<Value name="8">
<Value>ObservationCode</Value>
</Value>
<Value name="9">
<Value>ObservationSystem</Value>
</Value>
<Value name="10">
<Value>EffectiveTime</Value>
</Value>
<Value name="11">
<Value>ProfileID</Value>
</Value>
<Value name="12">
<Value>XPath</Value>
</Value>
</Data>
<DataLocation>^LEADNorthDB04.CCDFunction6E73D</DataLocation>
<DefaultData>CCDFunctionalStatusDefaultData</DefaultData>
<ExtentSize>22</ExtentSize>
<IdLocation>^LEADNorthDB04.CCDFunction6E73D</IdLocation>
<IndexLocation>^LEADNorthDB04.CCDFunction6E73I</IndexLocation>
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
<Property name="Description">
<AverageFieldSize>14.36</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," COGNITIVE FUNCTION FINDING"," COGNITIVE FUNCTION FINDING"," COGNITIVE FUNCTION FINDING"," COGNITIVE FUNCTION FINDING"," COGNITIVE FUNCTION FINDING"," COGNITIVE FUNCTION FINDING"," COGNITIVE FUNCTION FINDING"," COGNITIVE FUNCTION FINDING"," DEPENDENT"," HGB"),$lb(2,2,2,2,2,1,28,28,28,28,28,28,28,1,1),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,1129269070,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1129269070,1145393221,1145393221,1212629504,541607746))</Histogram>
<Selectivity>25.0000%</Selectivity>
</Property>
<Property name="DocumentID">
<AverageFieldSize>3.59</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb("1","2","4","6","8","10","12","14","15","16","17","18","19","20","21","22"),$lb(0,0,0,0,0,1,1,1,1,1,1,1,0,1,1),$lb(822083584,822083584,838860800,838860800,872415232,872415232,905969664,905969664,939524096,939524096,825229312,805306368,838860800,838860800,872415232,872415232,889192448,889192448,905969664,905969664,922746880,922746880,939524096,939524096,956301312,825819136,842006528,805306368,822083584,822083584,838860800,842137600))</Histogram>
<Selectivity>4.5455%</Selectivity>
</Property>
<Property name="EffectiveTime">
<AverageFieldSize>2.91</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," 200003231430"," 20230815"),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,1,3),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,842018864,808464435,842215480,540160050))</Histogram>
<OutlierSelectivity>.909091:</OutlierSelectivity>
<Selectivity>4.5455%</Selectivity>
</Property>
<Property name="FunctionalStatusID">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="ObservationCode">
<AverageFieldSize>6.82</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," 373930000"," 373930000"," 373930000"," 373930000"," 373930000"," 373930000"," 373930000"," 373930000"," 373930000"," 410519009"),$lb(2,2,2,2,2,1,11,11,11,11,11,11,11,11,1),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,859255609,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,859255609,875638837,540291376))</Histogram>
<Selectivity>25.0000%</Selectivity>
</Property>
<Property name="ObservationSystem">
<AverageFieldSize>13.95</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"),$lb(2,2,2,2,2,1,24,24,24,24,24,24,24,24,24),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,841888054,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,540159537))</Histogram>
<Selectivity>33.3333%</Selectivity>
</Property>
<Property name="ProfileID">
<AverageFieldSize>11</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"),$lb(11,11,11,11,11,11,11,11,11,11,11,11,11,11,11),$lb(542393683,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,542393683))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="Status">
<AverageFieldSize>2.55</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," 1"," 1"," 1"," 1"," 1"," 1"," 1"," 1"," 1"," 1"),$lb(2,2,2,2,2,1,3,3,3,3,3,3,3,3,3),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,822083584,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,540082176))</Histogram>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="StatusCode">
<AverageFieldSize>6.91</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"),$lb(2,2,2,2,2,1,11,11,11,11,11,11,11,11,11),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,1129270608,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,541282125))</Histogram>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="XPath">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="xDate">
<AverageFieldSize>2.91</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," 200003231430"," 20230815"),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,1,3),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,842018864,808464435,842215480,540160050))</Histogram>
<OutlierSelectivity>.909091:</OutlierSelectivity>
<Selectivity>4.5455%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^LEADNorthDB04.CCDFunction6E73S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
