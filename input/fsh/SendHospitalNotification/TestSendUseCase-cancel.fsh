/*  //AN_STAA
Instance: HospitalNotification-TestScript-AN_STAA
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-send-an-staa"
* name = "Send: Cancellation Start hospital stay - acute ambulant"
* title = "Send: Cancellation Start hospital stay - acute ambulant - AN_STAA"
* description = "Testing correct use of cancellation of start acute ambulant"
* insert createInitialMessage(STAA, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-emergency, EMER, in-progress, true) 
* insert createMessage(AN-STAA, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, cancel-admit-emergency, EMER, entered-in-error, removal, messageHeaderid-STAA, 2, episodeOfCareID-STAA)

//AN_STIN
Instance: HospitalNotification-TestScript-AN_STIN
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-send-an-stin"
* name = "Send: Cancellation Start hospital stay - admitted - AN_STIN"
* title = "Send: Cancellation Start hospital stay - admitted - AN_STIN"
* description = "Testing correct use of cancellation of start hospital stay admission"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-inpatient, IMP, in-progress, true) 
* insert createMessage(AN-STIN, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, cancel-admit-inpatient, IMP, entered-in-error, removal, messageHeaderid-STIN, 2, episodeOfCareID-STIN)

//AN_STOR
Instance: HospitalNotification-TestScript-AN_STOR
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-send-an-stor"
* name = "Send: Cancellation Start leave - AN_STOR"
* title = "Send: Cancellation Start leave - AN_STOR"
* description = "Testing correct use of cancellation of start leave"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-inpatient, IMP, in-progress, true) 
* insert createMessage(STOR, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, start-leave-inpatient, IMP, onleave, revision, messageHeaderid-STIN, 2, episodeOfCareID-STIN)
* insert createMessage(AN-STOR, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, cancel-start-leave-inpatient, IMP, in-progress, removal, messageHeaderid-STOR, 3, episodeOfCareID-STOR)

//AN_SLOR
Instance: HospitalNotification-TestScript-AN_SLOR
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-send-an-slor"
* name = "Send: Cancellation End leave"
* title = "Send: Cancellation End leave - AN_SLOR"
* description = "Testing correct use of cancellation of end leave"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-inpatient, IMP, in-progress, true)
* insert createMessage(STOR, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, start-leave-inpatient, IMP, onleave, revision, messageHeaderid-STIN, 2, episodeOfCareID-STIN)
* insert createMessage(SLOR, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, end-leave-inpatient, IMP, in-progress, revision, messageHeaderid-STOR, 3, episodeOfCareID-STOR)
* insert createMessage(AN-SLOR, 04, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, cancel-end-leave-inpatient, IMP, onleave, removal, messageHeaderid-SLOR, 4, episodeOfCareID-SLOR)

//AN_SLHJ - IMP
Instance: HospitalNotification-TestScript-AN_SLHJ-imp
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-send-an-slhj-imp"
* name = "Send: Cancellation End hospital stay - patient completed to home/primary sector"
* title = "Send: Cancellation End hospital stay - patient completed to home/primary sector - AN_SLHJ"
* description = "Testing correct use of cancellation of End hospital Stay"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-inpatient, IMP, in-progress, true) 
* insert createMessage(SLHJ, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, discharge-inpatient-home, IMP, finished, revision, messageHeaderid-STIN, 2, episodeOfCareID-STIN)
* insert createMessage(AN-SLHJ, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, cancel-discharge-inpatient-home, IMP, in-progress, removal, messageHeaderid-SLHJ, 3, episodeOfCareID-SLHJ)


//AN_SLHJ - EMER
Instance: HospitalNotification-TestScript-AN_SLHJ-emer
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-send-an-slhj-emer"
* name = "Send: Cancellation End hospital stay - patient completed to home/primary sector"
* title = "Send: Cancellation End hospital stay - patient completed to home/primary sector - AN_SLHJ"
* description = "Testing correct use of cancellation of End hospital Stay"
* insert createInitialMessage(STAA, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-emergency, EMER, in-progress, true)
* insert createMessage(SLHJ, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, discharge-emergency-home, EMER, finished, revision, messageHeaderid-STAA, 2, episodeOfCareID-STAA)
* insert createMessage(AN-SLHJ, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, cancel-discharge-emergency-home, EMER, in-progress, removal, messageHeaderid-SLHJ, 3, episodeOfCareID-SLHJ)


//AN_MORS
Instance: HospitalNotification-TestScript-AN_MORS
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-send-an-mors"
* name = "Send: Cancellation Deceased - dead at arrival to the hospital"
* title = "Send: Cancellation Deceased - dead at arrival to the hospital - MORS"
* description = "Testing correct use of cancellation of deceased inpatient before arrival at the hospital - deceased"
* insert createInitialMessageDeceased(MORS, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-inpatient, IMP, in-progress, false, true) 
* insert createMessageDeceased(AN-MORS, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-inpatient, IMP, in-progress, removal, false, messageHeaderid-MORS, 2, episodeOfCareID-MORS)


 //AN_MORS - EMER
Instance: HospitalNotification-TestScript-AN_MORS-emer
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-send-an-mors-emer"
* name = "Send: Cancellation Deceased - dies during acute ambulant"
* title = "Send: Cancellation Deceased - dies during acute ambulant - AN_MORS"
* description = "Testing correct use of cancellation of End hospital Stay - deceased"
* insert createInitialMessage(STAA, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-emergency, EMER, in-progress, true)
* insert createMessageDeceased(MORS, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-emergency, EMER, finished, revision, true, messageHeaderid-STAA, 2, episodeOfCareID-STAA)
* insert createMessageDeceased(AN-MORS, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-emergency, EMER, in-progress, removal, false, messageHeaderid-MORS, 3, episodeOfCareID-MORS)


 //AN_MORS - IMP
Instance: HospitalNotification-TestScript-AN_MORS-STOR
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-send-an-mors-stor"
* name = "Send: Cancellation Deceased - dies during a period of leave"
* title = "Send: Cancellation Deceased - dies during a period of leave - AN_MORS"
* description = "Testing correct use of cancellation of deceased during a period of leave - deceased"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-inpatient, IMP, in-progress, true)
* insert createMessage(STOR, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, start-leave-inpatient, IMP, onleave, revision, messageHeaderid-STIN, 2, episodeOfCareID-STIN)
* insert createMessageDeceased(MORS, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, start-leave-inpatient, IMP, finished, revision, true, messageHeaderid-STOR, 3, episodeOfCareID-STOR)
* insert createMessageDeceased(AN-MORS, 04, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, start-leave-inpatient, IMP, onleave, removal, false, messageHeaderid-MORS, 4, episodeOfCareID-MORS)

 //AN_MORS - STOR
Instance: HospitalNotification-TestScript-AN_MORS-IMP
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-send-an-mors-imp"
* name = "Send: Cancellation Deceased - dies during admission"
* title = "Send: Cancellation Deceased - dies during admission - AN_MORS"
* description = "Testing correct use of cancellation of End hospital Stay - deceased"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-inpatient, IMP, in-progress, true)
* insert createMessageDeceased(MORS, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-inpatient, IMP, finished, revision, true, messageHeaderid-STIN, 2, episodeOfCareID-STIN)
* insert createMessageDeceased(AN-MORS, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-inpatient, IMP, in-progress, removal, false, messageHeaderid-MORS, 3, episodeOfCareID-MORS)
 */