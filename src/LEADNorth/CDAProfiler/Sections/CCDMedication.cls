Class LEADNorth.CDAProfiler.Sections.CCDMedication Extends %Persistent
{

Property MedicationID As %String(MAXLEN = 255);

Property DocumentID As LEADNorth.CDAProfiler.Sections.CCDDocument;

Property DrugName As %String(MAXLEN = 255);

Property GenericName As %String(MAXLEN = 255);

Property Dose As %String(MAXLEN = 255);

Property DoseUnits As %String(MAXLEN = 255);

Property Frequency As %String(MAXLEN = 255);

Property Route As %String(MAXLEN = 255);

Property Site As %String(MAXLEN = 255);

Property AdministrationUnit As %String(MAXLEN = 255);

Property StartDate As %String(MAXLEN = 255);

Property EndDate As %String(MAXLEN = 255);

Property Provider As %String(MAXLEN = 255);

Property NDC As %String(MAXLEN = 255);

Property RxNormCode As %String(MAXLEN = 255);

Property GPI As %String(MAXLEN = 255);

Property Status As %String(MAXLEN = 255);

Property NullValues As %String(MAXLEN = 255);

Property SDAMapping As %String(MAXLEN = 255);

Property XPath As %String(MAXLEN = 255);

Property ProfileID As %String [ Required ];

Storage Default
{
<Data name="CCDMedicationDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>MedicationID</Value>
</Value>
<Value name="3">
<Value>DocumentID</Value>
</Value>
<Value name="4">
<Value>DrugName</Value>
</Value>
<Value name="5">
<Value>GenericName</Value>
</Value>
<Value name="6">
<Value>Dose</Value>
</Value>
<Value name="7">
<Value>DoseUnits</Value>
</Value>
<Value name="8">
<Value>Frequency</Value>
</Value>
<Value name="9">
<Value>Route</Value>
</Value>
<Value name="10">
<Value>Site</Value>
</Value>
<Value name="11">
<Value>AdministrationUnit</Value>
</Value>
<Value name="12">
<Value>StartDate</Value>
</Value>
<Value name="13">
<Value>EndDate</Value>
</Value>
<Value name="14">
<Value>Provider</Value>
</Value>
<Value name="15">
<Value>NDC</Value>
</Value>
<Value name="16">
<Value>RxNormCode</Value>
</Value>
<Value name="17">
<Value>GPI</Value>
</Value>
<Value name="18">
<Value>Status</Value>
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
<Value name="22">
<Value>ProfileID</Value>
</Value>
</Data>
<DataLocation>^LEADNorth.LEDB04.CCDMedicationD</DataLocation>
<DefaultData>CCDMedicationDefaultData</DefaultData>
<ExtentSize>65</ExtentSize>
<IdLocation>^LEADNorth.LEDB04.CCDMedicationD</IdLocation>
<IndexLocation>^LEADNorth.LEDB04.CCDMedicationI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,16,$lb("-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000"),$lb(21,21,21,21,21,21,21,21,21,21,21,21,21,21,21),$lb(758198320,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,758198320))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb("1","5","10","15","20","25","29","33","37","41","45","49","53","57","61","65"),$lb(0,0,1,0,1,1,0,1,0,1,1,0,1,0,1),$lb(822083584,822083584,889192448,889192448,825229312,805306368,889192448,825556992,842006528,805306368,889192448,889192448,956301312,842596352,858980352,855638016,922746880,859242496,875626496,822083584,889192448,889192448,956301312,876150784,892534784,855638016,922746880,892796928,909180928,822083584,889192448,909443072))</Histogram>
<Selectivity>1</Selectivity>
</Property>
<Property name="AdministrationUnit">
<AverageFieldSize>4.2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," AEROSOL, METERED"," INHALANT"," TABLET"," TABLET"),$lb(2,2,2,2,2,2,2,2,2,2,2,1,1,1,8),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1095062095,1095062095,1229867073,1229867073,1413562956,0,0,542392642))</Histogram>
<OutlierSelectivity>.753846:</OutlierSelectivity>
<Selectivity>4.1026%</Selectivity>
</Property>
<Property name="DocumentID">
<AverageFieldSize>3.28</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb("1","2","4","8","8","8","8","8","8","8","8","13","17","19","21","22"),$lb(0,0,0,1,1,1,1,1,1,1,0,1,1,0,1),$lb(822083584,822083584,838860800,838860800,872415232,872415232,939524096,0,0,0,0,0,0,0,0,0,0,0,0,0,0,939524096,825425920,855638016,922746880,922746880,956301312,825819136,842072064,822083584,838860800,842137600))</Histogram>
<OutlierSelectivity>.523077:8</OutlierSelectivity>
<Selectivity>2.9808%</Selectivity>
</Property>
<Property name="Dose">
<AverageFieldSize>2.78</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," 1"," 1"," 1"," 15.0"," 2"," 20"," 75.0"),$lb(2,2,2,2,2,2,2,2,1,3,3,2,1,2,1),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,822083584,0,0,0,0,0,892219392,825568816,838860800,0,805306368,842006528,926232112,540489006))</Histogram>
<OutlierSelectivity>.584615:</OutlierSelectivity>
<Selectivity>3.7762%</Selectivity>
</Property>
<Property name="DoseUnits">
<AverageFieldSize>3.03</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," 1"," 1"," MG/3ML"," UNITS"," {TABLET}"),$lb(2,2,2,2,2,2,2,2,2,2,1,3,1,1,1),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,822083584,0,0,822083584,1296510771,1296510771,1431193940,1431193940,2069119298,544953409))</Histogram>
<OutlierSelectivity>.723077:</OutlierSelectivity>
<Selectivity>3.9560%</Selectivity>
</Property>
<Property name="DrugName">
<AverageFieldSize>21.46</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," ????"," ALBUTEROL 0.09 MG/ACTUAT INHALANT SOLUTION"," ATORVASTATIN 40 MG ORAL TABLET"," CEFTRIAXONE 2 GRAMS IV"," CLOTRIMAZOLE-BETAMETHASONE"," DICLOFENAC EPOLAMINE"," FAMOTIDINE"," HYDROCHLOROTHIAZIDE"," INSULIN GLARGINE 100 UNT/ML INJECTABLE SOLUTION"," LISINOPRIL"," MULTIPLE VITAMINS-MINERALS"," OLOPATADINE"," PROVENTIL 0.09 MG/ACTUAT METERED DOSE"," TURMERIC CAPSULE"),$lb(2,1,1,2,1,2,1,1,1,1,1,1,1,1,1),$lb(536870912,0,0,0,1061109567,1061109567,1095516757,1279415636,1414484566,1096044370,1128613460,1162237010,1280267346,1129074516,1145652044,1145652044,1178684751,1178684751,1213809746,1213809746,1229869909,1229869909,1279873865,1279873865,1297435732,1297435732,1330401104,1330401104,1347571542,1347571542,1414877773,542397778))</Histogram>
<OutlierSelectivity>.123077:</OutlierSelectivity>
<Selectivity>2.3701%</Selectivity>
</Property>
<Property name="EndDate">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="Frequency">
<AverageFieldSize>2.4</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," 12"," 24"," 24"," 6"," 8"),$lb(2,2,2,2,2,2,2,2,2,2,1,1,4,1,1),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,825360384,825360384,842268672,0,0,842268672,905969664,905969664,939524096,540540928))</Histogram>
<OutlierSelectivity>.738462:</OutlierSelectivity>
<Selectivity>6.5385%</Selectivity>
</Property>
<Property name="GPI">
<AverageFieldSize>8.92</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," 22100045000320"," 24000035008705"," 37600040000305"," 42200032301810"," 75100050100305"," 78310000000300"," 7910990310"," 90159902053710"," 9560635600"),$lb(2,2,2,2,2,2,1,2,1,1,1,2,2,1,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,842150192,842084400,875573296,842281008,859256368,859256368,875704880,875704880,926232880,892416048,942879024,942879024,959524921,926495024,959459637,808531257,892743734,540620086))</Histogram>
<OutlierSelectivity>.492308:</OutlierSelectivity>
<Selectivity>3.3846%</Selectivity>
</Property>
<Property name="GenericName">
<AverageFieldSize>5.55</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," NOVOLOG"," PROVENTIL 0.09 MG/ACTUAT INHALANT SOLUTION"),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,1,1),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1313822287,1313822287,1347571542,542134863))</Histogram>
<OutlierSelectivity>.907692:</OutlierSelectivity>
<Selectivity>3.0769%</Selectivity>
</Property>
<Property name="MedicationID">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="NDC">
<AverageFieldSize>6.68</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," 1152108"," 1797907"," 198145"," 243670"," 284810"," 310273"," 310798"," 314076"," 329498"," 617311"," 828348"," 860978"),$lb(2,2,2,1,2,2,1,2,1,4,3,2,1,1,2),$lb(536870912,0,0,0,0,0,0,0,825308466,825569841,926496569,926496569,959983924,825833521,842281782,875771447,942946353,842544184,858861618,842478336,926496768,808925496,875575094,825503799,842609721,858929460,909195059,909195059,942815283,842543924,909130039,540554800))</Histogram>
<OutlierSelectivity>.230769:</OutlierSelectivity>
<Selectivity>2.4814%</Selectivity>
</Property>
<Property name="NullValues">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="ProfileID">
<AverageFieldSize>11</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"," TESTING99"),$lb(11,11,11,11,11,11,11,11,11,11,11,11,11,11,11),$lb(542393683,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,542393683))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="Provider">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="Route">
<AverageFieldSize>7.08</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," EXT"," INTRAVENOUS"," ORAL"," ORAL"," ORAL"," ORAL"," ORAL"," ORAL"," ORAL"," RESPIRATORY (INHALATION)"," RESPIRATORY (INHALATION)"," TRANS"),$lb(2,2,2,1,1,1,6,6,6,6,6,6,1,26,1),$lb(536870912,0,0,0,0,0,0,0,1163416576,1163416576,1229870162,1229870162,1330790732,0,0,0,0,0,0,0,0,0,0,0,0,1330790732,1380275024,0,0,1380275024,1414676814,542396993))</Histogram>
<Selectivity>10.0000%</Selectivity>
</Property>
<Property name="RxNormCode">
<AverageFieldSize>6.68</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," 1152108"," 1797907"," 198145"," 243670"," 284810"," 310273"," 310798"," 314076"," 329498"," 617311"," 828348"," 860978"),$lb(2,2,2,1,2,2,1,2,1,4,3,2,1,1,2),$lb(536870912,0,0,0,0,0,0,0,825308466,825569841,926496569,926496569,959983924,825833521,842281782,875771447,942946353,842544184,858861618,842478336,926496768,808925496,875575094,825503799,842609721,858929460,909195059,909195059,942815283,842543924,909130039,540554800))</Histogram>
<OutlierSelectivity>.230769:</OutlierSelectivity>
<Selectivity>2.4814%</Selectivity>
</Property>
<Property name="SDAMapping">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="Site">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="StartDate">
<AverageFieldSize>18.49</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," 20080808215400.000-0500"," 20090109215300.000-0600"," 20110301"," 20120219"," 20130130"," 20140212130251"," 20161024000000-0400"," 20161024000000-0400"," 20170214000000-0500"," 20180820000000-0400"," 20180820000000-0400"," 20200601000000-0400"," 20200601000000-0400"," 20210111000000-0500"," 20220301000000-0500"),$lb(1,4,3,4,4,4,4,21,4,4,21,3,21,4,4),$lb(536870912,0,842018872,942684208,959459632,809054257,825307187,825242416,842019377,842019377,858796339,858796339,875573809,875573809,909193266,0,0,909193266,925905457,925905457,942684210,0,0,825765944,842018870,0,0,808465968,825241905,825241905,842019632,540160050))</Histogram>
<Selectivity>3.0303%</Selectivity>
</Property>
<Property name="Status">
<AverageFieldSize>10.69</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" ACTIVE"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," COMPLETED"," ORDERED"),$lb(1,11,11,11,11,11,11,11,11,11,11,11,11,11,1),$lb(541147988,1094931529,1129270608,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1129270608,1330791493,542069316))</Histogram>
<OutlierSelectivity>.876923:"completed"</OutlierSelectivity>
<Selectivity>6.1538%</Selectivity>
</Property>
<Property name="XPath">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-8</BlockCount>
</SQLMap>
<StreamLocation>^LEADNorth.LEDB04.CCDMedicationS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
