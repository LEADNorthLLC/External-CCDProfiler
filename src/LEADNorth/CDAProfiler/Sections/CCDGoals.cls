Class LEADNorth.CDAProfiler.Sections.CCDGoals Extends %Persistent
{

Property GoalID As %String(MAXLEN = 255);

Property DocumentID As LEADNorth.CDAProfiler.Sections.CCDDocument [ Required ];

Property GoalDescription As %String(MAXLEN = 255);

Property GoalCode As %String(MAXLEN = 255);

Property GoalCodeSystem As %String(MAXLEN = 255);

Property GoalCodeSystemName As %String(MAXLEN = 255);

Property GoalStatus As %String(MAXLEN = 255);

Property StartDate As %String(MAXLEN = 255);

Property EndDate As %String(MAXLEN = 255);

Property AuthorTime As %String(MAXLEN = 255);

Property AuthorName As %String(MAXLEN = 255);

Property ProfileID As %String [ Required ];

Property XPath As %String(MAXLEN = 255);

Property SDAMapping As %String(MAXLEN = 255);

Storage Default
{
<Data name="CCDGoalsDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>GoalID</Value>
</Value>
<Value name="3">
<Value>DocumentID</Value>
</Value>
<Value name="4">
<Value>GoalDescription</Value>
</Value>
<Value name="5">
<Value>GoalCode</Value>
</Value>
<Value name="6">
<Value>GoalCodeSystem</Value>
</Value>
<Value name="7">
<Value>GoalCodeSystemName</Value>
</Value>
<Value name="8">
<Value>GoalStatus</Value>
</Value>
<Value name="9">
<Value>StartDate</Value>
</Value>
<Value name="10">
<Value>EndDate</Value>
</Value>
<Value name="11">
<Value>AuthorTime</Value>
</Value>
<Value name="12">
<Value>AuthorName</Value>
</Value>
<Value name="13">
<Value>ProfileID</Value>
</Value>
<Value name="14">
<Value>XPath</Value>
</Value>
<Value name="15">
<Value>SDAMapping</Value>
</Value>
</Data>
<DataLocation>^LEADNorth.LEADNorDB04.CCDGoalsD</DataLocation>
<DefaultData>CCDGoalsDefaultData</DefaultData>
<IdLocation>^LEADNorth.LEADNorDB04.CCDGoalsD</IdLocation>
<IndexLocation>^LEADNorth.LEADNorDB04.CCDGoalsI</IndexLocation>
<StreamLocation>^LEADNorth.LEADNorDB04.CCDGoalsS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
