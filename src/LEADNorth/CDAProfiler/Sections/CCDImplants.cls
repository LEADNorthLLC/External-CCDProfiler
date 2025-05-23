Class LEADNorth.CDAProfiler.Sections.CCDImplants Extends %Persistent
{

Property ImplantID As %String(MAXLEN = 255);

Property DocumentID As LEADNorth.CDAProfiler.Sections.CCDDocument [ Required ];

Property DeviceName As %String(MAXLEN = 255);

Property DeviceCode As %String(MAXLEN = 255);

Property DeviceCodeSystem As %String(MAXLEN = 255);

Property DeviceCodeSystemName As %String(MAXLEN = 255);

Property ManufacturerModelName As %String(MAXLEN = 255);

Property SerialNumber As %String(MAXLEN = 255);

Property ImplantStatus As %String(MAXLEN = 255);

Property ImplantDate As %String(MAXLEN = 255);

Property RemovalDate As %String(MAXLEN = 255);

Property AuthorTime As %String(MAXLEN = 255);

Property ProfileID As %String [ Required ];

Property XPath As %String(MAXLEN = 255);

Storage Default
{
<Data name="CCDImplantsDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>ImplantID</Value>
</Value>
<Value name="3">
<Value>DocumentID</Value>
</Value>
<Value name="4">
<Value>DeviceName</Value>
</Value>
<Value name="5">
<Value>DeviceCode</Value>
</Value>
<Value name="6">
<Value>DeviceCodeSystem</Value>
</Value>
<Value name="7">
<Value>DeviceCodeSystemName</Value>
</Value>
<Value name="8">
<Value>ManufacturerModelName</Value>
</Value>
<Value name="9">
<Value>SerialNumber</Value>
</Value>
<Value name="10">
<Value>ImplantStatus</Value>
</Value>
<Value name="11">
<Value>ImplantDate</Value>
</Value>
<Value name="12">
<Value>RemovalDate</Value>
</Value>
<Value name="13">
<Value>AuthorTime</Value>
</Value>
<Value name="14">
<Value>ProfileID</Value>
</Value>
<Value name="15">
<Value>XPath</Value>
</Value>
</Data>
<DataLocation>^LEADNorth.LEADDB04.CCDImplantsD</DataLocation>
<DefaultData>CCDImplantsDefaultData</DefaultData>
<ExtentSize>4</ExtentSize>
<IdLocation>^LEADNorth.LEADDB04.CCDImplantsD</IdLocation>
<IndexLocation>^LEADNorth.LEADDB04.CCDImplantsI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="AuthorTime">
<AverageFieldSize>21</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="DeviceCode">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="DeviceCodeSystem">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="DeviceCodeSystemName">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="DeviceName">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="DocumentID">
<AverageFieldSize>4</AverageFieldSize>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="ImplantDate">
<AverageFieldSize>10</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="ImplantID">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="ImplantStatus">
<AverageFieldSize>11</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="ManufacturerModelName">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="ProfileID">
<AverageFieldSize>13.5</AverageFieldSize>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="RemovalDate">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="SerialNumber">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="XPath">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^LEADNorth.LEADDB04.CCDImplantsS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
