Class LEADNorth.CDAProfiler.Sections.CCDAdvanceDirective Extends %Persistent
{

Property AdvanceDirectiveID As %String(MAXLEN = 255);

Property DocumentID As LEADNorth.CDAProfiler.Sections.CCDDocument;

Property DirectiveType As %String(MAXLEN = 255);

Property DateSigned As %String(MAXLEN = 255);

Property StatusCode As %String(MAXLEN = 50);

Property DirectiveID As %String(MAXLEN = 255);

Property ProfileID As %String [ Required ];

Property SDAMapping As %String(MAXLEN = 255);

Property XPath As %String(MAXLEN = 255);

Storage Default
{
<Data name="CCDAdvanceDirectiveDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>AdvanceDirectiveID</Value>
</Value>
<Value name="3">
<Value>DocumentID</Value>
</Value>
<Value name="4">
<Value>DirectiveType</Value>
</Value>
<Value name="5">
<Value>DateSigned</Value>
</Value>
<Value name="6">
<Value>StatusCode</Value>
</Value>
<Value name="7">
<Value>DirectiveID</Value>
</Value>
<Value name="8">
<Value>ProfileID</Value>
</Value>
<Value name="9">
<Value>SDAMapping</Value>
</Value>
<Value name="10">
<Value>XPath</Value>
</Value>
</Data>
<DataLocation>^LEADNorthDB04.CCDAdvanceD725BD</DataLocation>
<DefaultData>CCDAdvanceDirectiveDefaultData</DefaultData>
<ExtentSize>2</ExtentSize>
<IdLocation>^LEADNorthDB04.CCDAdvanceD725BD</IdLocation>
<IndexLocation>^LEADNorthDB04.CCDAdvanceD725BI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="AdvanceDirectiveID">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="DateSigned">
<AverageFieldSize>10</AverageFieldSize>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="DirectiveID">
<AverageFieldSize>7</AverageFieldSize>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="DirectiveType">
<AverageFieldSize>16.5</AverageFieldSize>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="DocumentID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="ProfileID">
<AverageFieldSize>11</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="SDAMapping">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="StatusCode">
<AverageFieldSize>9.5</AverageFieldSize>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="XPath">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^LEADNorthDB04.CCDAdvanceD725BS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
