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

RuleSet: variableDestinationUri(type, number)
* variable[+].name = "destinationUri"
* variable[=].expression = "Bundle.entry.resource.ofType(MessageHeader).destination.endpoint"
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