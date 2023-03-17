RuleSet: cancelMessage(type, number, fixture, activityCode, encounterClass, encounterStatus, role, messageHeaderid, countProvenances, episodeOfCareID) //TODO change name
/* 
Beskriver server og client for dette testsetup
*/
* insert originClient
* insert destinationServer
/* 
Beskriver den profil, der valideres op mod
*/
* insert profileHospitalNotificationMessage
/* 
Beskriver anvendte fixtures
*/
* insert fixtureCancelMessage({fixture}, {type}, {number})
/* 
Beskriver de operationer der udføres i denne test. Her er det kun setup operationer
*/
* insert operationCancelMessage({type}, {number})
/* 
Beskriver den vurdering der sker af operationen.
*/
* insert variableMessageHeaderId({type})

* insert assertResponseCodeTest
* insert assertPayload
* insert assertMessageHeaderid({messageHeaderid})
* insert assertMessageHeaderEventCoding
* insert assertProvenanceEntityRole({role})
* insert assertEncounterClass({encounterClass})
* insert assertEncounterStatus({encounterStatus})
* insert assertProvenanceActivityCode({activityCode})
* insert assertProvenanceTarget
* insert assertProvenanceEntityCount({countProvenances})
* insert assertEpisodeOfCareID({episodeOfCareID})

