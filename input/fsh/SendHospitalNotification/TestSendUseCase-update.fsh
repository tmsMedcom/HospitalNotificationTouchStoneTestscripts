 //RE_STAA
Instance: HospitalNotification-TestScript-RE_STAA
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-re-staa"
* name = "Update of start hospital stay-acute ambulant"
* title = "Update of start hospital stay-acute ambulant - RE_STAA"
* description = "Testing correct use of status stay-acute ambulant"
* insert createInitialMessage(STAA, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, admit-emergency, EMER, in-progress, true) 
* insert createMessage(RE-STAA, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, revise-admit-emergency, EMER, in-progress, revision, messageHeaderid-STAA, 2, episodeOfCareID-STAA)


//RE_STIN
Instance: HospitalNotification-TestScript-RE_STIN
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-re-stin"
* name = "Update of start hospital stay-admission"
* title = "Update of start hospital stay-admission - RE_STIN"
* description = "Testing correct use of status Update of start hospital stay-admission"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, admit-inpatient, IMP, in-progress, true) 
* insert createMessage(RE-STIN, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, revise-admit-inpatient, IMP, in-progress, revision, messageHeaderid-STIN, 2, episodeOfCareID-STIN)

//RE_STOR
Instance: HospitalNotification-TestScript-RE_STOR
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-re-stor"
* name = "Update of Start leave"
* title = "Update of Start leave send - RE_STOR"
* description = "Testing correct use of Update of Start leave"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, admit-inpatient, IMP, in-progress, true)
* insert createMessage(STOR, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, start-leave-inpatient, IMP, onleave, revision, messageHeaderid-STIN, 2, episodeOfCareID-STIN)
* insert createMessage(RE-STOR, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, revise-start-leave-inpatient, IMP, onleave, revision, messageHeaderid-STOR, 3, episodeOfCareID-STOR)

//RE_SLOR
Instance: HospitalNotification-TestScript-RE_SLOR
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-re-slor"
* name = "Update of End leave"
* title = "Update of End leave - RE_SLOR"
* description = "Testing correct use of Update of end leave"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, admit-inpatient, IMP, in-progress, true)
* insert createMessage(STOR, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, start-leave-inpatient, IMP, onleave, revision, messageHeaderid-STIN, 2, episodeOfCareID-STIN)
* insert createMessage(SLOR, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, end-leave-inpatient, IMP, in-progress, revision, messageHeaderid-STOR, 3, episodeOfCareID-STOR)
* insert createMessage(RE-SLOR, 04, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, revise-end-leave-inpatient, IMP, in-progress, revision, messageHeaderid-SLOR, 4, episodeOfCareID-SLOR)

//RE_SLHJ - IMP
Instance: HospitalNotification-TestScript-RE_SLHJ-imp
InstanceOf: TestScript
* insert Metadata
* id = "hospitalmotification-re-slhj-imp"
* name = "Update discharge patient to Home/Primary sector"
* title = "Update discharge patient to Home/Primary sector - RE_SLHJ"
* description = "Testing correct use of Update of End hospital Stay"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, admit-inpatient, IMP, in-progress, true) 
* insert createMessage(SLHJ, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, discharge-inpatient-home, IMP, finished, revision, messageHeaderid-STIN, 2, episodeOfCareID-STIN)
* insert createMessage(RE-SLHJ, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, revise-discharge-inpatient-home, IMP, finished, revision, messageHeaderid-SLHJ, 3, episodeOfCareID-SLHJ)


//RE_SLHJ - EMER
Instance: HospitalNotification-TestScript-RE_SLHJ-emer
InstanceOf: TestScript
* insert Metadata
* id = "hospitalmotification-re-slhj-emer"
* name = "Update discharge acute ambulant patient to Home/Primary sector"
* title = "Update discharge acute ambulant patient to Home/Primary sector - RE_SLHJ"
* description = "Testing correct use of Update of End hospital Stay"
* insert createInitialMessage(STAA, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, admit-emergency, EMER, in-progress, true)
* insert createMessage(SLHJ, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, discharge-emergency-home, EMER, finished, revision, messageHeaderid-STAA, 2, episodeOfCareID-STAA)
* insert createMessage(RE-SLHJ, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, revise-discharge-emergency-home, EMER, finished, revision, messageHeaderid-SLHJ, 3, episodeOfCareID-SLHJ)




 //RE_MORS - EMER
Instance: HospitalNotification-TestScript-RE_MORS-emer
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-re-mors-emer"
* name = "Update Acute ambulant patient, deceased during hospital stay"
* title = "Update Acute ambulant patient, deceased during hospital stay - RE_MORS"
* description = "Testing correct use of Update of End hospital Stay - deceased"
* insert createInitialMessage(STAA, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, admit-emergency, EMER, in-progress, true)
* insert createMessageDeceased(MORS, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, admit-emergency, EMER, finished, revision, true, messageHeaderid-STAA, 2, episodeOfCareID-STAA)
* insert createMessageDeceased(RE-MORS, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, admit-emergency, EMER, finished, revision, true, messageHeaderid-MORS, 3, episodeOfCareID-MORS)

//RE_MORS
Instance: HospitalNotification-TestScript-RE_MORS
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-re-mors"
* name = "Update of deceased inpatient before arrival at the hospital"
* title = "Update of deceased inpatient before arrival at the hospital - MORS"
* description = "Testing correct use of update of deceased inpatient before arrival at the hospital - deceased"
* insert createInitialMessageDeceased(MORS, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, admit-inpatient, IMP, in-progress, false, true) 
* insert createMessageDeceased(RE-MORS, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, admit-inpatient, IMP, in-progress, revision, true, messageHeaderid-MORS, 2, episodeOfCareID-MORS)


 //RE_MORS - IMP
Instance: HospitalNotification-TestScript-RE_MORS-STOR
InstanceOf: TestScript
* insert Metadata
* id = "hospitalmotification-re-mors-stor"
* name = "Update Inpatient deceased during a period of leave"
* title = "Update Inpatient deceased during a period of leave - RE_MORS"
* description = "Testing correct use of Update of End hospital Stay - deceased"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, admit-inpatient, IMP, in-progress, true)
* insert createMessage(STOR, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, start-leave-inpatient, IMP, onleave, revision, messageHeaderid-STIN, 2, episodeOfCareID-STIN)
* insert createMessageDeceased(MORS, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, start-leave-inpatient, IMP, finished, revision, true, messageHeaderid-STOR, 3, episodeOfCareID-STOR)
* insert createMessageDeceased(RE-MORS, 04, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, start-leave-inpatient, IMP, finished, revision, true, messageHeaderid-MORS, 4, episodeOfCareID-MORS)

 //RE_MORS - IMP
Instance: HospitalNotification-TestScript-RE_MORS-IMP
InstanceOf: TestScript
* insert Metadata
* id = "hospitalmotification-re-mors-imp"
* name = "Update Inpatient deceased during admission"
* title = "Update Inpatient deceased during admission - RE_MORS"
* description = "Testing correct use of Update of End hospital Stay - deceased"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, admit-inpatient, IMP, in-progress, true)
* insert createMessageDeceased(MORS, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, admit-inpatient, IMP, finished, revision, true, messageHeaderid-STIN, 2, episodeOfCareID-STIN)
* insert createMessageDeceased(RE-MORS, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, admit-inpatient, IMP, finished, revision, true, messageHeaderid-MORS, 3, episodeOfCareID-MORS)
