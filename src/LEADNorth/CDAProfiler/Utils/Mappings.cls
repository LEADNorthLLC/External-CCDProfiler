Class LEADNorth.CDAProfiler.Utils.Mappings Extends %Persistent
{

/// The current best attempt at being able to dynamically grab the Xpath from which values are pulled
ClassMethod GetXPathForProperty(prop As %String, xsltBlock As %String) As %String
{
    Set xdata = ##class(%Dictionary.XDataDefinition).IDKEYOpen("LEADNorth.CDAProfiler.XSLT.CDAParser", xsltBlock)
    If xdata = $$$NULLOREF Quit "Error: XData block not found!"

    Set xsltText = xdata.Data.Read()
    Set dbl = $Char(34)

    // Get <xsl:template match="...">
    Set tmplSearch = "<xsl:template match="_dbl
    Set posTmpl = $Find(xsltText, tmplSearch)
    If posTmpl=0 Quit "Error: Template match not found."

    Set posTmplEnd = $Find(xsltText, dbl, posTmpl)
    If posTmplEnd=0 Quit "Error: Closing quote for template match not found."

    Set templateMatch = $Extract(xsltText, posTmpl, posTmplEnd-2)

    Set propTag = "<"_prop_">"
    Set posProp = $Find(xsltText, propTag, posTmplEnd)
    If posProp=0 Quit "Error: Property '"_prop_"' not found."

    Set valueOfSearch = "<xsl:value-of select="_dbl
    Set posVal = $Find(xsltText, valueOfSearch, posProp)
    If posVal=0 Quit "Error: <xsl:value-of> for property '"_prop_"' not found."

    Set posValEnd = $Find(xsltText, dbl, posVal)
    If posValEnd=0 Quit "Error: Closing quote for property '"_prop_"' not found."

    Set propertyXPath = $Extract(xsltText, posVal, posValEnd-2)

    // If PatientXSLT, the value-of is absolute or relative to root
    If xsltBlock="PatientXSLT" {
        If $Extract(propertyXPath,1,1)'="/" {
            Set propertyXPath = "/"_propertyXPath
        }
        Quit templateMatch_propertyXPath
    }

    // Otherwise, derive path from <xsl:for-each>
    Set forEachSearch = "<xsl:for-each select="_dbl
    Set posForEach = $Find(xsltText, forEachSearch, posTmplEnd)
    If posForEach=0 Quit "Error: for-each not found."

    Set posForEachEnd = $Find(xsltText, dbl, posForEach)
    If posForEachEnd=0 Quit "Error: Closing quote for for-each select not found."

    Set forEachSelect = $Extract(xsltText, posForEach, posForEachEnd-2)

    // Count how many "../" appear at start of propertyXPath
    Set relativeCount=0
    While $Extract(propertyXPath,1,3)="../" {
        Set relativeCount=relativeCount+1
        Set propertyXPath = $Extract(propertyXPath,4,*)
    }

    Set numPieces = $Length(forEachSelect,"/")
    If numPieces <= relativeCount Quit "Error: Relative path exceeds for-each context."

    Set contextPath=""
    For i=1:1:(numPieces-relativeCount) {
        Set contextPath = contextPath _ $Select(i=1:"", 1:"/") _ $Piece(forEachSelect,"/",i)
    }

    Set finalXPath = templateMatch_"/"_contextPath_"/"_propertyXPath
    Quit finalXPath
}

Storage Default
{
<Data name="MappingsDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
</Data>
<DataLocation>^LEADNorth.CDAProfB0DB.MappingsD</DataLocation>
<DefaultData>MappingsDefaultData</DefaultData>
<IdLocation>^LEADNorth.CDAProfB0DB.MappingsD</IdLocation>
<IndexLocation>^LEADNorth.CDAProfB0DB.MappingsI</IndexLocation>
<StreamLocation>^LEADNorth.CDAProfB0DB.MappingsS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
