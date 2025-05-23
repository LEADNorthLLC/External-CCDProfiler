Class LEADNorth.CDAProfiler.Sections.CCDEncompassingEncounter Extends %Persistent
{

Property EncounterID As %String(MAXLEN = 255);

Property DocumentID As LEADNorth.CDAProfiler.Sections.CCDDocument [ Required ];

Property EncounterTypeDisplayName As %String(MAXLEN = 255);

Property EncounterTypeCode As %String(MAXLEN = 255);

Property EncounterTypeCodeSystem As %String(MAXLEN = 255);

Property EncounterTypeCodeSystemName As %String(MAXLEN = 255);

Property StartDateTime As %String(MAXLEN = 255);

Property EndDateTime As %String(MAXLEN = 255);

Property DischargeDisposition As %String(MAXLEN = 255);

Property LocationID As %String(MAXLEN = 255);

Property LocationName As %String(MAXLEN = 255);

Property LocationAddress As %String(MAXLEN = 255);

Property LocationTelecom As %String(MAXLEN = 255);

Property AuthorTime As %String(MAXLEN = 255);

Property ProfileID As %String [ Required ];

Property XPath As %String(MAXLEN = 255);

Storage Default
{
<Data name="CCDEncompassingEncounterDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>EncounterID</Value>
</Value>
<Value name="3">
<Value>DocumentID</Value>
</Value>
<Value name="4">
<Value>EncounterTypeDisplayName</Value>
</Value>
<Value name="5">
<Value>EncounterTypeCode</Value>
</Value>
<Value name="6">
<Value>EncounterTypeCodeSystem</Value>
</Value>
<Value name="7">
<Value>EncounterTypeCodeSystemName</Value>
</Value>
<Value name="8">
<Value>StartDateTime</Value>
</Value>
<Value name="9">
<Value>EndDateTime</Value>
</Value>
<Value name="10">
<Value>DischargeDisposition</Value>
</Value>
<Value name="11">
<Value>LocationID</Value>
</Value>
<Value name="12">
<Value>LocationName</Value>
</Value>
<Value name="13">
<Value>LocationAddress</Value>
</Value>
<Value name="14">
<Value>LocationTelecom</Value>
</Value>
<Value name="15">
<Value>AuthorTime</Value>
</Value>
<Value name="16">
<Value>ProfileID</Value>
</Value>
<Value name="17">
<Value>XPath</Value>
</Value>
</Data>
<DataLocation>^LEADNorthDB04.CCDEncompas5806D</DataLocation>
<DefaultData>CCDEncompassingEncounterDefaultData</DefaultData>
<ExtentSize>18</ExtentSize>
<IdLocation>^LEADNorthDB04.CCDEncompas5806D</IdLocation>
<IndexLocation>^LEADNorthDB04.CCDEncompas5806I</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,16,$lb("-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000"),$lb(21,21,21,21,21,21,21,21,21,21,21,21,21,21,21),$lb(758198320,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,758198320))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb("1","2","4","6","7","8","9","10","11","12","13","14","15","16","17","18"),$lb(0,0,0,0,0,0,0,1,1,1,1,1,1,1,1),$lb(822083584,822083584,838860800,838860800,872415232,872415232,905969664,905969664,922746880,922746880,939524096,939524096,956301312,956301312,825229312,805306368,822083584,822083584,838860800,838860800,855638016,855638016,872415232,872415232,889192448,889192448,905969664,905969664,922746880,922746880,939524096,825753600))</Histogram>
<Selectivity>1</Selectivity>
</Property>
<Property name="AuthorTime">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="DischargeDisposition">
<AverageFieldSize>2.94</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," ROUTINE DISCHARGE"),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,1),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1380930900,542265173))</Histogram>
<OutlierSelectivity>.944444:</OutlierSelectivity>
<Selectivity>5.5556%</Selectivity>
</Property>
<Property name="DocumentID">
<AverageFieldSize>3.56</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb("1","2","4","7","8","9","10","11","13","14","15","16","17","20","21","22"),$lb(0,0,0,0,0,0,1,1,1,1,1,1,0,1,1),$lb(822083584,822083584,838860800,838860800,872415232,872415232,922746880,922746880,939524096,939524096,956301312,956301312,825229312,805306368,822083584,822083584,855638016,855638016,872415232,872415232,889192448,889192448,905969664,905969664,922746880,825688064,842006528,805306368,822083584,822083584,838860800,842137600))</Histogram>
<Selectivity>5.5556%</Selectivity>
</Property>
<Property name="EncounterID">
<AverageFieldSize>14.78</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," 162"," 20130307_100^INTERNAL MEDICINE"," 20130307_100^INTERNAL MEDICINE"," 20130307_100^INTERNAL MEDICINE"," 5283815"," 5283815"," 5283815"," 5283815"," 5283815"," 9937012"," 9937012"," 9937012"," 9937012"," 9937012"," 9937012"),$lb(1,1,32,32,1,9,9,9,9,1,9,9,9,9,9),$lb(536870912,0,825635328,825635328,842019123,0,0,0,0,842019123,892483635,0,0,0,0,0,0,0,0,892483635,960049975,0,0,0,0,0,0,0,0,0,0,540621107))</Histogram>
<Selectivity>20.0000%</Selectivity>
</Property>
<Property name="EncounterTypeCode">
<AverageFieldSize>3.39</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," 99213"," 99213"," 99213"," 99213"," 99213"),$lb(2,2,2,2,2,2,2,2,2,2,1,7,7,7,7),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,960049713,0,0,0,0,0,0,0,0,540621106))</Histogram>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="EncounterTypeCodeSystem">
<AverageFieldSize>8.11</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," 2.16.840.1.113883.6.12"," 2.16.840.1.113883.6.12"," 2.16.840.1.113883.6.12"," 2.16.840.1.113883.6.12"," 2.16.840.1.113883.6.12"),$lb(2,2,2,2,2,2,2,2,2,2,1,24,24,24,24),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,841888054,0,0,0,0,0,0,0,0,540159537))</Histogram>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="EncounterTypeCodeSystemName">
<AverageFieldSize>3.39</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," CPT-4"," CPT-4"," CPT-4"," CPT-4"," CPT-4"),$lb(2,2,2,2,2,2,2,2,2,2,1,7,7,7,7),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1129337901,0,0,0,0,0,0,0,0,541282388))</Histogram>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="EncounterTypeDisplayName">
<AverageFieldSize>8.94</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," EVALUATION AND MANAGEMENT"," EVALUATION AND MANAGEMENT"," EVALUATION AND MANAGEMENT"," EVALUATION AND MANAGEMENT"," EVALUATION AND MANAGEMENT"),$lb(2,2,2,2,2,2,2,2,2,2,1,27,27,27,27),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1163280716,0,0,0,0,0,0,0,0,541414977))</Histogram>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="EndDateTime">
<AverageFieldSize>9.5</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," 20050329"," 20050329"," 20050329"," 20050329"," 20050329"," 20110714090051-0400"," 20130130080051-0500"," 20130130080051-0500"," 20130130080051-0500"," 20130130080051-0500"),$lb(2,2,2,2,2,1,10,10,10,10,3,4,21,21,21),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,842018869,0,0,0,0,0,0,0,0,808792115,825307191,825243441,858796339,0,0,0,0,0,0,540160049))</Histogram>
<Selectivity>25.0000%</Selectivity>
</Property>
<Property name="LocationAddress">
<AverageFieldSize>21.44</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," MA"_$c(10,9,9,9,9,9,9,9)_" CHESTNUT HILL"_$c(10,9,9,9,9,9,9,9)_"02467"_$c(10,9,9,9,9,9,9,9)_"850 BOYLSTON ST SUITE 530"," MA"_$c(10,9,9,9,9,9,9,9)_" CHESTNUT HILL"_$c(10,9,9,9,9,9,9,9)_"02467"_$c(10,9,9,9,9,9,9,9)_"850 BOYLSTON ST SUITE 530"," MA"_$c(10,9,9,9,9,9,9,9)_" CHESTNUT HILL"_$c(10,9,9,9,9,9,9,9)_"02467"_$c(10,9,9,9,9,9,9,9)_"850 BOYLSTON ST SUITE 530"," MA"_$c(10,9,9,9,9,9,9,9)_" CHESTNUT HILL"_$c(10,9,9,9,9,9,9,9)_"02467"_$c(10,9,9,9,9,9,9,9)_"850 BOYLSTON ST SUITE 530"," MA"_$c(10,9,9,9,9,9,9,9)_" CHESTNUT HILL"_$c(10,9,9,9,9,9,9,9)_"02467"_$c(10,9,9,9,9,9,9,9)_"850 BOYLSTON ST SUITE 530"),$lb(2,2,2,2,2,2,2,2,2,2,1,120,120,120,120),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1296108041,0,0,0,0,0,0,0,0,541933834))</Histogram>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="LocationID">
<AverageFieldSize>7.83</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," 100^INTERNAL MEDICINE"," 100^INTERNAL MEDICINE"," 100^INTERNAL MEDICINE"," 100^INTERNAL MEDICINE"," 100^INTERNAL MEDICINE"),$lb(2,2,2,2,2,2,2,2,2,2,1,23,23,23,23),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,825241694,0,0,0,0,0,0,0,0,540094512))</Histogram>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="LocationName">
<AverageFieldSize>12.83</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," BPG AT 850 BOYLSTON - INTERNAL MEDICINE"," BPG AT 850 BOYLSTON - INTERNAL MEDICINE"," BPG AT 850 BOYLSTON - INTERNAL MEDICINE"," BPG AT 850 BOYLSTON - INTERNAL MEDICINE"," BPG AT 850 BOYLSTON - INTERNAL MEDICINE"),$lb(2,2,2,2,2,2,2,2,2,2,1,41,41,41,41),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1112557344,0,0,0,0,0,0,0,0,541216839))</Histogram>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="LocationTelecom">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="ProfileID">
<AverageFieldSize>11</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"),$lb(11,11,11,11,11,11,11,11,11,11,11,11,11,11,11),$lb(542393683,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,542393683))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="StartDateTime">
<AverageFieldSize>9.39</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," 20050329"," 20050329"," 20050329"," 20050329"," 20050329"," 20120806090051"," 20120815090051"," 20120815090051"," 20130130090051"," 20130130090051"," 20130710214400.000-0500"),$lb(2,2,2,2,1,10,10,10,10,3,7,16,4,16,6),$lb(536870912,0,0,0,0,0,0,0,0,0,842018869,0,0,0,0,0,0,0,0,808792115,825372728,808857657,825569337,0,0,842020913,858796339,0,0,825438256,925970482,540160049))</Histogram>
<Selectivity>16.6667%</Selectivity>
</Property>
<Property name="XPath">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^LEADNorthDB04.CCDEncompas5806S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
