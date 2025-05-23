Class LEADNorth.CDAProfiler.Sections.CCDFamilyHistory Extends %Persistent
{

Property DocumentID As LEADNorth.CDAProfiler.Sections.CCDDocument;

Property RelativePerson As %String(MAXLEN = 255);

Property OnsetAge As %String(MAXLEN = 255);

Property StatusCode As %String(MAXLEN = 100);

Property ObservationCode As %String(MAXLEN = 255);

Property ObservationSystem As %String(MAXLEN = 255);

Property RelativeCode As %String(MAXLEN = 255);

Property RelativeCodeSystem As %String(MAXLEN = 255);

Property ObservationDisplayName As %String(MAXLEN = 255);

Property ObservationID As %String(MAXLEN = 255);

Property ObservationIDOid As %String(MAXLEN = 255);

Property XPath As %String(MAXLEN = 255);

Property ProfileID As %String [ Required ];

Storage Default
{
<Data name="CCDFamilyHistoryDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>DocumentID</Value>
</Value>
<Value name="3">
<Value>RelativePerson</Value>
</Value>
<Value name="4">
<Value>OnsetAge</Value>
</Value>
<Value name="5">
<Value>StatusCode</Value>
</Value>
<Value name="6">
<Value>ObservationCode</Value>
</Value>
<Value name="7">
<Value>ObservationSystem</Value>
</Value>
<Value name="8">
<Value>RelativeCode</Value>
</Value>
<Value name="9">
<Value>RelativeCodeSystem</Value>
</Value>
<Value name="10">
<Value>ObservationDisplayName</Value>
</Value>
<Value name="11">
<Value>ObservationID</Value>
</Value>
<Value name="12">
<Value>ObservationIDOid</Value>
</Value>
<Value name="13">
<Value>XPath</Value>
</Value>
<Value name="14">
<Value>ProfileID</Value>
</Value>
</Data>
<DataLocation>^LEADNorthDB04.CCDFamilyHi189AD</DataLocation>
<DefaultData>CCDFamilyHistoryDefaultData</DefaultData>
<ExtentSize>3</ExtentSize>
<IdLocation>^LEADNorthDB04.CCDFamilyHi189AD</IdLocation>
<IndexLocation>^LEADNorthDB04.CCDFamilyHi189AI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="DocumentID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="ObservationCode">
<AverageFieldSize>10.67</AverageFieldSize>
<Selectivity>33.3333%</Selectivity>
</Property>
<Property name="ObservationDisplayName">
<AverageFieldSize>10.67</AverageFieldSize>
<Selectivity>33.3333%</Selectivity>
</Property>
<Property name="ObservationID">
<AverageFieldSize>7</AverageFieldSize>
<Selectivity>33.3333%</Selectivity>
</Property>
<Property name="ObservationIDOid">
<AverageFieldSize>25</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="ObservationSystem">
<AverageFieldSize>24</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="OnsetAge">
<AverageFieldSize>10</AverageFieldSize>
<Selectivity>33.3333%</Selectivity>
</Property>
<Property name="ProfileID">
<AverageFieldSize>11</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="RelativeCode">
<AverageFieldSize>10.33</AverageFieldSize>
<Selectivity>33.3333%</Selectivity>
</Property>
<Property name="RelativeCodeSystem">
<AverageFieldSize>24</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="RelativePerson">
<AverageFieldSize>8.33</AverageFieldSize>
<Selectivity>33.3333%</Selectivity>
</Property>
<Property name="StatusCode">
<AverageFieldSize>11</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="XPath">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^LEADNorthDB04.CCDFamilyHi189AS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
