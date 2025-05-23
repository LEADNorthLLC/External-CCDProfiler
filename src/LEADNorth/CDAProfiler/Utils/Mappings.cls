Class LEADNorth.CDAProfiler.Utils.Mappings Extends %Persistent
{

ClassMethod GetXPathForProperty(prop As %String, xsltBlock As %String) As %String [ ZenMethod ]
{
    Set xdata = ##class(%Dictionary.XDataDefinition).IDKEYOpen("LEADNorth.CDAProfiler.XSLT.CDAParser", xsltBlock)
    If xdata = $$$NULLOREF {
        Quit "Error: XData block not found!"
    }
    
    Set xsltText = xdata.Data.Read()
    Set dbl = $Char(34)  // double quote
    
    Set tmplSearch = "<xsl:template match="_dbl
    Set posTmpl = $Find(xsltText, tmplSearch)
    If posTmpl=0 {
        Quit "Error: Template match not found."
    }
    Set posTmplEnd = $Find(xsltText, dbl, posTmpl)
    If posTmplEnd=0 {
        Quit "Error: Closing quote for template match not found."
    }
    Set templateMatch = $Extract(xsltText, posTmpl, posTmplEnd-2)
    
    Set propTag = "<"_prop_">"
    
    Set posProp=0
    
    If xsltBlock="PatientXSLT" {
        Set posProp = $Find(xsltText, propTag, posTmplEnd)
        If posProp=0 {
            Quit "Error: Property '"_prop_"' not found in PatientXSLT."
        }
    } Else {
        Set forEachSearch = "<xsl:for-each select="_dbl
        Set posForEach = $Find(xsltText, forEachSearch, posTmplEnd)
        If posForEach=0 {
            Quit "Error: for-each not found."
        }
        Set posForEachEnd = $Find(xsltText, dbl, posForEach)
        If posForEachEnd=0 {
            Quit "Error: Closing quote for for-each select not found."
        }
        Set forEachSelect = $Extract(xsltText, posForEach, posForEachEnd-2)
        
        Set posProp = $Find(xsltText, propTag, posForEachEnd)
        If posProp=0 {
            Quit "Error: Property '"_prop_"' not found in XData block."
        }
        
        Set valueOfSearch = "<xsl:value-of select="_dbl
        Set posVal = $Find(xsltText, valueOfSearch, posProp)
        If posVal=0 {
            Quit "Error: <xsl:value-of> for property '"_prop_"' not found."
        }
        Set posValEnd = $Find(xsltText, dbl, posVal)
        If posValEnd=0 {
            Quit "Error: Closing quote for property '"_prop_"' not found."
        }
        Set propertyXPath = $Extract(xsltText, posVal, posValEnd-2)
        
        Set relativeCount=0
        While $Extract(propertyXPath,1,3)="../" {
            Set relativeCount=relativeCount+1
            Set propertyXPath = $Extract(propertyXPath,4,$Length(propertyXPath))
        }
        
        Set numPieces = $Length(forEachSelect,"/")
        If numPieces <= relativeCount {
            Quit "Error: Relative path exceeds for-each context."
        }
        Set newForEach=""
        For i=1:1:(numPieces-relativeCount) {
            If newForEach="" {
                Set newForEach = $Piece(forEachSelect,"/",i)
            } Else {
                Set newForEach = newForEach_"/"_$Piece(forEachSelect,"/",i)
            }
        }
        
        Set finalXPath = templateMatch_"/"_newForEach_"/"_propertyXPath
        Quit finalXPath
    }
    
    Set valueOfSearch = "<xsl:value-of select="_dbl
    Set posVal = $Find(xsltText, valueOfSearch, posProp)
    If posVal=0 {
        Quit "Error: <xsl:value-of> for property '"_prop_"' not found in PatientXSLT."
    }
    Set posValEnd = $Find(xsltText, dbl, posVal)
    If posValEnd=0 {
        Quit "Error: Closing quote for property '"_prop_"' not found in PatientXSLT."
    }
    Set propertyXPath = $Extract(xsltText, posVal, posValEnd-2)
    
    If $Extract(propertyXPath,1,1)'="/" {
        Set propertyXPath = "/"_propertyXPath
    }
    Set finalXPath = templateMatch_propertyXPath
    
    Quit finalXPath
}

Storage Default
{
<Data name="MappingsDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
</Data>
<DataLocation>^LEADNorth.LEADNorD782.MappingsD</DataLocation>
<DefaultData>MappingsDefaultData</DefaultData>
<IdLocation>^LEADNorth.LEADNorD782.MappingsD</IdLocation>
<IndexLocation>^LEADNorth.LEADNorD782.MappingsI</IndexLocation>
<StreamLocation>^LEADNorth.LEADNorD782.MappingsS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
