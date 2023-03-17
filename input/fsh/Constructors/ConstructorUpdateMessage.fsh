RuleSet: updateMessage(type, number, fixture, activityCode, encounterClass, encounterStatus, role, messageHeaderid, countProvenances, episodeOfCareID, searchParamIdentifier) //TODO change name

/* 
Beskriver server og client for dette testsetup
*/
* insert originClient
* insert destinationServer

/* 
Beskriver anvendte fixtures
*/
* insert fixtureUpdateMessage({fixture}, {type}, {number})
/* 
Beskriver den profil, der valideres op mod
*/
* insert profileHospitalNotificationMessage
/* Variable */
//* insert variableSearchParamIdentifier({number})
/* 
Beskriver de operationer der udføres i denne test. Her er det kun setup operationer
*/
* insert operationUpdateMessage({type}, {number}, {searchParamIdentifier})

/* 
Beskriver den vurdering der sker af operationen.
*/
* insert assertMessageHeaderid({messageHeaderid})
* insert assertProvenanceEntityRole({role})
* insert assertEncounterClass({encounterClass})
* insert assertEncounterStatus({encounterStatus})
* insert assertProvenanceActivityCode({activityCode})
* insert assertMessageHeaderEventCoding
* insert assertProvenanceTarget
* insert assertProvenanceEntityCount({countProvenances})
* insert assertEpisodeOfCareID({episodeOfCareID})
