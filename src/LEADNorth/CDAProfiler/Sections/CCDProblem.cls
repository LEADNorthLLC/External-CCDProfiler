Class LEADNorth.CDAProfiler.Sections.CCDProblem Extends %Persistent
{

Property ProblemID As %String(MAXLEN = 255);

Property DocumentID As LEADNorth.CDAProfiler.Sections.CCDDocument [ Required ];

Property ProblemClassCode As %String(MAXLEN = 255);

Property MoodCode As %String(MAXLEN = 255);

Property StatusCode As %String(MAXLEN = 100);

Property EffectiveTimeLow As %String(MAXLEN = 50);

Property EffectiveTimeHigh As %String(MAXLEN = 50);

Property ProblemTypeCode As %String(MAXLEN = 255);

Property ProblemTypeName As %String(MAXLEN = 255);

Property ValueCode As %String(MAXLEN = 255);

Property ValueDisplayName As %String(MAXLEN = 255);

Property CodeSystem As %String(MAXLEN = 255);

Property CodeSystemName As %String(MAXLEN = 255);

Property AuthorTime As %String(MAXLEN = 50);

Property Author As %String(MAXLEN = 255);

Property ProfileID As %String [ Required ];

Property NullValues As %String(MAXLEN = 255);

Property SDAMapping As %String(MAXLEN = 255);

Property XPath As %String(MAXLEN = 255);

Storage Default
{
<Data name="CCDProblemDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>ProblemID</Value>
</Value>
<Value name="3">
<Value>DocumentID</Value>
</Value>
<Value name="4">
<Value>ProblemClassCode</Value>
</Value>
<Value name="5">
<Value>MoodCode</Value>
</Value>
<Value name="6">
<Value>StatusCode</Value>
</Value>
<Value name="7">
<Value>EffectiveTimeLow</Value>
</Value>
<Value name="8">
<Value>EffectiveTimeHigh</Value>
</Value>
<Value name="9">
<Value>ProblemTypeCode</Value>
</Value>
<Value name="10">
<Value>ProblemTypeName</Value>
</Value>
<Value name="11">
<Value>ValueCode</Value>
</Value>
<Value name="12">
<Value>ValueDisplayName</Value>
</Value>
<Value name="13">
<Value>CodeSystem</Value>
</Value>
<Value name="14">
<Value>CodeSystemName</Value>
</Value>
<Value name="15">
<Value>AuthorTime</Value>
</Value>
<Value name="16">
<Value>Author</Value>
</Value>
<Value name="17">
<Value>ProfileID</Value>
</Value>
<Value name="18">
<Value>NullValues</Value>
</Value>
<Value name="19">
<Value>SDAMapping</Value>
</Value>
<Value name="20">
<Value>XPath</Value>
</Value>
</Data>
<DataLocation>^LEADNorth.LEADNDB04.CCDProblemD</DataLocation>
<DefaultData>CCDProblemDefaultData</DefaultData>
<ExtentSize>85</ExtentSize>
<IdLocation>^LEADNorth.LEADNDB04.CCDProblemD</IdLocation>
<IndexLocation>^LEADNorth.LEADNDB04.CCDProblemI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,16,$lb("-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000"),$lb(21,21,21,21,21,21,21,21,21,21,21,21,21,21,21),$lb(758198320,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,758198320))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb("1","6","12","18","24","30","36","42","48","54","60","65","70","75","80","85"),$lb(0,0,1,0,0,1,0,1,0,0,1,0,1,0,1),$lb(822083584,822083584,905969664,905969664,825360384,838860800,939524096,825753600,842268672,842268672,858783744,805306368,905969664,859176960,875692032,838860800,939524096,876085248,892600320,892600320,909115392,805306368,889192448,909443072,925892608,805306368,889192448,926220288,942669824,805306368,889192448,942997504))</Histogram>
<Selectivity>1</Selectivity>
</Property>
<Property name="Author">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="AuthorTime">
<AverageFieldSize>13.35</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," 20070103000000-0500"," 20110925010000-0400"," 20130130000000-0500"," 20161024155423"," 20180820105829"," 20180904101809"," 20200605093443"," 20200706083734"," 20210808165136"," 20220111160232"," 20220711160940"," 20230202224818"),$lb(2,2,2,1,3,4,4,4,6,3,6,4,4,6,4),$lb(536870912,0,0,0,0,0,0,0,842018871,808923185,825307193,825243954,858796339,858796339,909193266,909193266,942684210,942813233,959460401,825765945,842018870,909129008,925906480,808466224,825243696,825243696,842019121,825307441,925970737,842020657,858796592,540160050))</Histogram>
<OutlierSelectivity>.270588:</OutlierSelectivity>
<Selectivity>1.9195%</Selectivity>
</Property>
<Property name="CodeSystem">
<AverageFieldSize>23.94</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" 2.16.840.1.113883.5.4"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"," 2.16.840.1.113883.6.96"),$lb(19,24,24,24,24,24,24,24,24,24,24,24,24,24,24),$lb(540159537,892220416,908998966,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,540159537))</Histogram>
<OutlierSelectivity>.941176:"2.16.840.1.113883.6.96"</OutlierSelectivity>
<Selectivity>5.8824%</Selectivity>
</Property>
<Property name="CodeSystemName">
<AverageFieldSize>8.56</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," SNOMED CT"," SNOMED CT"," SNOMED CT"," SNOMED CT"," SNOMED CT"," SNOMED CT"," SNOMED CT"," SNOMED CT"," SNOMED CT"," SNOMED CT"," SNOMED CT"," SNOMED CT"),$lb(2,2,2,1,11,11,11,11,11,11,11,11,11,11,11),$lb(536870912,0,0,0,0,0,0,0,1397641037,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,542330447))</Histogram>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="DocumentID">
<AverageFieldSize>3.29</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb("1","2","4","8","8","8","8","8","8","8","8","12","13","19","21","22"),$lb(0,0,0,1,1,1,1,1,1,1,0,1,1,0,1),$lb(822083584,822083584,838860800,838860800,872415232,872415232,939524096,0,0,0,0,0,0,0,0,0,0,0,0,0,0,939524096,825360384,838860800,855638016,855638016,956301312,825819136,842072064,822083584,838860800,842137600))</Histogram>
<OutlierSelectivity>.529412:8</OutlierSelectivity>
<Selectivity>2.7682%</Selectivity>
</Property>
<Property name="EffectiveTimeHigh">
<AverageFieldSize>2.38</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," 20110103"),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,1),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,842019121,540160049))</Histogram>
<OutlierSelectivity>.952941:</OutlierSelectivity>
<Selectivity>4.7059%</Selectivity>
</Property>
<Property name="EffectiveTimeLow">
<AverageFieldSize>14.76</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," 199803"," 20090709"," 20140212130251"," 20161024000000-0400"," 20170403000000-0400"," 20180820000000-0400"," 20200605000000-0400"," 20200605000000-0400"," 20200605000000-0400"," 20210111000000-0500"," 20220111000000-0500"," 20230619"," 20230619"),$lb(2,2,1,1,3,4,4,4,3,21,21,4,4,4,10),$lb(536870912,0,0,0,0,0,825833784,825833784,842018873,809054263,825503794,875573809,909193266,909193266,925905968,925905968,942684210,825765944,842018870,0,0,0,0,808465968,825241905,825241905,842019121,842019121,858797617,0,0,540160050))</Histogram>
<OutlierSelectivity>.164706:</OutlierSelectivity>
<Selectivity>2.7843%</Selectivity>
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
<Property name="ProblemClassCode">
<AverageFieldSize>5</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" ACT"," ACT"," ACT"," ACT"," ACT"," ACT"," ACT"," ACT"," ACT"," ACT"," ACT"," ACT"," ACT"," ACT"," ACT"," ACT"),$lb(5,5,5,5,5,5,5,5,5,5,5,5,5,5,5),$lb(541147988,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,541147988))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="ProblemID">
<AverageFieldSize>38.84</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," 1.2.840.113619.21.1.4778906300703140889.3.4"," 1.2.840.113619.21.1.4778906300703140889.3.4"," 1.2.840.113619.21.1.4778906300703140889.3.4"," 1.2.840.113619.21.1.4778906300703140889.3.4"," 1.2.840.113619.21.1.4778906300703140889.3.4"," 1.2.840.113619.21.1.4778906300703140889.3.4"," 1.2.840.113619.21.1.4778906300703140889.3.4"," 1.2.840.113619.21.1.4778906300703140889.3.4"," 1.3.6.1.4.1.22812.11.99930.3.4.1"," 1.3.6.1.4.1.22812.3.99930.3.4.1"," 36C67DA6-6F25-4568-87DD-DFAD72F47131"," 629CD12F-AE3C-44EE-804C-4478D4B45D56"," AE54637A-A4A6-475E-940E-3A93B19842FC"," E8B099BF-9556-4997-90CE-739B8E6C8049"," EC8A6FF8-ED4B-4F7E-82C3-E98E58B45DE7"),$lb(1,45,45,45,45,45,45,45,3,19,1,1,1,1,2),$lb(536870912,0,825111086,0,0,0,0,0,0,0,0,0,0,0,0,0,0,841889844,858666542,825306681,858667321,825111342,859194166,859194166,909261123,909261123,1095054644,1095054644,1161314864,943861817,1127760182,541410104))</Histogram>
<OutlierSelectivity>.529412:"1.2.840.113619.21.1.4778906300703140889.3.4"</OutlierSelectivity>
<Selectivity>2.2409%</Selectivity>
</Property>
<Property name="ProblemTypeCode">
<AverageFieldSize>10.66</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" 282291009"," 282291009"," 282291009"," 282291009"," 282291009"," 282291009"," 282291009"," 282291009"," 409586006"," 55607006"," 55607006"," 55607006"," 55607006"," 64572001"," 64572001"," ASSERTION"),$lb(11,11,11,11,11,11,11,1,1,10,10,10,1,10,1),$lb(540162098,0,0,0,0,0,0,0,0,0,0,0,0,0,0,842543666,875575605,875575605,892679728,0,0,0,0,0,0,892679728,909391159,0,0,909391159,1095979845,541152083))</Histogram>
<Selectivity>20.0000%</Selectivity>
</Property>
<Property name="ProblemTypeName">
<AverageFieldSize>9.87</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," COMPLAINT"," DIAGNOSIS"," DIAGNOSIS"," DIAGNOSIS"," DIAGNOSIS"," DIAGNOSIS"," DIAGNOSIS"," DIAGNOSIS"," DIAGNOSIS"," DISORDER"," PROBLEM"," PROBLEM"," PROBLEM"," PROBLEM"," PROBLEM"),$lb(1,1,11,11,11,11,11,11,11,3,1,9,9,9,9),$lb(536870912,0,1129270608,1129270608,1145651527,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1095192143,1397707332,1145656143,1347571522,0,0,0,0,0,0,0,0,542134863))</Histogram>
<Selectivity>20.0000%</Selectivity>
</Property>
<Property name="ProfileID">
<AverageFieldSize>11</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"),$lb(11,11,11,11,11,11,11,11,11,11,11,11,11,11,11),$lb(542393683,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,542393683))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="SDAMapping">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="StatusCode">
<AverageFieldSize>9.27</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" ACTIVE"," ACTIVE"," ACTIVE"," ACTIVE"," ACTIVE"," ACTIVE"," ACTIVE"," ACTIVE"," ACTIVE"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"),$lb(8,8,8,8,8,8,8,8,1,11,11,11,11,11,11),$lb(541147988,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1094931529,1129270608,0,0,0,0,0,0,0,0,0,0,0,0,541282125))</Histogram>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="ValueCode">
<AverageFieldSize>8.51</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," 102594003"," 194828000"," 195967001"," 233604007"," 24623002"," 371622005"," 38341003"," 43339004"," 47933007"," 5880005"," 80394007"," I82.461"," Z68.21"),$lb(2,2,1,2,3,1,2,1,2,1,2,1,1,1,1),$lb(536870912,0,0,0,0,0,825242165,808596793,959723570,876098104,892941879,825832761,842216246,858994224,875967027,842282546,859255094,925972018,942879793,859321140,875770675,858993465,926495539,876034355,892876848,892876848,942682937,942682937,1228419630,1228419630,1513502766,542783032))</Histogram>
<OutlierSelectivity>.2:</OutlierSelectivity>
<Selectivity>2.0513%</Selectivity>
</Property>
<Property name="ValueDisplayName">
<AverageFieldSize>17.18</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," ABRASION OF TRUNK"," ANGINA (DISORDER)"," ASTHMA"," CRAMP IN LOWER LIMB"," FOOT PAIN"," HYPERGLYCEMIA"," HYPERTENSIVE DISORDER"," HYPOKALEMIA"," LOCALIZED EDEMA"," PNEUMONIA"," PNEUMONIA"," SPASM OF BACK MUSCLES"," TYPE II DIABETES"),$lb(2,2,1,2,2,1,1,1,6,4,1,1,11,1,1),$lb(536870912,0,0,0,0,0,1094865473,1112686931,1313294670,1313294670,1398032461,1095980104,1129464141,1129464141,1179602772,1179602772,1213812805,1196185923,1413828179,1163023429,1330331980,1213812815,1280262977,1280262977,1347306837,0,0,1347306837,1397768531,1397768531,1415139397,542398800))</Histogram>
<OutlierSelectivity>.2:</OutlierSelectivity>
<Selectivity>1.9048%</Selectivity>
</Property>
<Property name="XPath">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-12</BlockCount>
</SQLMap>
<StreamLocation>^LEADNorth.LEADNDB04.CCDProblemS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
