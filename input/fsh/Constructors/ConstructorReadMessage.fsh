RuleSet: readMessage(type, number, destinationUri)

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
Beskriver de operationer der udføres i denne test. Her er det kun setup operationer
*/
* insert operationReadMessage({type}, {number}, {destinationUri})

/* 
Beskriver den vurdering der sker af testen. Er det gået ok?
*/
* insert assertResponseCodeTest

