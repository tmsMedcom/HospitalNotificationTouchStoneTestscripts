/* //RE_STAA
Instance: HospitalNotification-TestScript-RE_STAA
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-send-re-staa"
* name = "Send: Update Start hospital stay - acute ambulant"
* title = "Send: Update Start hospital stay - acute ambulant - RE_STAA"
* description = "Testing correct use of status stay-acute ambulant"
* insert createInitialMessage(STAA, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-emergency, EMER, in-progress, true) 
* insert createMessage(RE-STAA, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, revise-admit-emergency, EMER, in-progress, revision, messageHeaderid-STAA, 2, episodeOfCareID-STAA)


//RE_STIN
Instance: HospitalNotification-TestScript-RE_STIN
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-send-re-stin"
* name = "Send: Update Start hospital stay - admitted"
* title = "Send: Update Start hospital stay - admitted - RE_STIN"
* description = "Testing correct use of status Update Start hospital stay - admitted"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-inpatient, IMP, in-progress, true) 
* insert createMessage(RE-STIN, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, revise-admit-inpatient, IMP, in-progress, revision, messageHeaderid-STIN, 2, episodeOfCareID-STIN)

//RE_STOR
Instance: HospitalNotification-TestScript-RE_STOR
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-send-re-stor"
* name = "Send: Update Start leave"
* title = "Send: Update Start leave - RE_STOR"
* description = "Testing correct use of Update Start leave"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-inpatient, IMP, in-progress, true)
* insert createMessage(STOR, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, start-leave-inpatient, IMP, onleave, revision, messageHeaderid-STIN, 2, episodeOfCareID-STIN)
* insert createMessage(RE-STOR, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, revise-start-leave-inpatient, IMP, onleave, revision, messageHeaderid-STOR, 3, episodeOfCareID-STOR)

//RE_SLOR
Instance: HospitalNotification-TestScript-RE_SLOR
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-send-re-slor"
* name = "Send: Update End leave"
* title = "Send: Update End leave - RE_SLOR"
* description = "Testing correct use of Update end leave"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-inpatient, IMP, in-progress, true)
* insert createMessage(STOR, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, start-leave-inpatient, IMP, onleave, revision, messageHeaderid-STIN, 2, episodeOfCareID-STIN)
* insert createMessage(SLOR, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, end-leave-inpatient, IMP, in-progress, revision, messageHeaderid-STOR, 3, episodeOfCareID-STOR)
* insert createMessage(RE-SLOR, 04, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, revise-end-leave-inpatient, IMP, in-progress, revision, messageHeaderid-SLOR, 4, episodeOfCareID-SLOR)

//RE_SLHJ - IMP
Instance: HospitalNotification-TestScript-RE_SLHJ-imp
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-send-re-slhj-imp"
* name = "Send: Update End hospital stay - patient completed to home/primary sector"
* title = "Send: Update End hospital stay - patient completed to home/primary sector - RE_SLHJ"
* description = "Testing correct use of Update End hospital Stay"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-inpatient, IMP, in-progress, true) 
* insert createMessage(SLHJ, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, discharge-inpatient-home, IMP, finished, revision, messageHeaderid-STIN, 2, episodeOfCareID-STIN)
* insert createMessage(RE-SLHJ, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, revise-discharge-inpatient-home, IMP, finished, revision, messageHeaderid-SLHJ, 3, episodeOfCareID-SLHJ)


//RE_SLHJ - EMER
Instance: HospitalNotification-TestScript-RE_SLHJ-emer
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-send-re-slhj-emer"
* name = "Send: Update End hospital stay - patient completed to home/primary sector"
* title = "Send: Update End hospital stay - patient completed to home/primary sector - RE_SLHJ"
* description = "Testing correct use of Update End hospital Stay"
* insert createInitialMessage(STAA, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-emergency, EMER, in-progress, true)
* insert createMessage(SLHJ, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, discharge-emergency-home, EMER, finished, revision, messageHeaderid-STAA, 2, episodeOfCareID-STAA)
* insert createMessage(RE-SLHJ, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, revise-discharge-emergency-home, EMER, finished, revision, messageHeaderid-SLHJ, 3, episodeOfCareID-SLHJ)




 //RE-MORS - EMER
Instance: HospitalNotification-TestScript-RE-MORS-emer
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-send-re-mors-emer"
* name = "Send: Update Deceased - deceased during acute ambulant"
* title = "Send: Update Deceased - deceased during acute ambulant - RE-MORS"
* description = "Testing correct use of Update End hospital Stay - deceased"
* insert createInitialMessage(STAA, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-emergency, EMER, in-progress, true)
* insert createMessageDeceased(MORS, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-emergency, EMER, finished, revision, true, messageHeaderid-STAA, 2, episodeOfCareID-STAA)
* insert createMessageDeceased(RE-MORS, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-emergency, EMER, finished, revision, true, messageHeaderid-MORS, 3, episodeOfCareID-MORS)

//RE-MORS
Instance: HospitalNotification-TestScript-RE-MORS
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-send-re-mors"
* name = "Send: Update Deceased - dead at arrival to the hospital"
* title = "Send: Update Deceased - dead at arrival to the hospital - RE-MORS"
* description = "Testing correct use of update of deceased inpatient before arrival at the hospital - deceased"
* insert createInitialMessageDeceased(MORS, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-inpatient, IMP, in-progress, false, true) 
* insert createMessageDeceased(RE-MORS, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-inpatient, IMP, in-progress, revision, true, messageHeaderid-MORS, 2, episodeOfCareID-MORS)


 //RE-MORS - IMP
Instance: HospitalNotification-TestScript-RE-MORS-STOR
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-send-re-mors-stor"
* name = "Send: Update Deceased - dies during a period of leave"
* title = "Send: Update Deceased - dies during a period of leave - RE-MORS"
* description = "Testing correct use of Update End hospital Stay - deceased"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-inpatient, IMP, in-progress, true)
* insert createMessage(STOR, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, start-leave-inpatient, IMP, onleave, revision, messageHeaderid-STIN, 2, episodeOfCareID-STIN)
* insert createMessageDeceased(MORS, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, start-leave-inpatient, IMP, finished, revision, true, messageHeaderid-STOR, 3, episodeOfCareID-STOR)
* insert createMessageDeceased(RE-MORS, 04, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, start-leave-inpatient, IMP, finished, revision, true, messageHeaderid-MORS, 4, episodeOfCareID-MORS)

 //RE-MORS - IMP
Instance: HospitalNotification-TestScript-RE-MORS-IMP
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-send-re-mors-imp"
* name = "Send: Update Deceased - dies during admission"
* title = "Send: Update Deceased - dies during admission - RE-MORS"
* description = "Testing correct use of Update End hospital Stay - deceased"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-inpatient, IMP, in-progress, true)
* insert createMessageDeceased(MORS, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-inpatient, IMP, finished, revision, true, messageHeaderid-STIN, 2, episodeOfCareID-STIN)
* insert createMessageDeceased(RE-MORS, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-inpatient, IMP, finished, revision, true, messageHeaderid-MORS, 3, episodeOfCareID-MORS)
 */