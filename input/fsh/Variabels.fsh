RuleSet: variableEncounterResourceIdentifier(type, number)
* variable[+].name = "encounterResourceIdentifier"
* variable[=].expression = "Bundle.entry.resource.ofType(Encounter).identifier.value"
* variable[=].sourceId = "create-{type}-{number}"

RuleSet: variableHeaderResourceReference(type, number)
* variable[+].name = "headerResourceReference"
* variable[=].expression = "Bundle.entry[0].fullUrl"
* variable[=].sourceId = "create-{type}-{number}"

RuleSet: variableEpisodeOfCareIdentifier(type, number)
* variable[+].name = "episodeOfCareIdentifier"
* variable[=].expression = "Bundle.entry.resource.ofType(Encounter).episodeOfCare.identifier.value"
* variable[=].sourceId = "create-{type}-{number}"

RuleSet: variableDestinationUri(type, number)
* variable[+].name = "destinationUri"
* variable[=].expression = "Bundle.entry.resource.ofType(MessageHeader).destination.endpoint"
* variable[=].sourceId = "create-{type}-{number}"
 
RuleSet: variableSearchParamIdentifier(type, number)
* variable[+].name = "searchParamIdentifier" 
* variable[=].expression = "Bundle.entry.resource.ofType(MessageHeader).id"
* variable[=].sourceId = "create-{type}-{number}"

RuleSet: variableCorrectMessageID(type, number)
* variable[+].name = "correctMessageID{number}"
* variable[=].expression = "Bundle.entry.resource.ofType(Bundle).id"
* variable[=].sourceId = "bundle-get-{type}{number}"