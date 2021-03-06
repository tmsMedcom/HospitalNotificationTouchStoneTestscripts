RuleSet: createMessageSetup(type, number, fixture)

/* 
Beskriver server og client for dette testsetup
*/
* insert originClient
* insert destinationServer

/* 
Beskriver anvendte fixtures
*/
* insert fixtureCreateMessage({fixture}, {type}, {number})

/* 
Beskriver den profil, der valideres op mod
*/
* insert profileHospitalNotificationMessage

/* 
Beskriver anvendte variable
*/
* insert variableMessageHeaderId({type}, {number})
* insert variableDestinationUri({type}, {number})
* insert variableSearchParamIdentifier({type}, {number})

/* 
Beskriver de operationer der udføres i denne test. Her er det kun setup operationer
*/
* insert operationDeleteSetup({destinationUri})
* insert operationCreateSetup({type}, {number})

/* 
Beskriver den vurdering der sker af setup'et. Er det gået ok?
*/
* insert assertResponseCodeSetup