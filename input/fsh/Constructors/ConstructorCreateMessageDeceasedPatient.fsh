//Constructur for HN Sende with deceased value
RuleSet: createMessageDeceased(type, number, fixture, activityCode, encounterClass, encounterStatus, role, messageHeaderid, deceased)

/* 
Dette er en constructor. Som opretter en meddelelse. Her vil vi blot test om patienten er korrekt angivet som 'deceased' 
*/
* insert createMessage({type}, {number}, {fixture}, {activityCode}, {encounterClass}, {encounterStatus}, {role}, {messageHeaderid})

/* 
Beskriver den vurdering der sker af operationen. 
*/
* insert assertPatientDeceased({deceased})
