Class LEADNorth.CDAProfiler.Sections.CCDResult Extends %Persistent
{

Property DocumentID As LEADNorth.CDAProfiler.Sections.CCDDocument [ Required ];

Property ResultID As %String(MAXLEN = 255);

Property TestValue As %String(MAXLEN = 255);

Property Units As %String(MAXLEN = 255);

Property ReferenceRange As %String(MAXLEN = 255);

Property StatusCode As %String(MAXLEN = 255);

Property ObservationCode As %String(MAXLEN = 255);

Property ObservationCodeDisplayName As %String(MAXLEN = 255);

Property ObservationCodeSystem As %String(MAXLEN = 255);

Property ObservationCodeSystemName As %String(MAXLEN = 255);

Property OrganizerID As %String(MAXLEN = 255);

Property OrganizerName As %String(MAXLEN = 255);

Property MoodCode As %String(MAXLEN = 255);

Property EffectiveTimeLow As %String(MAXLEN = 255);

Property EffectiveTimeHigh As %String(MAXLEN = 255);

Property AuthorTime As %String(MAXLEN = 255);

Property ProfileID As %String [ Required ];

Property NullValues As %String(MAXLEN = 255);

Property SDAMapping As %String(MAXLEN = 255);

Property XPath As %String(MAXLEN = 255);

Storage Default
{
<Data name="CCDResultDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>DocumentID</Value>
</Value>
<Value name="3">
<Value>ResultID</Value>
</Value>
<Value name="4">
<Value>TestValue</Value>
</Value>
<Value name="5">
<Value>Units</Value>
</Value>
<Value name="6">
<Value>ReferenceRange</Value>
</Value>
<Value name="7">
<Value>StatusCode</Value>
</Value>
<Value name="8">
<Value>ObservationCode</Value>
</Value>
<Value name="9">
<Value>ObservationCodeDisplayName</Value>
</Value>
<Value name="10">
<Value>ObservationCodeSystem</Value>
</Value>
<Value name="11">
<Value>ObservationCodeSystemName</Value>
</Value>
<Value name="12">
<Value>OrganizerID</Value>
</Value>
<Value name="13">
<Value>OrganizerName</Value>
</Value>
<Value name="14">
<Value>MoodCode</Value>
</Value>
<Value name="15">
<Value>EffectiveTimeLow</Value>
</Value>
<Value name="16">
<Value>EffectiveTimeHigh</Value>
</Value>
<Value name="17">
<Value>AuthorTime</Value>
</Value>
<Value name="18">
<Value>ProfileID</Value>
</Value>
<Value name="19">
<Value>NullValues</Value>
</Value>
<Value name="20">
<Value>SDAMapping</Value>
</Value>
<Value name="21">
<Value>XPath</Value>
</Value>
</Data>
<DataLocation>^LEADNorth.LEADNoDB04.CCDResultD</DataLocation>
<DefaultData>CCDResultDefaultData</DefaultData>
<ExtentSize>232</ExtentSize>
<IdLocation>^LEADNorth.LEADNoDB04.CCDResultD</IdLocation>
<IndexLocation>^LEADNorth.LEADNoDB04.CCDResultI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,16,$lb("-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000"),$lb(21,21,21,21,21,21,21,21,21,21,21,21,21,21,21),$lb(758198320,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,758198320))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb("1","16","32","48","64","80","96","112","127","142","157","172","187","202","217","232"),$lb(1,0,0,0,0,0,0,1,1,1,1,1,0,1,1),$lb(822083584,0,905969664,825622528,858914816,858914816,876085248,876085248,909377536,909377536,942669824,942669824,959840256,959840256,825307648,825360384,842465280,842465280,875692032,875692032,892796928,892796928,926023680,926023680,943128576,825767680,842019328,808583168,825688064,825688064,858914816,842215936))</Histogram>
<Selectivity>1</Selectivity>
</Property>
<Property name="AuthorTime">
<AverageFieldSize>6.05</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," 20130710223121.000-0500"," 20230111120231"," 20230111120245"," 20230111120250"," 20230111120251"),$lb(2,2,2,2,2,2,2,2,2,2,1,3,13,13,14),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,842019123,825438263,842215473,858849280,875888640,875888640,892338176,805306368,822083584,540160050))</Histogram>
<OutlierSelectivity>.732759:</OutlierSelectivity>
<Selectivity>0.9544%</Selectivity>
</Property>
<Property name="DocumentID">
<AverageFieldSize>3.63</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb("1","2","8","8","8","8","13","13","13","14","15","16","16","17","17","22"),$lb(0,0,1,1,1,0,2,2,1,1,1,2,1,2,0),$lb(822083584,822083584,838860800,838860800,939524096,0,0,0,0,0,0,939524096,825425920,0,0,0,0,855638016,872415232,872415232,889192448,889192448,905969664,0,0,905969664,922746880,0,0,825688064,842137600,842137600))</Histogram>
<Selectivity>6.2500%</Selectivity>
</Property>
<Property name="EffectiveTimeHigh">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="EffectiveTimeLow">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="MoodCode">
<AverageFieldSize>5</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" EVN"," EVN"," EVN"," EVN"," EVN"," EVN"," EVN"," EVN"," EVN"," EVN"," EVN"," EVN"," EVN"," EVN"," EVN"," EVN"),$lb(5,5,5,5,5,5,5,5,5,5,5,5,5,5,5),$lb(541414990,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,541414990))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="NullValues">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="ObservationCode">
<AverageFieldSize>8.25</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" 10466-1"," 14957-5"," 1751-7"," 17861-6"," 2000-8"," 20570-8"," 2160-0"," 2339-0"," 2777-1"," 2947-0"," 30313-1"," 33765-9"," 38483-4"," 6598-7"," 705-4"," 804-5"),$lb(2,2,3,1,3,2,2,2,2,1,2,2,1,1,1),$lb(540094516,808728118,876164407,876164407,926232877,892415287,943075629,825702454,842018864,808463672,892809261,808793904,825634861,825634861,858994989,858994989,926365485,926365485,959723309,842609719,858796849,808661299,859256373,859256373,942946355,859321400,909457720,909457720,925906221,925906221,942683181,540553268))</Histogram>
<Selectivity>1.4286%</Selectivity>
</Property>
<Property name="ObservationCodeDisplayName">
<AverageFieldSize>42.51</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" 25-HYDROXYCALCIFEROL [MASS/VOLUME] IN SERUM OR PLASMA"," ALBUMIN/GLOBULIN [MASS RATIO] IN SERUM OR PLASMA"," BASOPHILS [#/VOLUME] IN BLOOD BY MANUAL COUNT"," CALCIUM [MASS/VOLUME] IN SERUM OR PLASMA"," CARBON DIOXIDE, TOTAL [MOLES/VOLUME] IN SERUM OR PLASMA"," CHOLESTEROL/HDL RATIO, SERUM, PERCENT"," CREATININE [MASS/VOLUME] IN SERUM OR PLASMA"," DEPRECATED GLUCOSE [MASS/VOLUME] IN SERUM OR PLASMA"," GLOMERULAR FILTRATION RATE/1.73 SQ M.PREDICTED BY CREATININE-BASED FORMULA (MDRD)"," HEMOGLOBIN [MASS/VOLUME] IN BLOOD"," MCV [ENTITIC VOLUME] BY AUTOMATED COUNT"," NEUTROPHIL COUNT, BLOOD"," PLT"," PROTEIN [MASS/VOLUME] IN SERUM OR PLASMA"," TROPONIN T"," WBC"),$lb(1,1,1,3,2,2,1,1,1,1,1,1,2,1,1),$lb(540161325,842345800,1095516757,1095516757,1111577423,1111577423,1128352835,1279478101,1380077390,1095909967,1213156421,1213156421,1380270420,1129465153,1145393234,1145393234,1196183373,1196183373,1212501327,1212501327,1296258592,1296258592,1313166676,1313166676,1347179520,1280573440,1380930629,1347571540,1414680400,1414680400,1463960320,542589507))</Histogram>
<OutlierSelectivity>.056034:"Creatinine [Mass/volume] in Serum or Plasma"</OutlierSelectivity>
<Selectivity>1.0976%</Selectivity>
</Property>
<Property name="ObservationCodeSystem">
<AverageFieldSize>23</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" 2.16.840.1.113883.6.1"," 2.16.840.1.113883.6.1"," 2.16.840.1.113883.6.1"," 2.16.840.1.113883.6.1"," 2.16.840.1.113883.6.1"," 2.16.840.1.113883.6.1"," 2.16.840.1.113883.6.1"," 2.16.840.1.113883.6.1"," 2.16.840.1.113883.6.1"," 2.16.840.1.113883.6.1"," 2.16.840.1.113883.6.1"," 2.16.840.1.113883.6.1"," 2.16.840.1.113883.6.1"," 2.16.840.1.113883.6.1"," 2.16.840.1.113883.6.1"," 2.16.840.1.113883.6.1"),$lb(23,23,23,23,23,23,23,23,23,23,23,23,23,23,23),$lb(540159537,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,540159537))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="ObservationCodeSystemName">
<AverageFieldSize>7</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" LOINC"," LOINC"," LOINC"," LOINC"," LOINC"," LOINC"," LOINC"," LOINC"," LOINC"," LOINC"," LOINC"," LOINC"," LOINC"," LOINC"," LOINC"," LOINC"),$lb(7,7,7,7,7,7,7,7,7,7,7,7,7,7,7),$lb(541871945,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,541871945))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="OrganizerID">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="OrganizerName">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="ProfileID">
<AverageFieldSize>11</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"),$lb(11,11,11,11,11,11,11,11,11,11,11,11,11,11,11),$lb(542393683,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,542393683))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="ReferenceRange">
<AverageFieldSize>10.85</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," 0.0-2.0 MG/DL"," 0.50-1.20 MG/DL"," 10-50 U/L"," 136-145 MMOL/L"," 2.5-5.0"," 25.9-30.0 MEQ/L"," 3.5-5.2 G/DL"," 4-18 MG/DL"," 6-23 MG/DL"," 70-100 MG/DL"," 8.8-10.7 MG/DL"," M 13-18 G/DL; F 12-16 G/DL"),$lb(2,2,2,1,3,1,2,1,2,1,1,1,1,1,1),$lb(536870912,0,0,0,0,0,0,0,808333357,808268334,892349745,808334640,825240885,808269104,859188529,825439789,841889069,775236917,892221741,842346041,858666285,858666285,875376952,875376952,908931635,908931635,925904177,925904177,942553133,942553133,1293955379,541925425))</Histogram>
<OutlierSelectivity>.237069:</OutlierSelectivity>
<Selectivity>0.9908%</Selectivity>
</Property>
<Property name="ResultID">
<AverageFieldSize>26.6</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" 017E3917-08E5-4999-9F95-6A4E570446C8"," 1.3.6.1.4.1.16517"," 1.3.6.1.4.1.16517"," 1.3.6.1.4.1.16517"," 1.3.6.1.4.1.16517"," 1.3.6.1.4.1.16517"," 1.3.6.1.4.1.16517"," 1.3.6.1.4.1.16517"," 1.3.6.1.4.1.16517"," 1.3.6.1.4.1.22812.11.99930.3.4.5"," 1.3.6.1.4.1.22812.11.99930.3.4.5"," 7D5A02B0-67A4-11DB-BD13-0800200C9A66"," A8084335-5630-4311-A827-DAE3643222A8"," A8084335-5630-4311-A827-DAE3643222A8"," A8084335-5630-4311-A827-DAE3643222A8"," EDC28D28-A361-4C16-B2AB-AD9073E0E22A"),$lb(1,19,19,19,19,19,19,19,13,34,1,1,38,38,1),$lb(540029239,808531781,825111342,0,0,0,0,0,0,0,0,0,0,0,0,0,0,825636145,842151985,0,0,825111342,927216961,927216961,1094201400,0,0,0,0,1094201400,1162101554,541410371))</Histogram>
<OutlierSelectivity>.573276:"1.3.6.1.4.1.16517"</OutlierSelectivity>
<Selectivity>3.8793%</Selectivity>
</Property>
<Property name="SDAMapping">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="StatusCode">
<AverageFieldSize>10.79</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"),$lb(1,11,11,11,11,11,11,11,11,11,11,11,11,11,11),$lb(536870912,0,1129270608,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,541282125))</Histogram>
<OutlierSelectivity>.974138:"completed"</OutlierSelectivity>
<Selectivity>1.2931%</Selectivity>
</Property>
<Property name="TestValue">
<AverageFieldSize>4.76</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," 0.01"," 1.70"," 103"," 13.10"," 14.85"," 2.33"," 26"," 3.5"," 32"," 4.1"," 4.74"," 50"," 79"," 9.4"," 99"),$lb(1,1,2,2,2,1,2,1,2,1,3,1,1,1,2),$lb(536870912,0,808333361,808333361,825112368,775368704,808648704,808648704,858665264,858665264,875444277,825503288,841888563,775107328,905969664,842399744,858666240,775225344,838860800,858914816,875442432,822083584,926154752,875444020,892338176,892338176,926482432,926482432,959329280,775159808,956301312,540621056))</Histogram>
<OutlierSelectivity>.047414:</OutlierSelectivity>
<Selectivity>0.8283%</Selectivity>
</Property>
<Property name="Units">
<AverageFieldSize>6.53</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," %"," 10+3/UL"," G/DL"," MG/DL"," MG/DL"," MG/DL"," MG/DL"," MG/DL"," ML/MIN"," MMOL/L"," MMOL/L"," MMOL/L"," NG/ML"," U[IU]/ML"),$lb(2,1,1,1,1,7,7,7,7,2,2,8,8,1,1),$lb(536870912,0,0,0,620756992,620756992,825240371,825240371,1194280012,1194280012,1296510788,0,0,0,0,0,0,0,0,1194280012,1278168393,1278168393,1297042479,0,0,0,0,1296912204,1313288013,1313288013,1432045909,542464841))</Histogram>
<OutlierSelectivity>.310345:"mg/dL"</OutlierSelectivity>
<Selectivity>3.2841%</Selectivity>
</Property>
<Property name="XPath">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-24</BlockCount>
</SQLMap>
<StreamLocation>^LEADNorth.LEADNoDB04.CCDResultS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
