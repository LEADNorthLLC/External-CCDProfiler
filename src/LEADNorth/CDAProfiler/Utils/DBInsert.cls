Class LEADNorth.CDAProfiler.Utils.DBInsert Extends %Persistent
{

ClassMethod SectionStats(documentID As %Integer, sectionName As %String) As %Status
{
  Set doc = ##class(LEADNorth.CDAProfiler.Sections.CCDDocument).%OpenId(documentID)
  Quit:'$IsObject(doc) $$$ERROR($$$GeneralError, "Document not found")

  Set cur = "," _ doc.SectionsPresent _ ","
  If cur'[(","_sectionName_",") {
    If doc.SectionsPresent'="" {
      Set doc.SectionsPresent = doc.SectionsPresent _ "," _ sectionName
    } Else  {
      Set doc.SectionsPresent = sectionName
    }
    Set sc = doc.%Save()
    Quit:$$$ISERR(sc) sc
  }
  Quit $$$OK
}

ClassMethod InsertDocumentMetadata(docXml As %Stream.GlobalCharacter, Output documentID As %Integer, profileID As %String) As %Status
{
    Set docString = docXml.Read()

    Set textreader = ##class(%XML.TextReader).%New(1)

    Set status = ##class(%XML.TextReader).ParseString(docString, .textreader)
    If $$$ISERR(status) {
        Do $System.Status.DisplayError(status)
        Quit status
    }

    Set patientID = ""
    Set documentDate = ""
    Set allSections = ""

    While textreader.Read()
    {
        If textreader.NodeType = "element" {
            If textreader.LocalName = "PatientID" {
                Set status = textreader.Read()  // Move to the text node
                If textreader.NodeType = "chars" {
                    Set patientID = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "DocumentDate" {
                Set status = textreader.Read()  // Move to the text node
                If textreader.NodeType = "chars" {
                    Set documentDate = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "DocumentDate" {
                Set status = textreader.Read()  // Move to the text node
                If textreader.NodeType = "chars" {
                    Set documentDate = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "AllSections" {
                Set status = textreader.Read()  // Move to the text node
                If textreader.NodeType = "chars" {
                    Set allSections = textreader.Value
                }
            }
        }
    }

    //Write "PatientID: ", patientID, !
    //Write "DocumentDate: ", documentDate, !

    If patientID'="" && documentDate'="" {
        Set document = ##class(LEADNorth.CDAProfiler.Sections.CCDDocument).%New()
        Set document.ProfileID = profileID
        Set document.PatientID = +patientID
        Set document.DocumentDate = $zdateh($e(documentDate,1,8),8)  // Convert to an internal date format
        Set document.AllSections = allSections

        //Write "docdate: ", document.DocumentDate, !
        //Write "patid: ", document.PatientID, !

        Set saveStatus = document.%Save()
        If $$$ISERR(saveStatus) {
            Write "Error saving document metadata.", !
            Do $system.OBJ.DisplayError(saveStatus)
            Quit saveStatus
        }

        //Write "DocumentID: ", document.DocumentID, !
        Set documentID = document.DocumentID  // Set the output parameter to the generated DocumentID
    } Else {
        Write "PatientID or DocumentDate is missing from the XML.", !
        Quit $$$ERROR($$$GeneralError, "PatientID or DocumentDate missing.")
    }

    Quit $$$OK
}

ClassMethod InsertAllergyData(allergyXml As %Stream.GlobalCharacter, documentID As %Integer, profileID As %String) As %Status
{
    Set allergyString = allergyXml.Read()
	//write !, allergyString, !
    Set textreader = ##class(%XML.TextReader).%New(1)
    Set status = ##class(%XML.TextReader).ParseString(allergyString, .textreader)
    If $$$ISERR(status) {
        Do $System.Status.DisplayError(status)
        Quit status
    }

    Set allergyID = ""
    Set allergyCode = ""
    Set allergyCodeSystem = ""
    Set allergyCodeSystemName = ""
    Set allergyDisplayName = ""
    Set categoryCode = ""
    Set categoryCodeSystem = ""
    Set categoryCodeSystemName = ""
    Set categoryDisplayName = ""
    Set reactionCode = ""
    Set reactionCodeSystem = ""
    Set reactionCodeSystemName = ""
    Set reactionDisplayName = ""
    Set severityCode = ""
    Set severityCodeSystem = ""
    Set severityCodeName = ""
    Set severityDisplayName = ""
    Set provider = ""
    Set actIdExtension = ""
    Set actIdRoot = ""
    Set actClassCode = ""
    Set actMoodCode = ""
    Set actStatusCode = ""
    Set effectiveTimeLow = ""
    Set effectiveTimeHigh = ""
    Set observationCode = ""
    Set observationCodeSystem = ""
    Set observationDisplayName = ""
    Set observationStatusCode = ""
    Set observationEffectiveTimeLow = ""
    Set observationEffectiveTimeHigh = ""
    Set statusCode = ""
    Set statusCodeSystem = ""
    Set statusCodeSystemName = ""
    Set statusDisplayName = ""
    Set referenceAllergyId = ""
    Set referenceReactionId = ""
    Set referenceSeverityId = ""
    Set referenceStatusId = ""
    Set representedOrganization = ""

    While textreader.Read()
    {
        If textreader.NodeType = "element" {
            If textreader.LocalName = "AllergyID" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set allergyID = textreader.Value
                    write allergyID
                }
            }
            ElseIf textreader.LocalName = "AllergyCode" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set allergyCode = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "AllergyCodeSystem" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set allergyCodeSystem = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "AllergyCodeSystemName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set allergyCodeSystemName = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "AllergyDisplayName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set allergyDisplayName = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "CategoryCode" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set categoryCode = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "CategoryCodeSystem" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set categoryCodeSystem = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "CategoryCodeSystemName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set categoryCodeSystemName = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "CategoryDisplayName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set categoryDisplayName = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "ReactionCode" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set reactionCode = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "ReactionCodeSystem" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set reactionCodeSystem = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "ReactionCodeSystemName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set reactionCodeSystemName = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "ReactionDisplayName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set reactionDisplayName = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "SeverityCode" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set severityCode = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "SeverityCodeSystem" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set severityCodeSystem = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "SeverityCodeName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set severityCodeName = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "SeverityDisplayName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set severityDisplayName = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "Provider" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set provider = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "ActIdExtension" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set actIdExtension = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "ActIdRoot" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set actIdRoot = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "ActClassCode" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set actClassCode = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "ActMoodCode" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set actMoodCode = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "ActStatusCode" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set actStatusCode = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "EffectiveTimeLow" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set effectiveTimeLow = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "EffectiveTimeHigh" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set effectiveTimeHigh = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "ObservationCode" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set observationCode = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "ObservationCodeSystem" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set observationCodeSystem = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "ObservationDisplayName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set observationDisplayName = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "ObservationStatusCode" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set observationStatusCode = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "ObservationEffectiveTimeLow" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set observationEffectiveTimeLow = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "ObservationEffectiveTimeHigh" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set observationEffectiveTimeHigh = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "StatusCode" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set statusCode = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "StatusCodeSystem" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set statusCodeSystem = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "StatusCodeSystemName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set statusCodeSystemName = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "StatusDisplayName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set statusDisplayName = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "ReferenceAllergyId" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set referenceAllergyId = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "ReferenceReactionId" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set referenceReactionId = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "ReferenceSeverityId" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set referenceSeverityId = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "ReferenceStatusId" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set referenceStatusId = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "RepresentedOrganization" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set representedOrganization = textreader.Value
                }
            }
        } 
        ElseIf (textreader.LocalName = "Allergy") && (textreader.NodeType = "endelement") {
            Set document = ##class(LEADNorth.CDAProfiler.Sections.CCDDocument).%OpenId(documentID)
                If '$IsObject(document) {
                    Write "Document not found for ID: ", documentID, !
                    Continue
                }
            Set allergy = ##class(LEADNorth.CDAProfiler.Sections.CCDAllergy).%New()
            Set allergy.DocumentID = document
            Set allergy.AllergyID = allergyID
            Set allergy.AllergyCode = allergyCode
            Set allergy.AllergyCodeSystem = allergyCodeSystem
            Set allergy.AllergyCodeSystemName = allergyCodeSystemName
            Set allergy.AllergyDisplayName = allergyDisplayName
            Set allergy.CategoryCode = categoryCode
            Set allergy.CategoryCodeSystem = categoryCodeSystem
            Set allergy.CategoryCodeSystemName = categoryCodeSystemName
            Set allergy.CategoryDisplayName = categoryDisplayName
            Set allergy.ReactionCode = reactionCode
            Set allergy.ReactionCodeSystem = reactionCodeSystem
            Set allergy.ReactionCodeSystemName = reactionCodeSystemName
            Set allergy.ReactionDisplayName = reactionDisplayName
            Set allergy.SeverityCode = severityCode
            Set allergy.SeverityCodeSystem = severityCodeSystem
            Set allergy.SeverityCodeName = severityCodeName
            Set allergy.SeverityDisplayName = severityDisplayName
            Set allergy.Provider = provider
            Set allergy.ActIdExtension = actIdExtension
            Set allergy.ActIdRoot = actIdRoot
            Set allergy.ActClassCode = actClassCode
            Set allergy.ActMoodCode = actMoodCode
            Set allergy.ActStatusCode = actStatusCode
            Set allergy.EffectiveTimeLow = effectiveTimeLow
            Set allergy.EffectiveTimeHigh = effectiveTimeHigh
            Set allergy.ObservationCode = observationCode
            Set allergy.ObservationCodeSystem = observationCodeSystem
            Set allergy.ObservationDisplayName = observationDisplayName
            Set allergy.ObservationStatusCode = observationStatusCode
            Set allergy.ObservationEffectiveTimeLow = observationEffectiveTimeLow
            Set allergy.ObservationEffectiveTimeHigh = observationEffectiveTimeHigh
            Set allergy.StatusCode = statusCode
            Set allergy.StatusCodeSystem = statusCodeSystem
            Set allergy.StatusCodeSystemName = statusCodeSystemName
            Set allergy.StatusDisplayName = statusDisplayName
            Set allergy.ReferenceAllergyId = referenceAllergyId
            Set allergy.ReferenceReactionId = referenceReactionId
            Set allergy.ReferenceSeverityId = referenceSeverityId
            Set allergy.ReferenceStatusId = referenceStatusId
            Set allergy.RepresentedOrganization = representedOrganization
            Set allergy.ProfileID = profileID

            Set saveStatus = allergy.%Save()
            If $$$ISERR(saveStatus) {
                Write "Error saving allergy data.", !
                Continue
            } else {
	        	Do ..SectionStats(documentID, "Allergy")
        	}

            Set allergyID = ""
            Set allergyCode = ""
            Set allergyCodeSystem = ""
            Set allergyCodeSystemName = ""
            Set allergyDisplayName = ""
            Set categoryCode = ""
            Set categoryCodeSystem = ""
            Set categoryCodeSystemName = ""
            Set categoryDisplayName = ""
            Set reactionCode = ""
            Set reactionCodeSystem = ""
            Set reactionCodeSystemName = ""
            Set reactionDisplayName = ""
            Set severityCode = ""
            Set severityCodeSystem = ""
            Set severityCodeName = ""
            Set severityDisplayName = ""
            Set provider = ""
            Set actIdExtension = ""
            Set actIdRoot = ""
            Set actClassCode = ""
            Set actMoodCode = ""
            Set actStatusCode = ""
            Set effectiveTimeLow = ""
            Set effectiveTimeHigh = ""
            Set observationCode = ""
            Set observationCodeSystem = ""
            Set observationDisplayName = ""
            Set observationStatusCode = ""
            Set observationEffectiveTimeLow = ""
            Set observationEffectiveTimeHigh = ""
            Set statusCode = ""
            Set statusCodeSystem = ""
            Set statusCodeSystemName = ""
            Set statusDisplayName = ""
            Set referenceAllergyId = ""
            Set referenceReactionId = ""
            Set referenceSeverityId = ""
            Set referenceStatusId = ""
            Set representedOrganization = ""
        }
    }
    
    Quit $$$OK
}

ClassMethod InsertMedicationData(medicationXml As %Stream.GlobalCharacter, documentID As %Integer, profileID As %String) As %Status
{
    Set medicationString = medicationXml.Read()
    Set textreader = ##class(%XML.TextReader).%New(1)
    Set status = ##class(%XML.TextReader).ParseString(medicationString, .textreader)
    
    If $$$ISERR(status) {
        Do $System.Status.DisplayError(status)
        Quit status
    }

    Set drugName = ""
    Set genericName = ""
    Set dose = ""
    Set doseUnits = ""
    Set frequency = ""
    Set route = ""
    Set site = ""
    Set administrationUnit = ""
    Set startDate = ""
    Set endDate = ""
    Set provider = ""
    Set ndc = ""
    Set rxNormCode = ""
    Set gpi = ""
    Set statusCode = ""

    While textreader.Read() {
        If textreader.NodeType = "element" {
            If textreader.LocalName = "DrugName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set drugName = textreader.Value
                }
            } ElseIf textreader.LocalName = "GenericName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set genericName = textreader.Value
                }
            } ElseIf textreader.LocalName = "Dose" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set dose = textreader.Value
                }
            } ElseIf textreader.LocalName = "DoseUnits" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set doseUnits = textreader.Value
                }
            } ElseIf textreader.LocalName = "Frequency" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set frequency = textreader.Value
                }
            } ElseIf textreader.LocalName = "Route" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set route = textreader.Value
                }
            } ElseIf textreader.LocalName = "Site" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set site = textreader.Value
                }
            } ElseIf textreader.LocalName = "AdministrationUnit" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set administrationUnit = textreader.Value
                }
            } ElseIf textreader.LocalName = "StartDate" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set startDate = textreader.Value
                }
            } ElseIf textreader.LocalName = "EndDate" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set endDate = textreader.Value
                }
            } ElseIf textreader.LocalName = "Provider" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set provider = textreader.Value
                }
            } ElseIf textreader.LocalName = "NDC" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set ndc = textreader.Value
                }
            } ElseIf textreader.LocalName = "RxNormCode" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set rxNormCode = textreader.Value
                }
            } ElseIf textreader.LocalName = "GPI" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set gpi = textreader.Value
                }
            } ElseIf textreader.LocalName = "Status" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set statusCode = textreader.Value
                }
            }

        } ElseIf (textreader.LocalName = "Medication") && (textreader.NodeType = "endelement") {
                Set document = ##class(LEADNorth.CDAProfiler.Sections.CCDDocument).%OpenId(documentID)
                If '$IsObject(document) {
                    Write "Document not found for ID: ", documentID, !
                    Continue
                }

                Set medication = ##class(LEADNorth.CDAProfiler.Sections.CCDMedication).%New()
                Set medication.DocumentID = document
                Set medication.DrugName = drugName
                Set medication.GenericName = genericName
                Set medication.Dose = dose
                Set medication.DoseUnits = doseUnits
                Set medication.Frequency = frequency
                Set medication.Route = route
                Set medication.Site = site
                Set medication.AdministrationUnit = administrationUnit
                Set medication.StartDate = startDate
                Set medication.EndDate = endDate
                Set medication.Provider = provider
                Set medication.NDC = ndc
                Set medication.RxNormCode = rxNormCode
                Set medication.GPI = gpi
                Set medication.Status = statusCode
                Set medication.ProfileID = profileID

                Set saveStatus = medication.%Save()
                If $$$ISERR(saveStatus) {
                    Write "Error saving medication data.", !
                    Do $system.OBJ.DisplayError(saveStatus)
                    Continue
                } else {
	        		Do ..SectionStats(documentID, "Medication")
        		}

                Set drugName = ""
                Set genericName = ""
                Set dose = ""
                Set doseUnits = ""
                Set frequency = ""
                Set route = ""
                Set site = ""
                Set administrationUnit = ""
                Set startDate = ""
                Set endDate = ""
                Set provider = ""
                Set ndc = ""
                Set rxNormCode = ""
                Set gpi = ""
                Set statusCode = ""
            }
    }

    Quit $$$OK
}

ClassMethod InsertProblemsData(problemsXml As %Stream.GlobalCharacter, documentID As %Integer, profileID As %String) As %Status
{
    Set problemsString = problemsXml.Read()
    Set textreader = ##class(%XML.TextReader).%New(1)
    Set status = ##class(%XML.TextReader).ParseString(problemsString, .textreader)
    
    If $$$ISERR(status) {
        Do $System.Status.DisplayError(status)
        Quit status
    }

    Set problemID = ""
    Set problemClassCode = ""
    Set moodCode = ""
    Set statusCode = ""
    Set effectiveTimeLow = ""
    Set effectiveTimeHigh = ""
    Set problemTypeCode = ""
    Set problemTypeName = ""
    Set valueCode = ""
    Set valueDisplayName = ""
    Set codeSystem = ""
    Set codeSystemName = ""
    Set authorTime = ""
    Set author = ""

    While textreader.Read()
    {
        If textreader.NodeType = "element" {
            If textreader.LocalName = "ProblemID" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set problemID = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "ProblemClassCode" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set problemClassCode = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "MoodCode" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set moodCode = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "StatusCode" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set statusCode = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "EffectiveTimeLow" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set effectiveTimeLow = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "EffectiveTimeHigh" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set effectiveTimeHigh = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "ProblemTypeCode" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set problemTypeCode = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "ProblemTypeName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set problemTypeName = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "ValueCode" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set valueCode = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "ValueDisplayName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set valueDisplayName = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "CodeSystem" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set codeSystem = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "CodeSystemName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set codeSystemName = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "AuthorTime" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set authorTime = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "Author" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set author = textreader.Value
                }
            }

        } ElseIf (textreader.LocalName = "Problem") && (textreader.NodeType = "endelement") {
                Set document = ##class(LEADNorth.CDAProfiler.Sections.CCDDocument).%OpenId(documentID)
                If '$IsObject(document) {
                    Write "Document not found for ID: ", documentID, !
                    Continue
                }

                Set problem = ##class(LEADNorth.CDAProfiler.Sections.CCDProblem).%New()
                Set problem.DocumentID = document
                Set problem.ProblemID = problemID
                Set problem.ProblemClassCode = problemClassCode
                Set problem.MoodCode = moodCode
                Set problem.StatusCode = statusCode
                Set problem.EffectiveTimeLow = effectiveTimeLow
                Set problem.EffectiveTimeHigh = effectiveTimeHigh
                Set problem.ProblemTypeCode = problemTypeCode
                Set problem.ProblemTypeName = problemTypeName
                Set problem.ValueCode = valueCode
                Set problem.ValueDisplayName = valueDisplayName
                Set problem.CodeSystem = codeSystem
                Set problem.CodeSystemName = codeSystemName
                Set problem.AuthorTime = authorTime
                Set problem.Author = author
                Set problem.ProfileID = profileID

                Set saveStatus = problem.%Save()
                If $$$ISERR(saveStatus) {
                    Write "Error saving problem data.", !
                    Do $system.OBJ.DisplayError(saveStatus)
                    Continue
                } else {
	        		Do ..SectionStats(documentID, "Problem")
        		}

                Set problemID = ""
                Set problemClassCode = ""
                Set moodCode = ""
                Set statusCode = ""
                Set effectiveTimeLow = ""
                Set effectiveTimeHigh = ""
                Set diagnosisCode = ""
                Set diagnosisDisplayName = ""
                Set valueCode = ""
                Set valueDisplayName = ""
                Set codeSystem = ""
                Set codeSystemName = ""
                Set authorTime = ""
                Set author = ""
            }
    }

    Quit $$$OK
}

ClassMethod InsertDiagnosisData(diagnosisXml As %Stream.GlobalCharacter, documentID As %Integer, profileID As %String) As %Status
{
    Set diagnosisString = diagnosisXml.Read()
    Set textreader = ##class(%XML.TextReader).%New(1)
    Set status = ##class(%XML.TextReader).ParseString(diagnosisString, .textreader)
    
    If $$$ISERR(status) {
        Do $System.Status.DisplayError(status)
        Quit status
    }
    
    Set diagnosisID = ""
    Set diagnosisTypeCode = ""
    Set diagnosisTypeCodeSystem = ""
    Set diagnosisTypeCodeSystemName = ""
    Set diagnosisTypeDisplayName = ""
    Set diagnosisEffectiveTimeLow = ""
    Set diagnosisEffectiveTimeHigh = ""
    Set diagnosisCode = ""
    Set diagnosisCodeSystem = ""
    Set diagnosisCodeSystemName = ""
    Set diagnosisCodeDisplayName = ""
    Set diagnosisStatusCode = ""
    Set diagnosisEncounterNumber = ""

    While textreader.Read()
    {
        If textreader.NodeType = "element" {
            If textreader.LocalName = "DiagnosisID" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set diagnosisID = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "DiagnosisTypeCode" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set diagnosisTypeCode = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "DiagnosisTypeCodeSystem" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set diagnosisTypeCodeSystem = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "DiagnosisTypeCodeSystemName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set diagnosisTypeCodeSystemName = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "DiagnosisTypeDisplayName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set diagnosisTypeDisplayName = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "DiagnosisEffectiveTimeLow" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set diagnosisEffectiveTimeLow = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "DiagnosisEffectiveTimeHigh" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set diagnosisEffectiveTimeHigh = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "DiagnosisCode" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set diagnosisCode = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "DiagnosisCodeSystem" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set diagnosisCodeSystem = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "DiagnosisCodeSystemName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set diagnosisCodeSystemName = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "DiagnosisCodeDisplayName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set diagnosisCodeDisplayName = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "DiagnosisStatusCode" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set diagnosisStatusCode = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "DiagnosisEncounterNumber" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set diagnosisEncounterNumber = textreader.Value
                }
            }

        } ElseIf (textreader.LocalName = "Diagnosis") && (textreader.NodeType = "endelement") {
                Set document = ##class(LEADNorth.CDAProfiler.Sections.CCDDocument).%OpenId(documentID)
                If '$IsObject(document) {
                    Write "Document not found for ID: ", documentID, !
                    Continue
                }
                Set diagnosis = ##class(LEADNorth.CDAProfiler.Sections.CCDDiagnosis).%New()
                Set diagnosis.DocumentID = document
                Set diagnosis.DiagnosisID = diagnosisID
                Set diagnosis.DiagnosisTypeCode = diagnosisTypeCode
                Set diagnosis.DiagnosisTypeCodeSystem = diagnosisTypeCodeSystem
                Set diagnosis.DiagnosisTypeCodeSystemName = diagnosisTypeCodeSystemName
                Set diagnosis.DiagnosisTypeDisplayName = diagnosisTypeDisplayName
                Set diagnosis.DiagnosisEffectiveTimeLow = diagnosisEffectiveTimeLow
                Set diagnosis.DiagnosisEffectiveTimeHigh = diagnosisEffectiveTimeHigh
                Set diagnosis.DiagnosisCode = diagnosisCode
                Set diagnosis.DiagnosisCodeSystem = diagnosisCodeSystem
                Set diagnosis.DiagnosisCodeSystemName = diagnosisCodeSystemName
                Set diagnosis.DiagnosisCodeDisplayName = diagnosisCodeDisplayName
                Set diagnosis.DiagnosisStatusCode = diagnosisStatusCode
                Set diagnosis.DiagnosisEncounterNumber = diagnosisEncounterNumber
                Set diagnosis.ProfileID = profileID

                Set saveStatus = diagnosis.%Save()
                If $$$ISERR(saveStatus) {
                    Write "Error saving diagnosis data.", !
                    Do $system.OBJ.DisplayError(saveStatus)
                    Continue
                } else {
	        		Do ..SectionStats(documentID, "Diagnosis")
        		}

                Set diagnosisID = ""
			    Set diagnosisTypeCode = ""
			    Set diagnosisTypeCodeSystem = ""
			    Set diagnosisTypeCodeSystemName = ""
			    Set diagnosisTypeDisplayName = ""
			    Set diagnosisEffectiveTimeLow = ""
			    Set diagnosisEffectiveTimeHigh = ""
			    Set diagnosisCode = ""
			    Set diagnosisCodeSystem = ""
			    Set diagnosisCodeSystemName = ""
			    Set diagnosisCodeDisplayName = ""
			    Set diagnosisStatusCode = ""
			    Set diagnosisEncounterNumber = ""
            }
    }

    Quit $$$OK
}

ClassMethod InsertProceduresData(proceduresXml As %Stream.GlobalCharacter, documentID As %Integer, profileID As %String) As %Status
{
    Set proceduresString = proceduresXml.Read()
    Set textreader = ##class(%XML.TextReader).%New(1)
    Set status = ##class(%XML.TextReader).ParseString(proceduresString, .textreader)
    
    If $$$ISERR(status) {
        Do $System.Status.DisplayError(status)
        Quit status
    }

    Set procedureCode = ""
    Set procedureClassCode = ""
    Set moodCode = ""
    Set status = ""
    Set codeDisplayName = ""
    Set codeSystem = ""
    Set codeSystemName = ""
    Set effectiveTimeLow = ""
    Set effectiveTimeHigh = ""
    Set performerID = ""
    Set performerName = ""
    Set performerOrganization = ""
    Set performerAddress = ""
    Set authorTime = ""

    While textreader.Read()
    {
        If textreader.NodeType = "element" {
            If textreader.LocalName = "ProcedureCode" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set procedureCode = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "ProcedureClassCode" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set procedureClassCode = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "MoodCode" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set moodCode = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "Status" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set status = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "CodeDisplayName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set codeDisplayName = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "CodeSystem" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set codeSystem = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "CodeSystemName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set codeSystemName = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "EffectiveTimeLow" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set effectiveTimeLow = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "EffectiveTimeHigh" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set effectiveTimeHigh = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "PerformerID" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set performerID = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "PerformerName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set performerName = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "PerformerOrganization" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set performerOrganization = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "PerformerAddress" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set performerAddress = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "AuthorTime" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set authorTime = textreader.Value
                }
            }

        } ElseIf (textreader.LocalName = "Procedure") && (textreader.NodeType = "endelement") {
                Set document = ##class(LEADNorth.CDAProfiler.Sections.CCDDocument).%OpenId(documentID)
                If '$IsObject(document) {
                    Write "Document not found for ID: ", documentID, !
                    Continue
                }

                Set procedure = ##class(LEADNorth.CDAProfiler.Sections.CCDProcedure).%New()
                Set procedure.DocumentID = document
                Set procedure.ProcedureCode = procedureCode
                Set procedure.ProcedureClassCode = procedureClassCode
                Set procedure.MoodCode = moodCode
                Set procedure.Status = status
                Set procedure.CodeDisplayName = codeDisplayName
                Set procedure.CodeSystem = codeSystem
                Set procedure.CodeSystemName = codeSystemName
                Set procedure.EffectiveTimeLow = effectiveTimeLow
                Set procedure.EffectiveTimeHigh = effectiveTimeHigh
                Set procedure.PerformerID = performerID
                Set procedure.PerformerName = performerName
                Set procedure.PerformerOrganization = performerOrganization
                Set procedure.PerformerAddress = performerAddress
                Set procedure.AuthorTime = authorTime
                Set procedure.ProfileID = profileID

                Set saveStatus = procedure.%Save()
                If $$$ISERR(saveStatus) {
                    Write "Error saving procedure data.", !
                    Do $system.OBJ.DisplayError(saveStatus)
                    Continue
                } else {
	        		Do ..SectionStats(documentID, "Procedure")
        		}

                Set procedureCode = ""
                Set procedureClassCode = ""
                Set moodCode = ""
                Set statusCode = ""
                Set displayName = ""
                Set codeSystem = ""
                Set codeSystemName = ""
                Set effectiveTimeLow = ""
                Set effectiveTimeHigh = ""
                Set performerID = ""
                Set performerName = ""
                Set performerOrganization = ""
                Set performerAddress = ""
                Set authorTime = ""
            }
    }

    Quit $$$OK
}

ClassMethod InsertResultsData(resultsXml As %Stream.GlobalCharacter, documentID As %Integer, profileID As %String) As %Status
{
    Set resultsString = resultsXml.Read()
    Set textreader = ##class(%XML.TextReader).%New(1)
    Set status = ##class(%XML.TextReader).ParseString(resultsString, .textreader)

    If $$$ISERR(status) {
        Do $System.Status.DisplayError(status)
        Quit status
    }

    Set resultID = ""
    Set testValue = ""
    Set units = ""
    Set referenceRange = ""
    Set statusCode = ""
    Set observationCode = ""
    Set observationCodeDisplayName = ""
    Set observationCodeSystem = ""
    Set observationCodeSystemName = ""
    Set organizerID = ""
    Set organizerName = ""
    Set moodCode = ""
    Set effectiveTimeLow = ""
    Set effectiveTimeHigh = ""
    Set authorTime = ""

    While textreader.Read()
    {
        If textreader.NodeType = "element" {
            If textreader.LocalName = "ResultID" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set resultID = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "TestValue" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set testValue = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "Units" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set units = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "ReferenceRange" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set referenceRange = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "StatusCode" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set statusCode = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "ObservationCode" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set observationCode = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "ObservationCodeDisplayName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set observationCodeDisplayName = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "ObservationCodeSystem" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set observationCodeSystem = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "ObservationCodeSystemName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set observationCodeSystemName = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "OrganizerID" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set organizerID = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "OrganizerName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set organizerName = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "MoodCode" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set moodCode = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "EffectiveTimeLow" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set effectiveTimeLow = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "EffectiveTimeHigh" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set effectiveTimeHigh = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "AuthorTime" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set authorTime = textreader.Value
                }
            }

        } ElseIf (textreader.LocalName = "Result") && (textreader.NodeType = "endelement") {
            Set document = ##class(LEADNorth.CDAProfiler.Sections.CCDDocument).%OpenId(documentID)
            If '$IsObject(document) {
                Write "Document not found for ID: ", documentID, !
                Continue
            }
            Set result = ##class(LEADNorth.CDAProfiler.Sections.CCDResult).%New()
            Set result.DocumentID = document
            Set result.ResultID = resultID
            Set result.TestValue = testValue
            Set result.Units = units
            Set result.ReferenceRange = referenceRange
            Set result.StatusCode = statusCode
            Set result.ObservationCode = observationCode
            Set result.ObservationCodeDisplayName = observationCodeDisplayName
            Set result.ObservationCodeSystem = observationCodeSystem
            Set result.ObservationCodeSystemName = observationCodeSystemName
            Set result.OrganizerID = organizerID
            Set result.OrganizerName = organizerName
            Set result.MoodCode = moodCode
            Set result.EffectiveTimeLow = effectiveTimeLow
            Set result.EffectiveTimeHigh = effectiveTimeHigh
            Set result.AuthorTime = authorTime
            Set result.ProfileID = profileID

            Set saveStatus = result.%Save()
            If $$$ISERR(saveStatus) {
                Write "Error saving result data.", !
                Do $system.OBJ.DisplayError(saveStatus)
                Continue
            } else {
	        	Do ..SectionStats(documentID, "Result")
        	}

            Set resultID = ""
		    Set testValue = ""
		    Set units = ""
		    Set referenceRange = ""
		    Set statusCode = ""
		    Set procedureCode = ""
		    Set procedureCodeDisplayName = ""
		    Set procedureCodeSystem = ""
		    Set procedureCodeSystemName = ""
		    Set organizerID = ""
		    Set organizerName = ""
		    Set moodCode = ""
		    Set effectiveTimeLow = ""
		    Set effectiveTimeHigh = ""
		    Set authorTime = ""
        }
    }

    Quit $$$OK
}

ClassMethod InsertVitalSignsData(vitalSignsXml As %Stream.GlobalCharacter, documentID As %Integer, profileID As %String) As %Status
{
    Set vitalSignsString = vitalSignsXml.Read()

    Set textreader = ##class(%XML.TextReader).%New(1)
    Set status = ##class(%XML.TextReader).ParseString(vitalSignsString, .textreader)
    If $$$ISERR(status) {
        Do $System.Status.DisplayError(status)
        Quit status
    }
    Set xdate = ""
    Set value = ""
    Set unit = ""
    Set description = ""
    Set organizerClassCode = ""
    Set organizerMoodCode = ""
    Set organizerCode = ""
    Set organizerCodeSystem = ""
    Set organizerDisplayName = ""
    Set organizerStatusCode = ""
    Set organizerEffectiveTimeLow = ""
    Set organizerEffectiveTimeHigh = ""
    Set observationIDExtension = ""
    Set observationIDRoot = ""
    Set observationCode = ""
    Set observationCodeSystem = ""
    Set observationDisplayName = ""
    Set observationStatusCode = ""
    Set observationEffectiveTimeLow = ""
    Set observationEffectiveTimeHigh = ""
    Set authorTime = ""
    Set translationCode = ""
    Set translationCodeSystem = ""
    Set translationDisplayName = ""
    Set interpretationCode = ""
    Set methodCode = ""

    While textreader.Read()
    {
        //write !, "NodeType: ", textreader.NodeType, ", LocalName: ", textreader.LocalName
        If textreader.NodeType = "element" {
            If textreader.LocalName = "xDate" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set xdate = textreader.Value
                    //write textreader.Value, !, !, !
                }
            }
            ElseIf textreader.LocalName = "Value" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set value = textreader.Value
                    //write !, value
                }
            }
            ElseIf textreader.LocalName = "Unit" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set unit = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "Description" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set description = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "OrganizerClassCode" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set organizerClassCode = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "OrganizerMoodCode" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set organizerMoodCode = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "OrganizerCode" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set organizerCode = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "OrganizerCodeSystem" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set organizerCodeSystem = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "OrganizerDisplayName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set organizerDisplayName = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "OrganizerStatusCode" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set organizerStatusCode = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "EffectiveTimeLow" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set organizerEffectiveTimeLow = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "EffectiveTimeHigh" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set organizerEffectiveTimeHigh = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "ObservationCode" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set observationCode = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "ObservationCodeSystem" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set observationCodeSystem = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "ObservationDisplayName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set observationDisplayName = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "ObservationEffectiveTimeLow" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set observationEffectiveTimeLow = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "ObservationEffectiveTimeHigh" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set observationEffectiveTimeHigh = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "ObservationStatusCode" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set observationStatusCode = textreader.Value
                }
            }
        } ElseIf (textreader.NodeType = "endelement") && (textreader.LocalName = "VitalSign") {

                Set document = ##class(LEADNorth.CDAProfiler.Sections.CCDDocument).%OpenId(documentID)
                If '$IsObject(document) {
                    Write "Document not found for ID: ", documentID, !
                    Continue
                }

                Set vitalSign = ##class(LEADNorth.CDAProfiler.Sections.CCDVitalSign).%New()
                Set vitalSign.DocumentID = document
                Set vitalSign.xDate = xdate
                Set vitalSign.Value = value
                Set vitalSign.Unit = unit
                Set vitalSign.Description = description
                Set vitalSign.OrganizerClassCode = organizerClassCode
                Set vitalSign.OrganizerMoodCode = organizerMoodCode
                Set vitalSign.OrganizerCode = organizerCode
                Set vitalSign.OrganizerCodeSystem = organizerCodeSystem
                Set vitalSign.OrganizerDisplayName = organizerDisplayName
                Set vitalSign.OrganizerStatusCode = organizerStatusCode
                Set vitalSign.OrganizerEffectiveTimeLow = organizerEffectiveTimeLow
                Set vitalSign.OrganizerEffectiveTimeHigh = organizerEffectiveTimeHigh
                Set vitalSign.ObservationIDExtension = observationIDExtension
                Set vitalSign.ObservationIDRoot = observationIDRoot
                Set vitalSign.ObservationCode = observationCode
                Set vitalSign.ObservationCodeSystem = observationCodeSystem
                Set vitalSign.ObservationDisplayName = observationDisplayName
                Set vitalSign.ObservationStatusCode = observationStatusCode
                Set vitalSign.ObservationEffectiveTimeLow = observationEffectiveTimeLow
                Set vitalSign.ObservationEffectiveTimeHigh = observationEffectiveTimeHigh
                Set vitalSign.AuthorTime = authorTime
                Set vitalSign.TranslationCode = translationCode
                Set vitalSign.TranslationCodeSystem = translationCodeSystem
                Set vitalSign.TranslationDisplayName = translationCodeSystem
                Set vitalSign.InterpretationCode = interpretationCode
                Set vitalSign.MethodCode = methodCode
                Set vitalSign.ProfileID = profileID

                Set saveStatus = vitalSign.%Save()
                If $$$ISERR(saveStatus) {
                    Write "Error saving vital sign data.", !
                    Do $system.OBJ.DisplayError(saveStatus)
                    Continue
                } else {
	        		Do ..SectionStats(documentID, "VitalSign")
        		}

            Set date = ""
            Set value = ""
            Set unit = ""
            Set description = ""
            Set organizerClassCode = ""
            Set organizerMoodCode = ""
            Set organizerCode = ""
            Set organizerCodeSystem = ""
            Set organizerDisplayName = ""
            Set organizerStatusCode = ""
            Set organizerEffectiveTimeLow = ""
            Set organizerEffectiveTimeHigh = ""
            Set observationIDExtension = ""
            Set observationIDRoot = ""
            Set observationCode = ""
            Set observationCodeSystem = ""
            Set observationDisplayName = ""
            Set observationStatusCode = ""
            Set observationEffectiveTimeLow = ""
            Set observationEffectiveTimeHigh = ""
            Set authorTime = ""
            Set translationCode = ""
            Set translationCodeSystem = ""
            Set translationDisplayName = ""
            Set interpretationCode = ""
            Set methodCode = ""
        }
    }

    Quit $$$OK
}

ClassMethod InsertImmunizationData(immunizationXml As %Stream.GlobalCharacter, documentID As %Integer, profileID As %String) As %Status
{
    Set immunizationString = immunizationXml.Read()
    Set textreader = ##class(%XML.TextReader).%New(1)
    Set status = ##class(%XML.TextReader).ParseString(immunizationString, .textreader)
    If $$$ISERR(status) {
        Do $System.Status.DisplayError(status)
        Quit status
    }

    Set immunizationID = ""
    Set route = ""
    Set dose = ""
    Set doseUnit = ""
    Set vaccine = ""
    Set vaccineCode = ""
    Set vaccineCodeSystem = ""
    Set vaccineCodeSystemName = ""
    Set lotNumber = ""
    Set startDate = ""
    Set endDate = ""
    Set performerID = ""
    Set performerAddress = ""
    Set performerCity = ""
    Set performerState = ""
    Set performerPostalCode = ""
    Set statusCode = ""
    Set nullFlavor = ""

    While textreader.Read()
    {
        If textreader.NodeType = "element" {
            If textreader.LocalName = "ImmunizationID" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set immunizationID = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "Route" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set route = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "Dose" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set dose = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "DoseUnit" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set doseUnit = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "Vaccine" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set vaccine = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "VaccineCode" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set vaccineCode = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "VaccineCodeSystem" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set vaccineCodeSystem = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "VaccineCodeSystemName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set vaccineCodeSystemName = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "LotNumber" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set lotNumber = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "StartDate" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set startDate = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "EndDate" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set endDate = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "PerformerID" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set performerID = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "PerformerAddress" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set performerAddress = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "PerformerCity" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set performerCity = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "PerformerState" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set performerState = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "PerformerPostalCode" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set performerPostalCode = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "StatusCode" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set statusCode = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "NullFlavor" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set nullFlavor = textreader.Value
                }
            }
        }
        ElseIf (textreader.LocalName = "Immunization") && (textreader.NodeType = "endelement") {
	        Set document = ##class(LEADNorth.CDAProfiler.Sections.CCDDocument).%OpenId(documentID)
                If '$IsObject(document) {
                    Write "Document not found for ID: ", documentID, !
                    Continue
                }
            Set immunization = ##class(LEADNorth.CDAProfiler.Sections.CCDImmunization).%New()
            Set immunization.ImmunizationID = immunizationID
            Set immunization.DocumentID = document
            Set immunization.Route = route
            Set immunization.Dose = dose
            Set immunization.DoseUnit = doseUnit
            Set immunization.Vaccine = vaccine
            Set immunization.VaccineCode = vaccineCode
            Set immunization.VaccineCodeSystem = vaccineCodeSystem
            Set immunization.VaccineCodeSystemName = vaccineCodeSystemName
            Set immunization.LotNumber = lotNumber
            Set immunization.StartDate = startDate
            Set immunization.EndDate = endDate
            Set immunization.PerformerID = performerID
            Set immunization.PerformerAddress = performerAddress
            Set immunization.PerformerCity = performerCity
            Set immunization.PerformerState = performerState
            Set immunization.PerformerPostalCode = performerPostalCode
            Set immunization.StatusCode = statusCode
            Set immunization.NullFlavor = nullFlavor
            Set immunization.ProfileID = profileID

            Set saveStatus = immunization.%Save()
            If $$$ISERR(saveStatus) {
                Write "Error saving immunization data.", !
                Continue
            } else {
	        	Do ..SectionStats(documentID, "Immunization")
        	}

            Set immunizationID = ""
            Set route = ""
            Set dose = ""
            Set doseUnit = ""
            Set vaccine = ""
            Set vaccineCode = ""
            Set vaccineCodeSystem = ""
            Set vaccineCodeSystemName = ""
            Set lotNumber = ""
            Set startDate = ""
            Set endDate = ""
            Set performerID = ""
            Set performerAddress = ""
            Set performerCity = ""
            Set performerState = ""
            Set performerPostalCode = ""
            Set statusCode = ""
            Set nullFlavor = ""
        }
    }

    Quit $$$OK
}

ClassMethod InsertPlanOfCareData(planOfCareXml As %Stream.GlobalCharacter, documentID As %Integer, profileID As %String) As %Status
{
    Set planOfCareString = planOfCareXml.Read()
    Set textreader = ##class(%XML.TextReader).%New(1)
    Set status = ##class(%XML.TextReader).ParseString(planOfCareString, .textreader)
    
    If $$$ISERR(status) {
        Do $System.Status.DisplayError(status)
        Quit status
    }

    Set encounterID = ""
    Set encounterExtension = ""
    Set displayName = ""
    Set statusCode = ""
    Set effectiveTimeLow = ""
    Set effectiveTimeHigh = ""
    Set performerID = ""
    Set performerOrganization = ""
    Set performerAddress = ""
    Set performerCity = ""
    Set performerState = ""
    Set performerPostalCode = ""
    Set authorTime = ""

    While textreader.Read()
    {
        If textreader.NodeType = "element" {
            If textreader.LocalName = "EncounterID" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set encounterID = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "EncounterExtension" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set encounterExtension = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "DisplayName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set displayName = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "StatusCode" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set statusCode = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "EffectiveTimeLow" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set effectiveTimeLow = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "EffectiveTimeHigh" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set effectiveTimeHigh = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "PerformerID" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set performerID = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "PerformerOrganization" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set performerOrganization = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "PerformerAddress" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set performerAddress = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "PerformerCity" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set performerCity = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "PerformerState" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set performerState = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "PerformerPostalCode" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set performerPostalCode = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "AuthorTime" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set authorTime = textreader.Value
                }
            }

            If textreader.LocalName = "PlanEntry" {
                Set document = ##class(LEADNorth.CDAProfiler.Sections.CCDDocument).%OpenId(documentID)
                If '$IsObject(document) {
                    Write "Document not found for ID: ", documentID, !
                    Continue
                }

                Set planOfCare = ##class(LEADNorth.CDAProfiler.Sections.CCDPlanOfCare).%New()
                Set planOfCare.DocumentID = document
                Set planOfCare.EncounterID = encounterID
                Set planOfCare.EncounterExtension = encounterExtension
                Set planOfCare.DisplayName = displayName
                Set planOfCare.StatusCode = statusCode
                Set planOfCare.EffectiveTimeLow = effectiveTimeLow
                Set planOfCare.EffectiveTimeHigh = effectiveTimeHigh
                Set planOfCare.PerformerID = performerID
                Set planOfCare.PerformerOrganization = performerOrganization
                Set planOfCare.PerformerAddress = performerAddress
                Set planOfCare.PerformerCity = performerCity
                Set planOfCare.PerformerState = performerState
                Set planOfCare.PerformerPostalCode = performerPostalCode
                Set planOfCare.AuthorTime = authorTime
                Set planOfCare.ProfileID = profileID

                Set saveStatus = planOfCare.%Save()
                If $$$ISERR(saveStatus) {
                    Write "Error saving plan of care data.", !
                    Do $system.OBJ.DisplayError(saveStatus)
                    Continue
                } else {
	        		Do ..SectionStats(documentID, "PlanOfCare")
        		}

                Set encounterID = ""
                Set encounterExtension = ""
                Set displayName = ""
                Set statusCode = ""
                Set effectiveTimeLow = ""
                Set effectiveTimeHigh = ""
                Set performerID = ""
                Set performerOrganization = ""
                Set performerAddress = ""
                Set performerCity = ""
                Set performerState = ""
                Set performerPostalCode = ""
                Set authorTime = ""
            }
        }
    }

    Quit $$$OK
}

ClassMethod InsertSocialHistoryData(socialHistoryXml As %Stream.GlobalCharacter, documentID As %Integer, profileID As %String) As %Status
{
    Set socialHistoryString = socialHistoryXml.Read()
    Set textreader = ##class(%XML.TextReader).%New(1)
    Set status = ##class(%XML.TextReader).ParseString(socialHistoryString, .textreader)

    If $$$ISERR(status) {
        Do $System.Status.DisplayError(status)
        Quit status
    }

    Set socialHistoryID = ""
    Set conceptDescription = ""
    Set observationCode = ""
    Set observationCodeSystem = ""
    Set observationCodeSystemName = ""
    Set observationDisplayName = ""
    Set valueCode = ""
    Set valueCodeSystem = ""
    Set valueCodeSystemName = ""
    Set valueDisplayName = ""
    Set units = ""
    Set statusCode = ""
    Set observationIDExtension = ""
    Set observationIDRoot = ""
    Set authorTime = ""
    Set effectiveTimeLow = ""
    Set effectiveTimeHigh = ""

    While textreader.Read()
    {
        If textreader.NodeType = "element" {
            If textreader.LocalName = "SocialHistoryID" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set socialHistoryID = textreader.Value
                }
            } ElseIf textreader.LocalName = "ConceptDescription" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set conceptDescription = textreader.Value
                }
            } ElseIf textreader.LocalName = "ObservationCode" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set observationCode = textreader.Value
                }
            } ElseIf textreader.LocalName = "ObservationCodeSystem" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set observationCodeSystem = textreader.Value
                }
            } ElseIf textreader.LocalName = "ObservationCodeSystemName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set observationCodeSystemName = textreader.Value
                }
            } ElseIf textreader.LocalName = "ObservationDisplayName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set observationDisplayName = textreader.Value
                }
            } ElseIf textreader.LocalName = "ValueCode" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set valueCode = textreader.Value
                }
            } ElseIf textreader.LocalName = "ValueCodeSystem" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set valueCodeSystem = textreader.Value
                }
            } ElseIf textreader.LocalName = "ValueCodeSystemName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set valueCodeSystemName = textreader.Value
                }
            } ElseIf textreader.LocalName = "ValueDisplayName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set valueDisplayName = textreader.Value
                }
            } ElseIf textreader.LocalName = "Units" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set units = textreader.Value
                }
            } ElseIf textreader.LocalName = "StatusCode" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set statusCode = textreader.Value
                }
            } ElseIf textreader.LocalName = "ObservationIDExtension" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set observationIDExtension = textreader.Value
                }
            } ElseIf textreader.LocalName = "ObservationIDRoot" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set observationIDRoot = textreader.Value
                }
            } ElseIf textreader.LocalName = "AuthorTime" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set authorTime = textreader.Value
                }
            } ElseIf textreader.LocalName = "EffectiveTimeLow" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set effectiveTimeLow = textreader.Value
                }
            } ElseIf textreader.LocalName = "EffectiveTimeHigh" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set effectiveTimeHigh = textreader.Value
                }
            }
        } ElseIf (textreader.LocalName = "SocialHistoryItem") && (textreader.NodeType = "endelement") {
            Set document = ##class(LEADNorth.CDAProfiler.Sections.CCDDocument).%OpenId(documentID)
            If '$IsObject(document) {
                Write "Document not found for ID: ", documentID, !
                Continue
            }

            Set socialHistory = ##class(LEADNorth.CDAProfiler.Sections.CCDSocialHistory).%New()
            Set socialHistory.SocialHistoryID = socialHistoryID
            Set socialHistory.DocumentID = document
            Set socialHistory.ConceptDescription = conceptDescription
            Set socialHistory.ObservationCode = observationCode
            Set socialHistory.ObservationCodeSystem = observationCodeSystem
            Set socialHistory.ObservationCodeSystemName = observationCodeSystemName
            Set socialHistory.ObservationDisplayName = observationDisplayName
            Set socialHistory.ValueCode = valueCode
            Set socialHistory.ValueCodeSystem = valueCodeSystem
            Set socialHistory.ValueCodeSystemName = valueCodeSystemName
            Set socialHistory.ValueDisplayName = valueDisplayName
            Set socialHistory.Units = units
            Set socialHistory.StatusCode = statusCode
            Set socialHistory.ObservationIDExtension = observationIDExtension
            Set socialHistory.ObservationIDRoot = observationIDRoot
            Set socialHistory.AuthorTime = authorTime
            Set socialHistory.EffectiveTimeLow = effectiveTimeLow
            Set socialHistory.EffectiveTimeHigh = effectiveTimeHigh
            Set socialHistory.ProfileID = profileID

            Set saveStatus = socialHistory.%Save()
            If $$$ISERR(saveStatus) {
                Write "Error saving social history data.", !
                Do $System.OBJ.DisplayError(saveStatus)
                Continue
            } else {
	        	Do ..SectionStats(documentID, "SocialHistory")
        	}
        }
    }
	
    Quit $$$OK
}

ClassMethod InsertFunctionalStatusData(functionalStatusXml As %Stream.GlobalCharacter, documentID As %Integer, profileID As %String) As %Status
{
    Set functionalStatusString = functionalStatusXml.Read()
    Set textreader = ##class(%XML.TextReader).%New(1)
    Set status = ##class(%XML.TextReader).ParseString(functionalStatusString, .textreader)
    
    If $$$ISERR(status) {
        Do $System.Status.DisplayError(status)
        Quit status
    }

    Set status = ""
    Set xdate = ""
    Set description = ""
    Set statusCode = ""
    Set observationCode = ""
    Set observationSystem = ""
    Set effectiveTime = ""

    While textreader.Read()
    {
        If textreader.NodeType = "element" {
            If textreader.LocalName = "Status" {
                Set status = textreader.Read()  
                If textreader.NodeType = "chars" {
                    Set status = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "xDate" {
                Set status = textreader.Read()  
                If textreader.NodeType = "chars" {
                    Set xdate = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "Description" {
                Set status = textreader.Read()  
                If textreader.NodeType = "chars" {
                    Set description = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "StatusCode" {
                Set status = textreader.Read()  
                If textreader.NodeType = "chars" {
                    Set statusCode = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "ObservationCode" {
                Set status = textreader.Read()  
                If textreader.NodeType = "chars" {
                    Set observationCode = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "ObservationSystem" {
                Set status = textreader.Read()  
                If textreader.NodeType = "chars" {
                    Set observationSystem = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "EffectiveTime" {
                Set status = textreader.Read()  
                If textreader.NodeType = "chars" {
                    Set effectiveTime = textreader.Value
                }
            }
        }
    }

    Set document = ##class(LEADNorth.CDAProfiler.Sections.CCDDocument).%OpenId(documentID)
    If '$IsObject(document) {
        Write "Document not found for ID: ", documentID, !
        Quit $$$ERROR($$$GeneralError, "Document not found.")
    }

    Set functionalStatus = ##class(LEADNorth.CDAProfiler.Sections.CCDFunctionalStatus).%New()
    Set functionalStatus.DocumentID = document
    Set functionalStatus.Status = status
    Set functionalStatus.xDate = xdate
    Set functionalStatus.Description = description
    Set functionalStatus.StatusCode = statusCode
    Set functionalStatus.ObservationCode = observationCode
    Set functionalStatus.ObservationSystem = observationSystem
    Set functionalStatus.EffectiveTime = effectiveTime
    Set functionalStatus.ProfileID = profileID

    Set saveStatus = functionalStatus.%Save()
    If $$$ISERR(saveStatus) {
        Write "Error saving functional status data.", !
        Do $system.OBJ.DisplayError(saveStatus)
        Quit saveStatus
    } else {
	    Do ..SectionStats(documentID, "FunctionalStatus")
    }
    
    Quit $$$OK
}

ClassMethod InsertFamilyHistoryData(familyHistoryXml As %Stream.GlobalCharacter, documentID As %Integer, profileID As %String) As %Status
{
    Set familyHistoryString = familyHistoryXml.Read()
    Set textreader = ##class(%XML.TextReader).%New(1)
    Set status = ##class(%XML.TextReader).ParseString(familyHistoryString, .textreader)

    If $$$ISERR(status) {
        Do $System.Status.DisplayError(status)
        Quit status
    }

    Set relativePerson = ""
    Set onsetAge = ""
    Set statusCode = ""
    Set observationCode = ""
    Set observationSystem = ""
    Set relativeCode = ""
    Set relativeCodeSystem = ""
    Set observationDisplayName = ""
    Set observationID = ""
    Set observationIDOid = ""

    While textreader.Read()
    {
        If textreader.NodeType = "element" {
            If textreader.LocalName = "RelativePerson" {
                Set status = textreader.Read()  
                If textreader.NodeType = "chars" {
                    Set relativePerson = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "OnsetAge" {
                Set status = textreader.Read()  
                If textreader.NodeType = "chars" {
                    Set onsetAge = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "StatusCode" {
                Set status = textreader.Read()  
                If textreader.NodeType = "chars" {
                    Set statusCode = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "ObservationCode" {
                Set status = textreader.Read()  
                If textreader.NodeType = "chars" {
                    Set observationCode = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "ObservationSystem" {
                Set status = textreader.Read()  
                If textreader.NodeType = "chars" {
                    Set observationSystem = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "RelativeCode" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set relativeCode = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "RelativeCodeSystem" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set relativeCodeSystem = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "ObservationDisplayName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set observationDisplayName = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "ObservationID" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set observationID = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "ObservationIDOid" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set observationIDOid = textreader.Value
                }
            }
        }
        ElseIf (textreader.LocalName = "FamilyHistory") && (textreader.NodeType = "endelement") {
            Set document = ##class(LEADNorth.CDAProfiler.Sections.CCDDocument).%OpenId(documentID)
            If '$IsObject(document) {
                Write "Document not found for ID: ", documentID, !
                Continue
            }

            Set familyHistory = ##class(LEADNorth.CDAProfiler.Sections.CCDFamilyHistory).%New()
            Set familyHistory.DocumentID = document
            Set familyHistory.RelativePerson = relativePerson
            Set familyHistory.OnsetAge = onsetAge
            Set familyHistory.StatusCode = statusCode
            Set familyHistory.ObservationCode = observationCode
            Set familyHistory.ObservationSystem = observationSystem
            Set familyHistory.RelativeCode = relativeCode
            Set familyHistory.RelativeCodeSystem = relativeCodeSystem
            Set familyHistory.ObservationDisplayName = observationDisplayName
            Set familyHistory.ObservationID = observationID
            Set familyHistory.ObservationIDOid = observationIDOid
            Set familyHistory.ProfileID = profileID

            Set saveStatus = familyHistory.%Save()
            If $$$ISERR(saveStatus) {
                Write "Error saving family history data.", !
                Do $system.OBJ.DisplayError(saveStatus)
                Continue
            } else {
	        	Do ..SectionStats(documentID, "FamilyHistory")
        	}

            Set relativePerson = ""
            Set onsetAge = ""
            Set statusCode = ""
            Set observationCode = ""
            Set observationSystem = ""
            Set relativeCode = ""
            Set relativeCodeSystem = ""
            Set observationDisplayName = ""
            Set observationID = ""
            Set observationIDOid = ""
        }
    }

    Quit $$$OK
}

ClassMethod InsertAdvanceDirectiveData(advanceDirectiveXml As %Stream.GlobalCharacter, documentID As %Integer, profileID As %String) As %Status
{
    Set advanceDirectiveString = advanceDirectiveXml.Read()
    Set textreader = ##class(%XML.TextReader).%New(1)
    //Write !, "Advance Directive String: ", advanceDirectiveString, !
    Set status = ##class(%XML.TextReader).ParseString(advanceDirectiveString, .textreader)

    If $$$ISERR(status) {
        Do $System.Status.DisplayError(status)
        Quit status
    }
    Set directiveType = ""
    Set dateSigned = ""
    Set statusCode = ""
    Set directiveID = ""

    While textreader.Read()
    {
        If textreader.NodeType = "element" {
            If textreader.LocalName = "DirectiveType" {
                Set status = textreader.Read()  
                If textreader.NodeType = "chars" {
                    Set directiveType = textreader.Value
                    //Write !, "DirectiveType: ", directiveType, !
                }
            }
            ElseIf textreader.LocalName = "DateSigned" {
                Set status = textreader.Read()  
                If textreader.NodeType = "chars" {
                    Set dateSigned = textreader.Value
                    //Write !, "DateSigned: ", dateSigned, !
                }
            }
            ElseIf textreader.LocalName = "StatusCode" {
                Set status = textreader.Read()  
                If textreader.NodeType = "chars" {
                    Set statusCode = textreader.Value
                    //Write !, "StatusCode: ", statusCode, !
                }
            }
            ElseIf textreader.LocalName = "DirectiveID" {
                Set status = textreader.Read()  
                If textreader.NodeType = "chars" {
                    Set directiveID = textreader.Value
                    //Write !, "DirectiveID: ", directiveID, !
                }
            }
        } ElseIf (textreader.LocalName = "AdvanceDirective") && (textreader.NodeType = "endelement") {
                Set document = ##class(LEADNorth.CDAProfiler.Sections.CCDDocument).%OpenId(documentID)
                If '$IsObject(document) {
                    Write "Document not found for ID: ", documentID, !
                    Continue
                }

                //Write !, "Saving Advance Directive: ", directiveType, " | ", dateSigned, " | ", statusCode, " | ", directiveID, !

                Set advanceDirective = ##class(LEADNorth.CDAProfiler.Sections.CCDAdvanceDirective).%New()
                Set advanceDirective.DocumentID = document
                Set advanceDirective.DirectiveType = directiveType
                Set advanceDirective.DateSigned = dateSigned
                Set advanceDirective.StatusCode = statusCode
                Set advanceDirective.DirectiveID = directiveID
                Set advanceDirective.ProfileID = profileID

                Set saveStatus = advanceDirective.%Save()
                If $$$ISERR(saveStatus) {
                    Write "Error saving advance directive data.", !
                    Do $system.OBJ.DisplayError(saveStatus)
                    Continue
                } else {
	        		Do ..SectionStats(documentID, "AdvanceDirective")
        		}

                //Write !, "Advance Directive saved successfully!", !
            
        }
    }

    Quit $$$OK
}

ClassMethod InsertEncounterData(encounterXml As %Stream.GlobalCharacter, documentID As %Integer, profileID As %String) As %Status
{
    Set encounterString = encounterXml.Read()
    Set textreader = ##class(%XML.TextReader).%New(1)
    
    Set status = ##class(%XML.TextReader).ParseString(encounterString, .textreader)
    If $$$ISERR(status) {
        Do $System.Status.DisplayError(status)
        Quit status
    }

    Set encounterNumber = ""
    Set encounterTypeDisplayName = ""
    Set encounterTypeCode = ""
    Set encounterTypeCodeSystem = ""
    Set encounterTypeCodeSystemName = ""
    Set reasonForVisit = ""
    Set visitDescription = ""
    Set statusCode = ""
    Set startDateTime = ""
    Set endDateTime = ""
    Set dischargeDisposition = ""
    Set facilityName = ""
    Set facilityIDAAName = ""
    Set facilityIDExtension = ""
    Set facilityIDRoot = ""
    Set performerID = ""
    Set performerAddress = ""
    Set performerTelecom = ""
    Set performerName = ""
    Set authorTime = ""
    Set locationID = ""
    Set locationAddress = ""
    Set locationTelecom = ""
    Set locationName = ""

    While textreader.Read() {
        If textreader.NodeType = "element" {
            If textreader.LocalName = "EncounterNumber" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set encounterNumber = textreader.Value
                }
            } ElseIf textreader.LocalName = "EncounterTypeDisplayName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set encounterTypeDisplayName = textreader.Value
                }
            } ElseIf textreader.LocalName = "EncounterTypeCode" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set encounterTypeCode = textreader.Value
                }
            } ElseIf textreader.LocalName = "EncounterTypeCodeSystem" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set encounterTypeCodeSystem = textreader.Value
                }
            } ElseIf textreader.LocalName = "EncounterTypeCodeSystemName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set encounterTypeCodeSystemName = textreader.Value
                }
            } ElseIf textreader.LocalName = "ReasonForVisit" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set reasonForVisit = textreader.Value
                }
            } ElseIf textreader.LocalName = "VisitDescription" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set visitDescription = textreader.Value
                }
            } ElseIf textreader.LocalName = "StatusCode" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set statusCode = textreader.Value
                }
            } ElseIf textreader.LocalName = "StartDateTime" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set startDateTime = textreader.Value
                }
            } ElseIf textreader.LocalName = "EndDateTime" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set endDateTime = textreader.Value
                }
            } ElseIf textreader.LocalName = "DischargeDisposition" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set dischargeDisposition = textreader.Value
                }
            } ElseIf textreader.LocalName = "FacilityName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set facilityName = textreader.Value
                }
            } ElseIf textreader.LocalName = "FacilityIDAAName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set facilityIDAAName = textreader.Value
                }
            } ElseIf textreader.LocalName = "FacilityIDExtension" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set facilityIDExtension = textreader.Value
                }
            } ElseIf textreader.LocalName = "FacilityIDRoot" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set facilityIDRoot = textreader.Value
                }
            } ElseIf textreader.LocalName = "PerformerID" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set performerID = textreader.Value
                }
            } ElseIf textreader.LocalName = "PerformerAddress" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set performerAddress = textreader.Value
                }
            } ElseIf textreader.LocalName = "PerformerTelecom" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set performerTelecom = textreader.Value
                }
            } ElseIf textreader.LocalName = "PerformerName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set performerName = textreader.Value
                }
            } ElseIf textreader.LocalName = "AuthorTime" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set authorTime = textreader.Value
                }
            } ElseIf textreader.LocalName = "LocationID" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set locationID = textreader.Value
                }
            } ElseIf textreader.LocalName = "LocationAddress" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set locationAddress = textreader.Value
                }
            } ElseIf textreader.LocalName = "LocationTelecom" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set locationTelecom = textreader.Value
                }
            } ElseIf textreader.LocalName = "LocationName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set locationName = textreader.Value
                }
            }
        } ElseIf (textreader.LocalName = "Encounter") && (textreader.NodeType = "endelement") {
            Set document = ##class(LEADNorth.CDAProfiler.Sections.CCDDocument).%OpenId(documentID)
            If '$IsObject(document) {
                Write "Document not found for ID: ", documentID, !
                Continue
            }

            Set encounter = ##class(LEADNorth.CDAProfiler.Sections.CCDEncounter).%New()
            If '$IsObject(encounter) {
                Write "Failed to create Encounter object", !
                Continue
            }

            Set encounter.EncounterNumber = encounterNumber
            Set encounter.DocumentID = document
            Set encounter.EncounterTypeDisplayName = encounterTypeDisplayName
            Set encounter.EncounterTypeCode = encounterTypeCode
            Set encounter.EncounterTypeCodeSystem = encounterTypeCodeSystem
            Set encounter.EncounterTypeCodeSystemName = encounterTypeCodeSystemName
            Set encounter.ReasonForVisit = reasonForVisit
            Set encounter.VisitDescription = visitDescription
            Set encounter.StatusCode = statusCode
            Set encounter.StartDateTime = startDateTime
            Set encounter.EndDateTime = endDateTime
            Set encounter.DischargeDisposition = dischargeDisposition
            Set encounter.FacilityName = facilityName
            Set encounter.FacilityIDAAName = facilityIDAAName
            Set encounter.FacilityIDExtension = facilityIDExtension
            Set encounter.FacilityIDRoot = facilityIDRoot
            Set encounter.PerformerID = performerID
            Set encounter.PerformerAddress = performerAddress
            Set encounter.PerformerTelecom = performerTelecom
            Set encounter.PerformerName = performerName
            Set encounter.AuthorTime = authorTime
            Set encounter.LocationID = locationID
            Set encounter.LocationAddress = locationAddress
            Set encounter.LocationTelecom = locationTelecom
            Set encounter.LocationName = locationName
            Set encounter.ProfileID = profileID

            Set saveStatus = encounter.%Save()
            If $$$ISERR(saveStatus) {
                Write "Error saving Encounter data.", !
                Do $system.OBJ.DisplayError(saveStatus)
                Continue
            } else {
	        	Do ..SectionStats(documentID, "Encounter")
        	}

            Set encounterNumber = ""
            Set encounterTypeDisplayName = ""
            Set encounterTypeCode = ""
            Set encounterTypeCodeSystem = ""
            Set encounterTypeCodeSystemName = ""
            Set reasonForVisit = ""
            Set visitDescription = ""
            Set statusCode = ""
            Set startDateTime = ""
            Set endDateTime = ""
            Set dischargeDisposition = ""
            Set facilityName = ""
            Set facilityIDAAName = ""
            Set facilityIDExtension = ""
            Set facilityIDRoot = ""
            Set performerID = ""
            Set performerAddress = ""
            Set performerTelecom = ""
            Set performerName = ""
            Set authorTime = ""
            Set locationID = ""
            Set locationAddress = ""
            Set locationTelecom = ""
            Set locationName = ""
        }
    }

    Quit $$$OK
}

ClassMethod InsertGoalsData(goalsXml As %Stream.GlobalCharacter, documentID As %Integer, profileID As %String) As %Status
{
    Set goalsString = goalsXml.Read()
    Set textreader = ##class(%XML.TextReader).%New(1)
    Set status = ##class(%XML.TextReader).ParseString(goalsString, .textreader)
    
    If $$$ISERR(status) {
        Do $System.Status.DisplayError(status)
        Quit status
    }

    Set goalID = ""
    Set goalDescription = ""
    Set goalCode = ""
    Set goalCodeSystem = ""
    Set goalCodeSystemName = ""
    Set goalStatus = ""
    Set startDate = ""
    Set endDate = ""
    Set authorTime = ""
    Set authorName = ""

    While textreader.Read()
    {
        If textreader.NodeType = "element" {
            If textreader.LocalName = "GoalID" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set goalID = textreader.Value
                }
            } ElseIf textreader.LocalName = "GoalDescription" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set goalDescription = textreader.Value
                }
            } ElseIf textreader.LocalName = "GoalCode" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set goalCode = textreader.Value
                }
            } ElseIf textreader.LocalName = "GoalCodeSystem" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set goalCodeSystem = textreader.Value
                }
            } ElseIf textreader.LocalName = "GoalCodeSystemName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set goalCodeSystemName = textreader.Value
                }
            } ElseIf textreader.LocalName = "GoalStatus" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set goalStatus = textreader.Value
                }
            } ElseIf textreader.LocalName = "StartDate" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set startDate = textreader.Value
                }
            } ElseIf textreader.LocalName = "EndDate" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set endDate = textreader.Value
                }
            } ElseIf textreader.LocalName = "AuthorTime" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set authorTime = textreader.Value
                }
            } ElseIf textreader.LocalName = "AuthorName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set authorName = textreader.Value
                }
            }
        } ElseIf (textreader.LocalName = "Goal") && (textreader.NodeType = "endelement") {
            Set document = ##class(LEADNorth.CDAProfiler.Sections.CCDDocument).%OpenId(documentID)
            If '$IsObject(document) {
                Write "Document not found for ID: ", documentID, !
                Continue
            }
            
            Set goal = ##class(LEADNorth.CDAProfiler.Sections.CCDGoals).%New()
            Set goal.DocumentID = document
            Set goal.GoalID = goalID
            Set goal.GoalDescription = goalDescription
            Set goal.GoalCode = goalCode
            Set goal.GoalCodeSystem = goalCodeSystem
            Set goal.GoalCodeSystemName = goalCodeSystemName
            Set goal.GoalStatus = goalStatus
            Set goal.StartDate = startDate
            Set goal.EndDate = endDate
            Set goal.AuthorTime = authorTime
            Set goal.AuthorName = authorName
            Set goal.ProfileID = profileID

            Set saveStatus = goal.%Save()
            If $$$ISERR(saveStatus) {
                Write "Error saving goal data.", !
                Do $system.OBJ.DisplayError(saveStatus)
                Continue
            } else {
	        Do ..SectionStats(documentID, "Goals")
        	}

            Set goalID = ""
		    Set goalDescription = ""
		    Set goalCode = ""
		    Set goalCodeSystem = ""
		    Set goalCodeSystemName = ""
		    Set goalStatus = ""
		    Set startDate = ""
		    Set endDate = ""
		    Set authorTime = ""
		    Set authorName = ""
        }
    }
	
    Quit $$$OK
}

ClassMethod InsertEncompassingEncounterData(encounterXml As %Stream.GlobalCharacter, documentID As %Integer, profileID As %String) As %Status
{
    Set encounterString = encounterXml.Read()
    Set textreader = ##class(%XML.TextReader).%New(1)
    Set status = ##class(%XML.TextReader).ParseString(encounterString, .textreader)
    //write !, encounterString, !
    If $$$ISERR(status) {
        Do $System.Status.DisplayError(status)
        Quit status
    }

    Set encounterID = ""
    Set encounterTypeDisplayName = ""
    Set encounterTypeCode = ""
    Set encounterTypeCodeSystem = ""
    Set encounterTypeCodeSystemName = ""
    Set startDateTime = ""
    Set endDateTime = ""
    Set dischargeDisposition = ""
    Set locationID = ""
    Set locationName = ""
    Set locationAddress = ""
    Set locationTelecom = ""
    Set authorTime = ""

    While textreader.Read()
    {
        If textreader.NodeType = "element" {
            If textreader.LocalName = "EncounterID" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set encounterID = textreader.Value
                }
            } ElseIf textreader.LocalName = "EncounterTypeDisplayName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set encounterTypeDisplayName = textreader.Value
                }
            } ElseIf textreader.LocalName = "EncounterTypeCode" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set encounterTypeCode = textreader.Value
                }
            } ElseIf textreader.LocalName = "EncounterTypeCodeSystem" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set encounterTypeCodeSystem = textreader.Value
                }
            } ElseIf textreader.LocalName = "EncounterTypeCodeSystemName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set encounterTypeCodeSystemName = textreader.Value
                }
            } ElseIf textreader.LocalName = "StartDateTime" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set startDateTime = textreader.Value
                }
            } ElseIf textreader.LocalName = "EndDateTime" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set endDateTime = textreader.Value
                }
            } ElseIf textreader.LocalName = "DischargeDisposition" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set dischargeDisposition = textreader.Value
                }
            } ElseIf textreader.LocalName = "LocationID" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set locationID = textreader.Value
                }
            } ElseIf textreader.LocalName = "LocationName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set locationName = textreader.Value
                }
            } ElseIf textreader.LocalName = "LocationAddress" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set locationAddress = textreader.Value
                }
            } ElseIf textreader.LocalName = "LocationTelecom" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set locationTelecom = textreader.Value
                }
            } ElseIf textreader.LocalName = "AuthorTime" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set authorTime = textreader.Value
                }
            }
        } ElseIf (textreader.LocalName = "EncompassingEncounter") && (textreader.NodeType = "endelement") {
            Set document = ##class(LEADNorth.CDAProfiler.Sections.CCDDocument).%OpenId(documentID)
            If '$IsObject(document) {
                Write "Document not found for ID: ", documentID, !
                Continue
            }
            
            Set encounter = ##class(LEADNorth.CDAProfiler.Sections.CCDEncompassingEncounter).%New()
            Set encounter.DocumentID = document
            Set encounter.EncounterID = encounterID
            Set encounter.EncounterTypeDisplayName = encounterTypeDisplayName
            Set encounter.EncounterTypeCode = encounterTypeCode
            Set encounter.EncounterTypeCodeSystem = encounterTypeCodeSystem
            Set encounter.EncounterTypeCodeSystemName = encounterTypeCodeSystemName
            Set encounter.StartDateTime = startDateTime
            Set encounter.EndDateTime = endDateTime
            Set encounter.DischargeDisposition = dischargeDisposition
            Set encounter.LocationID = locationID
            Set encounter.LocationName = locationName
            Set encounter.LocationAddress = locationAddress
            Set encounter.LocationTelecom = locationTelecom
            Set encounter.AuthorTime = authorTime
            Set encounter.ProfileID = profileID

            Set saveStatus = encounter.%Save()
            If $$$ISERR(saveStatus) {
                Write "Error saving encompassing encounter data.", !
                Do $system.OBJ.DisplayError(saveStatus)
                Continue
            } else {
	        Do ..SectionStats(documentID, "EncompassingEncounters")
        }

            Set encounterID = ""
		    Set encounterTypeDisplayName = ""
		    Set encounterTypeCode = ""
		    Set encounterTypeCodeSystem = ""
		    Set encounterTypeCodeSystemName = ""
		    Set startDateTime = ""
		    Set endDateTime = ""
		    Set dischargeDisposition = ""
		    Set locationID = ""
		    Set locationName = ""
		    Set locationAddress = ""
		    Set locationTelecom = ""
		    Set authorTime = ""
        }
    }
	
    Quit $$$OK
}

ClassMethod InsertImplantsData(implantsXml As %Stream.GlobalCharacter, documentID As %Integer, profileID As %String) As %Status
{
    Set implantsString = implantsXml.Read()
    Set textreader = ##class(%XML.TextReader).%New(1)
    Set status = ##class(%XML.TextReader).ParseString(implantsString, .textreader)
    
    If $$$ISERR(status) {
        Do $System.Status.DisplayError(status)
        Quit status
    }

    Set implantID = ""
    Set deviceName = ""
    Set deviceCode = ""
    Set deviceCodeSystem = ""
    Set deviceCodeSystemName = ""
    Set manufacturerModelName = ""
    Set serialNumber = ""
    Set implantStatus = ""
    Set implantDate = ""
    Set removalDate = ""
    Set authorTime = ""

    While textreader.Read()
    {
        If textreader.NodeType = "element" {
            If textreader.LocalName = "ImplantID" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set implantID = textreader.Value
                }
            } ElseIf textreader.LocalName = "DeviceName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set deviceName = textreader.Value
                }
            } ElseIf textreader.LocalName = "DeviceCode" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set deviceCode = textreader.Value
                }
            } ElseIf textreader.LocalName = "DeviceCodeSystem" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set deviceCodeSystem = textreader.Value
                }
            } ElseIf textreader.LocalName = "DeviceCodeSystemName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set deviceCodeSystemName = textreader.Value
                }
            } ElseIf textreader.LocalName = "ManufacturerModelName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set manufacturerModelName = textreader.Value
                }
            } ElseIf textreader.LocalName = "SerialNumber" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set serialNumber = textreader.Value
                }
            } ElseIf textreader.LocalName = "ImplantStatus" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set implantStatus = textreader.Value
                }
            } ElseIf textreader.LocalName = "ImplantDate" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set implantDate = textreader.Value
                }
            } ElseIf textreader.LocalName = "RemovalDate" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set removalDate = textreader.Value
                }
            } ElseIf textreader.LocalName = "AuthorTime" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set authorTime = textreader.Value
                }
            }
        } ElseIf (textreader.LocalName = "Implant") && (textreader.NodeType = "endelement") {
            Set document = ##class(LEADNorth.CDAProfiler.Sections.CCDDocument).%OpenId(documentID)
            If '$IsObject(document) {
                Write "Document not found for ID: ", documentID, !
                Continue
            }
            
            Set implant = ##class(LEADNorth.CDAProfiler.Sections.CCDImplants).%New()
            Set implant.DocumentID = document
            Set implant.ImplantID = implantID
            Set implant.DeviceName = deviceName
            Set implant.DeviceCode = deviceCode
            Set implant.DeviceCodeSystem = deviceCodeSystem
            Set implant.DeviceCodeSystemName = deviceCodeSystemName
            Set implant.ManufacturerModelName = manufacturerModelName
            Set implant.SerialNumber = serialNumber
            Set implant.ImplantStatus = implantStatus
            Set implant.ImplantDate = implantDate
            Set implant.RemovalDate = removalDate
            Set implant.AuthorTime = authorTime
            Set implant.ProfileID = profileID

            Set saveStatus = implant.%Save()
            If $$$ISERR(saveStatus) {
                Write "Error saving implant data.", !
                Do $system.OBJ.DisplayError(saveStatus)
                Continue
            } else {
	        Do ..SectionStats(documentID, "Implants")
        	}

            Set implantID = ""
		    Set deviceName = ""
		    Set deviceCode = ""
		    Set deviceCodeSystem = ""
		    Set deviceCodeSystemName = ""
		    Set manufacturerModelName = ""
		    Set serialNumber = ""
		    Set implantStatus = ""
		    Set implantDate = ""
		    Set removalDate = ""
		    Set authorTime = ""
        }
    }
    
    Quit $$$OK
}

ClassMethod InsertPayerData(payerXml As %Stream.GlobalCharacter, documentID As %Integer, profileID As %String) As %Status
{
    Set payerString = payerXml.Read()

    Set textreader = ##class(%XML.TextReader).%New(1)

    Set status = ##class(%XML.TextReader).ParseString(payerString, .textreader)
    If $$$ISERR(status) {
        Do $System.Status.DisplayError(status)
        Quit status
    }

    Set payerName = ""
    Set policyNumber = ""
    Set coveredParty = ""
    Set payerCode = ""
    Set payerCodeSystem = ""
    Set payerCodeSystemName = ""
    Set payerStatusCode = ""
    Set effectiveTimeLow = ""
    Set effectiveTimeHigh = ""
    Set performerIDs = ""
    Set performerAddress = ""
    Set performerTelecom = ""
    Set performerName = ""
    Set authorTime = ""
    Set memberID = ""
    Set locationAddress = ""
    Set locationTelecom = ""
    Set locationName = ""
    Set participantRoleID = ""
    Set participantRoleCode = ""
    Set participantRoleCodeSystem = ""
    Set participantRoleCodeSystemName = ""

    Set document = ##class(LEADNorth.CDAProfiler.Sections.CCDDocument).%OpenId(documentID)
    If '$IsObject(document) {
        Write "Document not found for ID: ", documentID, !
        Quit $$$ERROR($$$GeneralError, "Document not found.")
    }

    While textreader.Read()
    {
        If textreader.NodeType = "element" {
            If textreader.LocalName = "PayerName" {
                Set status = textreader.Read()  // Move to the text node
                If textreader.NodeType = "chars" {
                    Set payerName = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "PolicyNumber" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set policyNumber = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "CoveredParty" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set coveredParty = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "PayerCode" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set payerCode = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "PayerCodeSystem" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set payerCodeSystem = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "PayerCodeSystemName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set payerCodeSystemName = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "PayerStatusCode" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set payerStatusCode = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "EffectiveTimeLow" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set effectiveTimeLow = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "EffectiveTimeHigh" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set effectiveTimeHigh = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "PerformerIDs" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set performerIDs = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "PerformerAddress" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set performerAddress = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "PerformerTelecom" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set performerTelecom = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "PerformerName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set performerName = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "AuthorTime" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set authorTime = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "MemberID" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set memberID = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "LocationAddress" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set locationAddress = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "LocationTelecom" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set locationTelecom = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "LocationName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set locationName = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "ParticipantRoleID" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set participantRoleID = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "ParticipantRoleCode" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set participantRoleCode = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "ParticipantRoleCodeSystem" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set participantRoleCodeSystem = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "ParticipantRoleCodeSystemName" {
                Set status = textreader.Read()
                If textreader.NodeType = "chars" {
                    Set participantRoleCodeSystemName = textreader.Value
                }
            }
        } ElseIf (textreader.LocalName = "Payer") && (textreader.NodeType = "endelement") {
            Set document = ##class(LEADNorth.CDAProfiler.Sections.CCDDocument).%OpenId(documentID)
            If '$IsObject(document) {
                Write "Document not found for ID: ", documentID, !
                Continue
            }
    

    
    Set payer = ##class(LEADNorth.CDAProfiler.Sections.CCDPayer).%New()

    Set payer.DocumentID = document  // Use the object reference
    Set payer.PayerName = payerName
    Set payer.PolicyNumber = policyNumber
    Set payer.CoveredParty = coveredParty
    Set payer.PayerCode = payerCode
    Set payer.PayerCodeSystem = payerCodeSystem
    Set payer.PayerCodeSystemName = payerCodeSystemName
    Set payer.PayerStatusCode = payerStatusCode
    Set payer.EffectiveTimeLow = effectiveTimeLow
    Set payer.EffectiveTimeHigh = effectiveTimeHigh
    Set payer.PerformerIDs = performerIDs
    Set payer.PerformerAddress = performerAddress
    Set payer.PerformerTelecom = performerTelecom
    Set payer.PerformerName = performerName
    Set payer.AuthorTime = authorTime
    Set payer.MemberID = memberID
    Set payer.LocationAddress = locationAddress
    Set payer.LocationTelecom = locationTelecom
    Set payer.LocationName = locationName
    Set payer.ParticipantRoleID = participantRoleID
    Set payer.ParticipantRoleCode = participantRoleCode
    Set payer.ParticipantRoleCodeSystem = participantRoleCodeSystem
    Set payer.ParticipantRoleCodeSystemName = participantRoleCodeSystemName
    Set payer.ProfileID = profileID

    Set saveStatus = payer.%Save()
    If $$$ISERR(saveStatus) {
        Write "Error saving payer data.", !
        Do $system.OBJ.DisplayError(saveStatus)
        Continue
    } else {
	        Do ..SectionStats(documentID, "Payer")
        }
    
    Set payerName = ""
    Set policyNumber = ""
    Set coveredParty = ""
    Set payerCode = ""
    Set payerCodeSystem = ""
    Set payerCodeSystemName = ""
    Set payerStatusCode = ""
    Set effectiveTimeLow = ""
    Set effectiveTimeHigh = ""
    Set performerIDs = ""
    Set performerAddress = ""
    Set performerTelecom = ""
    Set performerName = ""
    Set authorTime = ""
    Set memberID = ""
    Set locationAddress = ""
    Set locationTelecom = ""
    Set locationName = ""
    Set participantRoleID = ""
    Set participantRoleCode = ""
    Set participantRoleCodeSystem = ""
    Set participantRoleCodeSystemName = ""
    
    }
    }
    
	
    Quit $$$OK
}

ClassMethod InsertPatientData(patientXml As %Stream.GlobalCharacter, profileID As %String, documentID As %Integer) As %Status
{
	Set patientString = patientXml.Read()

    Set textreader = ##class(%XML.TextReader).%New(1)

    Set status = ##class(%XML.TextReader).ParseString(patientString, .textreader)
    If $$$ISERR(status) {
        Do $System.Status.DisplayError(status)
        Quit status
    }

    Set patientMRN = ""
    Set firstName = ""
    Set lastName = ""
    Set dob = ""
    Set genderCode = ""
    Set genderDisplay = ""
    Set genderSystem = ""
    Set ethnicityCode = ""
    Set ethnicityDisplay = ""
    Set ethnicitySystem = ""
    Set raceCode = ""
    Set raceDisplay = ""
    Set raceSystem = ""
    Set maritalStatusCode = ""
    Set maritalStatusDisplay = ""
    Set maritalStatusSystem = ""
    Set patientMRN = ""
    Set languageCode = ""
    Set address = ""
    Set city = ""
    Set state = ""
    set country = ""
    Set zipCode = ""
    Set phoneNumber = ""
    Set email = ""
    Set insurancePolicyNumber = ""
    Set insuranceProvider = ""

    While textreader.Read() {
        If textreader.NodeType = "element" {
            If textreader.LocalName = "FirstName" {
                Set status = textreader.Read()  // Move to the text node
                If textreader.NodeType = "chars" {
                    Set firstName = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "LastName" {
                Set status = textreader.Read()  // Move to the text node
                If textreader.NodeType = "chars" {
                    Set lastName = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "DOB" {
                Set status = textreader.Read()  // Move to the text node
                If textreader.NodeType = "chars" {
                    Set dob = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "GenderCode" {
                Set status = textreader.Read()  // Move to the text node
                If textreader.NodeType = "chars" {
                    Set genderCode = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "GenderDisplay" {
                Set status = textreader.Read()  // Move to the text node
                If textreader.NodeType = "chars" {
                    Set genderDisplay = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "GenderSystem" {
                Set status = textreader.Read()  // Move to the text node
                If textreader.NodeType = "chars" {
                    Set genderSystem = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "Address" {
                Set status = textreader.Read()  // Move to the text node
                If textreader.NodeType = "chars" {
                    Set address = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "Country" {
                Set status = textreader.Read()  // Move to the text node
                If textreader.NodeType = "chars" {
                    Set country = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "City" {
                Set status = textreader.Read()  // Move to the text node
                If textreader.NodeType = "chars" {
                    Set city = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "State" {
                Set status = textreader.Read()  // Move to the text node
                If textreader.NodeType = "chars" {
                    Set state = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "ZipCode" {
                Set status = textreader.Read()  // Move to the text node
                If textreader.NodeType = "chars" {
                    Set zipCode = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "PhoneNumber" {
                Set status = textreader.Read()  // Move to the text node
                If textreader.NodeType = "chars" {
                    Set phoneNumber = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "PatientMRN" {
                Set status = textreader.Read()  // Move to the text node
                If textreader.NodeType = "chars" {
                    Set patientMRN = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "Email" {
                Set status = textreader.Read()  // Move to the text node
                If textreader.NodeType = "chars" {
                    Set email = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "LanguageCode" {
                Set status = textreader.Read()  // Move to the text node
                If textreader.NodeType = "chars" {
                    Set languageCode = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "MaritalStatusCode" {
                Set status = textreader.Read()  // Move to the text node
                If textreader.NodeType = "chars" {
                    Set maritalStatusCode = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "MaritalStatusDisplay" {
                Set status = textreader.Read()  // Move to the text node
                If textreader.NodeType = "chars" {
                    Set maritalStatusDisplay = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "MaritalStatusSystem" {
                Set status = textreader.Read()  // Move to the text node
                If textreader.NodeType = "chars" {
                    Set maritalStatusSystem = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "RaceCode" {
                Set status = textreader.Read()  // Move to the text node
                If textreader.NodeType = "chars" {
                    Set raceCode = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "RaceDisplay" {
                Set status = textreader.Read()  // Move to the text node
                If textreader.NodeType = "chars" {
                    Set raceDisplay = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "RaceSystem" {
                Set status = textreader.Read()  // Move to the text node
                If textreader.NodeType = "chars" {
                    Set raceSystem = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "EthnicityCode" {
                Set status = textreader.Read()  // Move to the text node
                If textreader.NodeType = "chars" {
                    Set ethnicityCode = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "EthnicityDisplay" {
                Set status = textreader.Read()  // Move to the text node
                If textreader.NodeType = "chars" {
                    Set ethnicityDisplay = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "EthnicitySystem" {
                Set status = textreader.Read()  // Move to the text node
                If textreader.NodeType = "chars" {
                    Set ethnicitySystem = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "InsurancePolicyNumber" {
                Set status = textreader.Read()  // Move to the text node
                If textreader.NodeType = "chars" {
                    Set insurancePolicyNumber = textreader.Value
                }
            }
            ElseIf textreader.LocalName = "InsuranceProvider" {
                Set status = textreader.Read()  // Move to the text node
                If textreader.NodeType = "chars" {
                    Set insuranceProvider = textreader.Value
                }
            }
        }
    }

#;    Write "PatientMRN: ", patientMRN, !
#;    Write "First Name: ", firstName, !
#;    Write "Last Name: ", lastName, !
#;    Write "DOB: ", dob, !
#;    Write "Gender: ", genderCode,";",genderDisplay,";",genderSystem, !
#;    Write "Address: ", address, !
#;    Write "City: ", city, !
#;    Write "State: ", state, !
#;    Write "Country: ", country, !
#;    Write "Zip Code: ", zipCode, !
#;    Write "Phone Number: ", phoneNumber, !
#;    Write "Email: ", email, !
#;    Write "Language:  ", languageCode, !
#;    Write "Marital Status ", maritalStatusCode,";",maritalStatusDisplay,";",maritalStatusSystem, !
#;    Write "Race ", raceCode,";",raceDisplay,";",raceSystem, !
#;    Write "Ethinicity ", ethnicityCode,";",ethnicityDisplay,";",ethnicitySystem, !
#;    Write "Insurance Policy Number: ", insurancePolicyNumber, !
#;    Write "Insurance Provider: ", insuranceProvider, !

        Set patient = ##class(LEADNorth.CDAProfiler.Sections.CCDPatient).%New()
        Set patient.PatientMRN = patientMRN
        Set patient.FirstName = firstName
        Set patient.LastName = lastName
        Set patient.DOB = dob  // Convert to an internal date format
        Set patient.GenderCode = genderCode
        Set patient.GenderDisplay = genderDisplay
        Set patient.GenderSystem = genderSystem
        Set patient.Address = address
        Set patient.City = city
        Set patient.State = state
        Set patient.Country = country
        Set patient.ZipCode = zipCode
        Set patient.PhoneNumber = phoneNumber
        Set patient.Email = email
        Set patient.LanguageCode = languageCode
        Set patient.MaritalStatusCode = maritalStatusCode
        Set patient.MaritalStatusDisplay = maritalStatusDisplay
        Set patient.MaritalStatusSystem = maritalStatusSystem
        Set patient.RaceCode = raceCode
        Set patient.RaceDisplay = raceDisplay
        Set patient.RaceSystem = raceSystem
        Set patient.EthnicityCode = ethnicityCode
        Set patient.EthnicityDisplay = ethnicityDisplay
        Set patient.EthnicitySystem = ethnicitySystem
        Set patient.InsurancePolicyNumber = insurancePolicyNumber
        Set patient.InsuranceProvider = insuranceProvider
        Set patient.ProfileID = profileID
        
        
        Set saveStatus = patient.%Save()
        If $$$ISERR(saveStatus) {
            Write "Error saving patient data.", !
            Do $system.OBJ.DisplayError(saveStatus)
            Quit saveStatus
        } else {
	        Do ..SectionStats(documentID, "Patient")
        }

    Quit $$$OK
}

Storage Default
{
<Data name="DBInsertDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
</Data>
<DataLocation>^LEADNorth.LEADNorD782.DBInsertD</DataLocation>
<DefaultData>DBInsertDefaultData</DefaultData>
<IdLocation>^LEADNorth.LEADNorD782.DBInsertD</IdLocation>
<IndexLocation>^LEADNorth.LEADNorD782.DBInsertI</IndexLocation>
<StreamLocation>^LEADNorth.LEADNorD782.DBInsertS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
