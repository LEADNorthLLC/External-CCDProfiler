Class LEADNorth.CDAProfiler.Sections.CCDPayer Extends %Persistent
{

Property PayerID As %String(MAXLEN = 255);

Property DocumentID As LEADNorth.CDAProfiler.Sections.CCDDocument [ Required ];

Property PayerName As %String(MAXLEN = 255);

Property PolicyNumber As %String(MAXLEN = 255);

Property CoveredParty As %String(MAXLEN = 255);

Property PayerCode As %String(MAXLEN = 255);

Property PayerCodeSystem As %String(MAXLEN = 255);

Property PayerCodeSystemName As %String(MAXLEN = 255);

Property PayerStatusCode As %String(MAXLEN = 255);

Property EffectiveTimeLow As %String(MAXLEN = 255);

Property EffectiveTimeHigh As %String(MAXLEN = 255);

Property PerformerIDs As %String;

Property PerformerAddress As %String(MAXLEN = 255);

Property PerformerTelecom As %String(MAXLEN = 255);

Property PerformerName As %String(MAXLEN = 255);

Property AuthorTime As %String(MAXLEN = 255);

Property MemberID As %String(MAXLEN = 255);

Property LocationAddress As %String(MAXLEN = 255);

Property LocationTelecom As %String(MAXLEN = 255);

Property LocationName As %String(MAXLEN = 255);

Property ParticipantRoleID As %String(MAXLEN = 255);

Property ParticipantRoleCode As %String(MAXLEN = 255);

Property ParticipantRoleCodeSystem As %String(MAXLEN = 255);

Property ParticipantRoleCodeSystemName As %String(MAXLEN = 255);

Property XPath As %String(MAXLEN = 255);

Property ProfileID As %String [ Required ];

Storage Default
{
<Data name="CCDPayerDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>PayerID</Value>
</Value>
<Value name="3">
<Value>DocumentID</Value>
</Value>
<Value name="4">
<Value>PayerName</Value>
</Value>
<Value name="5">
<Value>PolicyNumber</Value>
</Value>
<Value name="6">
<Value>CoveredParty</Value>
</Value>
<Value name="7">
<Value>PayerCode</Value>
</Value>
<Value name="8">
<Value>PayerCodeSystem</Value>
</Value>
<Value name="9">
<Value>PayerCodeSystemName</Value>
</Value>
<Value name="10">
<Value>PayerStatusCode</Value>
</Value>
<Value name="11">
<Value>EffectiveTimeLow</Value>
</Value>
<Value name="12">
<Value>EffectiveTimeHigh</Value>
</Value>
<Value name="13">
<Value>PerformerIDs</Value>
</Value>
<Value name="14">
<Value>PerformerAddress</Value>
</Value>
<Value name="15">
<Value>PerformerTelecom</Value>
</Value>
<Value name="16">
<Value>PerformerName</Value>
</Value>
<Value name="17">
<Value>AuthorTime</Value>
</Value>
<Value name="18">
<Value>MemberID</Value>
</Value>
<Value name="19">
<Value>LocationAddress</Value>
</Value>
<Value name="20">
<Value>LocationTelecom</Value>
</Value>
<Value name="21">
<Value>LocationName</Value>
</Value>
<Value name="22">
<Value>ParticipantRoleID</Value>
</Value>
<Value name="23">
<Value>ParticipantRoleCode</Value>
</Value>
<Value name="24">
<Value>ParticipantRoleCodeSystem</Value>
</Value>
<Value name="25">
<Value>ParticipantRoleCodeSystemName</Value>
</Value>
<Value name="26">
<Value>XPath</Value>
</Value>
<Value name="27">
<Value>ProfileID</Value>
</Value>
</Data>
<DataLocation>^LEADNorth.LEADNorDB04.CCDPayerD</DataLocation>
<DefaultData>CCDPayerDefaultData</DefaultData>
<ExtentSize>2</ExtentSize>
<IdLocation>^LEADNorth.LEADNorDB04.CCDPayerD</IdLocation>
<IndexLocation>^LEADNorth.LEADNorDB04.CCDPayerI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="AuthorTime">
<AverageFieldSize>9</AverageFieldSize>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="CoveredParty">
<AverageFieldSize>8.5</AverageFieldSize>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="DocumentID">
<AverageFieldSize>3.5</AverageFieldSize>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="EffectiveTimeHigh">
<AverageFieldSize>6</AverageFieldSize>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="EffectiveTimeLow">
<AverageFieldSize>6</AverageFieldSize>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="LocationAddress">
<AverageFieldSize>54</AverageFieldSize>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="LocationName">
<AverageFieldSize>6</AverageFieldSize>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="LocationTelecom">
<AverageFieldSize>7</AverageFieldSize>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="MemberID">
<AverageFieldSize>11</AverageFieldSize>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="ParticipantRoleCode">
<AverageFieldSize>5</AverageFieldSize>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="ParticipantRoleCodeSystem">
<AverageFieldSize>25</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="ParticipantRoleCodeSystemName">
<AverageFieldSize>6</AverageFieldSize>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="ParticipantRoleID">
<AverageFieldSize>38</AverageFieldSize>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="PayerCode">
<AverageFieldSize>9</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="PayerCodeSystem">
<AverageFieldSize>23</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="PayerCodeSystemName">
<AverageFieldSize>4.5</AverageFieldSize>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="PayerID">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="PayerName">
<AverageFieldSize>32.5</AverageFieldSize>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="PayerStatusCode">
<AverageFieldSize>11</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="PerformerAddress">
<AverageFieldSize>8.5</AverageFieldSize>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="PerformerIDs">
<AverageFieldSize>2.5</AverageFieldSize>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="PerformerName">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="PerformerTelecom">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="PolicyNumber">
<AverageFieldSize>5</AverageFieldSize>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="ProfileID">
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
<StreamLocation>^LEADNorth.LEADNorDB04.CCDPayerS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
