RuleSet: variableEncounterResourceIdentifier(type, number)
* variable[+].name = "encounterResourceIdentifier"
* variable[=].expression = "Bundle.entry.resource.ofType(Encounter).identifier.value"
* variable[=].sourceId = "create-{type}-{number}"

RuleSet: variableMessageHeaderId(type)
* variable[+].name = "messageHeaderid-{type}"
* variable[=].expression = "Bundle.entry[0].fullUrl"
* variable[=].sourceId = "create-message-{type}"

RuleSet: variableEpisodeOfCareIdentifier(type)
* variable[+].name = "episodeOfCareID-{type}"
* variable[=].expression = "Bundle.entry.resource.ofType(Encounter).episodeOfCare.identifier.value"
* variable[=].sourceId = "create-message-{type}"

/* RuleSet: variableDestinationUri(type, number)
* variable[+].name = "destinationUri-{type}"
* variable[=].expression = "Bundle.id"
* variable[=].sourceId = "create-{type}-{number}" */

RuleSet: variableDestinationUri(type, number)
* variable[+].name = "destinationUri-{type}"
* variable[=].expression = "Bundle.entry.resource.ofType(MessageHeader).destination.endpoint"
* variable[=].sourceId = "create-{type}-{number}"

RuleSet: variableBundleid(type, number)
* variable[+].name = "bundleid-{type}"
* variable[=].expression = "Bundle.entry.resource.ofType(MessageHeader).id"
* variable[=].sourceId = "create-{type}-{number}" 
 
RuleSet: variableSearchParamIdentifier(type)
* variable[+].name = "searchParamIdentifier-{type}" 
* variable[=].expression = "Bundle.entry.resource.ofType(MessageHeader).id"
* variable[=].sourceId = "create-message-{type}"

RuleSet: variableCorrectMessageID(type, number)
* variable[+].name = "correctMessageID{number}"
* variable[=].expression = "Bundle.entry.resource.ofType(Bundle).id"
* variable[=].sourceId = "bundle-get-{type}{number}"

RuleSet: variableOccurredDateTime(type) // skal kun anvendes ved den initielle meddelelse
* variable[+].name = "occurredDateTime-{type}"
* variable[=].expression = "Bundle.entry.resource.ofType(Provenance).where(target.reference = %resource.entry[0].fullUrl).occurred"
* variable[=].sourceId = "create-message-{type}"

RuleSet: variableHospitalSOR(type) 
* variable[+].name = "hospitalSOR-{type}"
* variable[=].expression = "Bundle.entry.where(fullUrl = %resource.entry.resource[0].sender.reference).resource.identifier.where(system = 'urn:oid:1.2.208.176.1.1').value"
* variable[=].sourceId = "create-message-{type}"

RuleSet: variableHospitalGLN(type) 
* variable[+].name = "hospitalGLN-{type}"
* variable[=].expression = "Bundle.entry.where(fullUrl = %resource.entry.resource[0].sender.reference).resource.identifier.where(system = 'https://www.gs1.org/gln').value"
* variable[=].sourceId = "create-message-{type}"

/* RuleSet: variableEndpoint(type, number) // skal kun anvendes ved den initielle meddelelse
* variable[+].name = "receiverEndpoint"
* variable[=].expression = "Bundle.entry.resource.ofType(MessageHeader).destination.endpoint"
* variable[=].sourceId = "create-{type}-{number}" */

RuleSet: variableEncounterDateTime(type) // skal kun anvendes ved den initielle meddelelse
* variable[+].name = "encounterDateTime-{type}"
* variable[=].expression = "Bundle.entry.resource.ofType(Encounter).period.start"
* variable[=].sourceId = "create-message-{type}"


RuleSet: dynamicEndpoint(type, number)
* extension.extension[0].url = "id"
* extension.extension[=].valueId = "create-{type}-{number}"
* extension.extension[+].url = "resourceType"
* extension.extension[=].valueString = "MessageHeader"
* extension.extension[+].url = "contentType"
* extension.extension[=].valueString = "string" //"application/fhir+xml"
* extension.extension[+].url = "description"
* extension.extension[=].valueString = "Receiver endpoint"
* extension.extension[+].url = "hint"
* extension.extension[=].valueString = "Bundle resource contents"
* extension.url = "http://touchstone.aegis.net/touchstone/fhir/testing/StructureDefinition/testscript-dynamic-fixture"