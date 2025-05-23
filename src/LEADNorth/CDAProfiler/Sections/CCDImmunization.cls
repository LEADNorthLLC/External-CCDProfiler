Class LEADNorth.CDAProfiler.Sections.CCDImmunization Extends %Persistent
{

Property ImmunizationID As %String(MAXLEN = 255);

Property DocumentID As LEADNorth.CDAProfiler.Sections.CCDDocument;

Property Route As %String(MAXLEN = 255);

Property Dose As %String(MAXLEN = 255);

Property DoseUnit As %String(MAXLEN = 255);

Property Vaccine As %String(MAXLEN = 255);

Property VaccineCode As %String(MAXLEN = 255);

Property VaccineCodeSystem As %String(MAXLEN = 255);

Property VaccineCodeSystemName As %String(MAXLEN = 255);

Property LotNumber As %String(MAXLEN = 255);

Property StartDate As %String(MAXLEN = 255);

Property EndDate As %String(MAXLEN = 255);

Property PerformerID As %String(MAXLEN = 255);

Property PerformerAddress As %String(MAXLEN = 255);

Property PerformerCity As %String(MAXLEN = 255);

Property PerformerState As %String(MAXLEN = 255);

Property PerformerPostalCode As %String(MAXLEN = 255);

Property StatusCode As %String(MAXLEN = 100);

Property NullFlavor As %String(MAXLEN = 50);

Property XPath As %String(MAXLEN = 255);

Property ProfileID As %String [ Required ];

Storage Default
{
<Data name="CCDImmunizationDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>ImmunizationID</Value>
</Value>
<Value name="3">
<Value>DocumentID</Value>
</Value>
<Value name="4">
<Value>Route</Value>
</Value>
<Value name="5">
<Value>Dose</Value>
</Value>
<Value name="6">
<Value>DoseUnit</Value>
</Value>
<Value name="7">
<Value>Vaccine</Value>
</Value>
<Value name="8">
<Value>VaccineCode</Value>
</Value>
<Value name="9">
<Value>VaccineCodeSystem</Value>
</Value>
<Value name="10">
<Value>VaccineCodeSystemName</Value>
</Value>
<Value name="11">
<Value>LotNumber</Value>
</Value>
<Value name="12">
<Value>StartDate</Value>
</Value>
<Value name="13">
<Value>EndDate</Value>
</Value>
<Value name="14">
<Value>PerformerID</Value>
</Value>
<Value name="15">
<Value>PerformerAddress</Value>
</Value>
<Value name="16">
<Value>PerformerCity</Value>
</Value>
<Value name="17">
<Value>PerformerState</Value>
</Value>
<Value name="18">
<Value>PerformerPostalCode</Value>
</Value>
<Value name="19">
<Value>StatusCode</Value>
</Value>
<Value name="20">
<Value>NullFlavor</Value>
</Value>
<Value name="21">
<Value>XPath</Value>
</Value>
<Value name="22">
<Value>ProfileID</Value>
</Value>
</Data>
<DataLocation>^LEADNorthDB04.CCDImmunizaAE0ED</DataLocation>
<DefaultData>CCDImmunizationDefaultData</DefaultData>
<ExtentSize>27</ExtentSize>
<IdLocation>^LEADNorthDB04.CCDImmunizaAE0ED</IdLocation>
<IndexLocation>^LEADNorthDB04.CCDImmunizaAE0EI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,16,$lb("-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000"),$lb(21,21,21,21,21,21,21,21,21,21,21,21,21,21,21),$lb(758198320,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,758198320))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb("1","2","4","6","8","10","12","14","16","18","20","22","24","25","26","27"),$lb(0,0,0,0,0,1,1,1,1,0,1,1,1,1,1),$lb(822083584,822083584,838860800,838860800,872415232,872415232,905969664,905969664,939524096,939524096,825229312,805306368,838860800,838860800,872415232,872415232,905969664,905969664,939524096,825753600,842006528,805306368,838860800,838860800,872415232,872415232,889192448,889192448,905969664,905969664,922746880,842465280))</Histogram>
<Selectivity>1</Selectivity>
</Property>
<Property name="DocumentID">
<AverageFieldSize>3.52</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb("1","2","4","7","7","8","8","10","10","11","11","13","15","16","17","22"),$lb(0,0,0,1,0,1,0,2,1,2,1,1,1,1,0),$lb(822083584,822083584,838860800,838860800,872415232,872415232,922746880,0,0,922746880,939524096,0,0,939524096,825229312,0,0,805306368,822083584,0,0,822083584,855638016,855638016,889192448,889192448,905969664,905969664,922746880,825688064,842137600,842137600))</Histogram>
<Selectivity>6.6667%</Selectivity>
</Property>
<Property name="Dose">
<AverageFieldSize>2.63</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," 0.25"," 0.3"," 0.3"," 0.5"),$lb(2,2,2,2,2,2,2,2,2,2,2,1,3,5,3),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,808333877,842334208,855638016,0,0,855638016,889192448,540028469))</Histogram>
<OutlierSelectivity>.814815:</OutlierSelectivity>
<Selectivity>6.1728%</Selectivity>
</Property>
<Property name="DoseUnit">
<AverageFieldSize>2.37</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," ML"," ML"," ML"," ML"),$lb(2,2,2,2,2,2,2,2,2,2,2,1,4,4,4),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1296826368,0,0,0,0,0,0,541936640))</Histogram>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="EndDate">
<AverageFieldSize>3.19</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," 20210920"," 20211010"," 20220101"," 20220515"),$lb(2,2,2,2,2,2,2,2,2,2,2,1,5,4,6),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,842019377,809054768,825241904,825307185,842019120,825241856,892417280,540160050))</Histogram>
<OutlierSelectivity>.851852:</OutlierSelectivity>
<Selectivity>3.7037%</Selectivity>
</Property>
<Property name="ImmunizationID">
<AverageFieldSize>5.11</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," 637382500009"," 637382500009"," IMM001"," IMM002"," IMM003"," IMM004"),$lb(2,2,2,2,2,2,2,2,2,1,14,1,6,6,6),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,909326131,0,0,909326131,1229802800,822083584,838860800,838860800,855638016,855638016,872415232,541674829))</Histogram>
<OutlierSelectivity>.666667:</OutlierSelectivity>
<Selectivity>6.6667%</Selectivity>
</Property>
<Property name="LotNumber">
<AverageFieldSize>3.3</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," COV654321"," FLU12345"," HEP321654"," TET789012"),$lb(2,2,2,2,2,2,2,2,2,2,2,1,1,1,1),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1129272886,1129272886,1179407665,1179407665,1212502067,1212502067,1413829687,542393684))</Histogram>
<OutlierSelectivity>.851852:</OutlierSelectivity>
<Selectivity>3.7037%</Selectivity>
</Property>
<Property name="NullFlavor">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="PerformerAddress">
<AverageFieldSize>6.33</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," 1004 HEALTHCARE DR."," 4444 HOSPITAL WAY"," 456 HEALTH ST"," 789 CARE RD"," 987 MEDICAL ST"," GET WELL CLINIC"),$lb(2,2,2,2,2,2,2,2,2,1,1,2,1,1,1),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,825241652,825241652,875836468,875836448,892739656,875902496,926431520,926431520,959985440,959985440,1195725856,541541716))</Histogram>
<OutlierSelectivity>.703704:</OutlierSelectivity>
<Selectivity>4.2328%</Selectivity>
</Property>
<Property name="PerformerCity">
<AverageFieldSize>4.41</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," AIKEN"," COLUMBIA"," PORTLAND"," PORTLAND"," PORTLAND"," PORTLAND"),$lb(2,2,2,2,2,2,2,2,2,1,1,1,10,10,10),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1095322437,1095322437,1129270357,1129270357,1347375700,0,0,0,0,0,0,542134098))</Histogram>
<OutlierSelectivity>.703704:</OutlierSelectivity>
<Selectivity>5.9259%</Selectivity>
</Property>
<Property name="PerformerID">
<AverageFieldSize>4.07</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," 192837465"," 3333"," 3333"," 3333"," 876543219"," 987654321"),$lb(2,2,2,2,2,2,2,2,2,1,1,6,6,1,1),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,825831992,825831992,858993459,0,0,0,0,858993459,943142453,943142453,959985462,540620855))</Histogram>
<OutlierSelectivity>.666667:</OutlierSelectivity>
<Selectivity>6.6667%</Selectivity>
</Property>
<Property name="PerformerPostalCode">
<AverageFieldSize>3.52</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," 29201"," 29601"," 97005"," 97005"," 97005"," 97005-"),$lb(2,2,2,2,2,2,2,2,2,1,3,1,7,7,6),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,842609200,842019072,909127936,842610224,959918128,0,0,0,0,0,754974720,540620592))</Histogram>
<OutlierSelectivity>.703704:</OutlierSelectivity>
<Selectivity>4.9383%</Selectivity>
</Property>
<Property name="PerformerState">
<AverageFieldSize>2.59</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," OR"," OR"," SC"," SC"," SC"," SC"),$lb(2,2,2,2,2,2,2,2,2,1,4,1,4,4,4),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1330774016,0,0,1330774016,1396899840,0,0,0,0,0,0,542327552))</Histogram>
<Selectivity>33.3333%</Selectivity>
</Property>
<Property name="ProfileID">
<AverageFieldSize>11</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"),$lb(11,11,11,11,11,11,11,11,11,11,11,11,11,11,11),$lb(542393683,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,542393683))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="Route">
<AverageFieldSize>17.04</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," INTRAMUSCULAR"," INTRAMUSCULAR"," INTRAMUSCULAR"," INTRAMUSCULAR"," INTRAMUSCULAR"," INTRAMUSCULAR INJECTION"," INTRAMUSCULAR INJECTION"," INTRAMUSCULAR INJECTION"," INTRAMUSCULAR INJECTION"," INTRAMUSCULAR INJECTION"," INTRAMUSCULAR INJECTION"," INTRAMUSCULAR INJECTION"," INTRAMUSCULAR INJECTION"),$lb(2,2,1,15,15,15,15,14,25,25,25,25,25,25,25),$lb(536870912,0,0,0,0,0,1229870162,0,0,0,0,0,0,0,0,0,541675082,0,0,0,0,0,0,0,0,0,0,0,0,0,0,541675092))</Histogram>
<Selectivity>25.0000%</Selectivity>
</Property>
<Property name="StartDate">
<AverageFieldSize>11.44</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" 19981215"," 19981215"," 19981215"," 19981215"," 19981215"," 199911"," 199911"," 20120330"," 20120815"," 20130710220200.000-0500"," 20140212130251"," 20140212130357"," 20210920"," 20211010"," 20220101"," 20220515"),$lb(10,10,10,10,4,8,1,6,4,4,12,3,5,4,6),$lb(540096825,0,0,0,0,0,0,0,0,942748209,959525120,0,0,825833785,842019122,858992640,942748928,842020913,858797873,858797873,875573809,842346752,859125504,825503794,842084409,809054768,825241904,825307185,842019120,825241856,892417280,540160050))</Histogram>
<OutlierSelectivity>.333333:19981215</OutlierSelectivity>
<Selectivity>4.1667%</Selectivity>
</Property>
<Property name="StatusCode">
<AverageFieldSize>11</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"),$lb(11,11,11,11,11,11,11,11,11,11,11,11,11,11,11),$lb(541282125,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,541282125))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="Vaccine">
<AverageFieldSize>24.63</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," COVID-19 VACCINE"," INFLUENZA VACCINE"," INFLUENZA VIRUS VACCINE"," INFLUENZA VIRUS VACCINE"," INFLUENZA VIRUS VACCINE"," INFLUENZA VIRUS VACCINE"," INFLUENZA VIRUS VACCINE"," INFLUENZA VIRUS VACCINE, INACTIVATED"," PNEUMOCOCCAL POLYSACCHARIDE VACCINE"," TETANUS AND DIPHTHERIA TOXOIDS - PRESERVATIVE FREE"," TETANUS AND DIPHTHERIA TOXOIDS - PRESERVATIVE FREE"," TETANUS AND DIPHTHERIA TOXOIDS - PRESERVATIVE FREE"," TETANUS VACCINE"),$lb(2,2,1,1,12,25,25,25,25,24,1,1,52,52,9),$lb(536870912,0,0,0,0,0,1129272905,1129272905,1229866572,1094927177,1230132563,0,0,0,0,0,0,0,0,0,740313422,1229866572,1347306837,1347306837,1413829697,0,0,0,0,1095648288,1447117635,542393684))</Histogram>
<OutlierSelectivity>.407407:"Influenza virus vaccine"</OutlierSelectivity>
<Selectivity>7.4074%</Selectivity>
</Property>
<Property name="VaccineCode">
<AverageFieldSize>4.33</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," 103"," 103"," 321654"," 33"," 654321"," 88"," 88"," 88"," 88"," 88"," 88"," 88"," 88"),$lb(2,2,1,5,1,2,1,1,4,4,4,4,4,4,4),$lb(536870912,0,0,0,0,0,825242368,0,0,825242368,858927414,842085941,855638016,858980352,909456435,909456435,943194112,0,0,0,0,0,0,0,0,0,0,0,0,0,0,540555264))</Histogram>
<OutlierSelectivity>.444444:88</OutlierSelectivity>
<Selectivity>7.9365%</Selectivity>
</Property>
<Property name="VaccineCodeSystem">
<AverageFieldSize>20.37</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," 2.16.840.1.113883.12.292"," 2.16.840.1.113883.12.292"," 2.16.840.1.113883.12.292"," 2.16.840.1.113883.6.59"," 2.16.840.1.113883.6.59"," 2.16.840.1.113883.6.59"," 2.16.840.1.113883.6.59"," 2.16.840.1.113883.6.59"," 2.16.840.1.113883.6.59"," 2.16.840.1.113883.6.88"," 2.16.840.1.113883.6.88"," 2.16.840.1.113883.6.88"," 2.16.840.1.113883.6.88"),$lb(2,2,1,26,26,19,24,24,24,24,24,21,24,24,24),$lb(536870912,0,0,0,0,0,841888054,0,0,0,0,825372210,908997945,0,0,0,0,0,0,0,0,0,0,892928000,943194112,0,0,0,0,0,0,540159537))</Histogram>
<Selectivity>25.0000%</Selectivity>
</Property>
<Property name="VaccineCodeSystemName">
<AverageFieldSize>4</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," CVX"," CVX"," CVX"," CVX"," CVX"," CVX"," CVX"," CVX"," CVX"," CVX"," CVX"),$lb(2,2,2,2,1,5,5,5,5,5,5,5,5,5,5),$lb(536870912,0,0,0,0,0,0,0,0,0,1129732096,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,541283928))</Histogram>
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
<StreamLocation>^LEADNorthDB04.CCDImmunizaAE0ES</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
