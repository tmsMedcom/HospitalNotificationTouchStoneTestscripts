//AN_STAA
Instance: HospitalNotification-TestScript-AN_STAA
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-an-staa"
* name = "Cancellation of start hospital stay-acute ambulant"
* title = "Cancellation of start hospital stay-acute ambulant - AN_STAA"
* description = "Testing correct use of cancellation of start acute ambulant"
* insert createInitialMessage(STAA, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, admit-emergency, EMER, in-progress, true) 
* insert createMessage(AN-STAA, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, cancel-admit-emergency, EMER, entered-in-error, revision, messageHeaderid-STAA, 2, episodeOfCareID-STAA)

//AN_STIN
Instance: HospitalNotification-TestScript-AN_STIN
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-an-stin"
* name = "Cancellation of start hospital stay admission - AN_STIN"
* title = "Cancellation of start hospital stay admission - AN_STIN"
* description = "Testing correct use of cancellation of start hospital stay admission"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, admit-inpatient, IMP, in-progress, true) 
* insert createMessage(AN-STIN, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, cancel-admit-inpatient, IMP, entered-in-error, revision, messageHeaderid-STIN, 2, episodeOfCareID-STIN)

//AN_STOR
Instance: HospitalNotification-TestScript-AN_STOR
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-an-stor"
* name = "Cancellation of start leave - AN_STOR"
* title = "Cancellation of start leave - AN_STOR"
* description = "Testing correct use of cancellation of start leave"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, admit-inpatient, IMP, in-progress, true) 
* insert createMessage(STOR, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, start-leave-inpatient, IMP, onleave, revision, messageHeaderid-STIN, 2, episodeOfCareID-STIN)
* insert createMessage(AN-STOR, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, cancel-start-leave-inpatient, IMP, in-progress, revision, messageHeaderid-STOR, 3, episodeOfCareID-STOR)

//AN_SLOR
Instance: HospitalNotification-TestScript-AN_SLOR
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-an-slor"
* name = "Cancellation of End leave"
* title = "Cancellation of End leave - AN_SLOR"
* description = "Testing correct use of cancellation of end leave"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, admit-inpatient, IMP, in-progress, true)
* insert createMessage(STOR, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, start-leave-inpatient, IMP, onleave, revision, messageHeaderid-STIN, 2, episodeOfCareID-STIN)
* insert createMessage(SLOR, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, end-leave-inpatient, IMP, in-progress, revision, messageHeaderid-STOR, 3, episodeOfCareID-STOR)
* insert createMessage(AN-SLOR, 04, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, cancel-end-leave-inpatient, IMP, onleave, revision, messageHeaderid-SLOR, 4, episodeOfCareID-SLOR)

//AN_SLHJ - IMP
Instance: HospitalNotification-TestScript-AN_SLHJ-imp
InstanceOf: TestScript
* insert Metadata
* id = "hospitalmotification-an-slhj-imp"
* name = "Cancellation discharge patient to Home/Primary sector"
* title = "Cancellation discharge patient to Home/Primary sector - AN_SLHJ"
* description = "Testing correct use of cancellation of End hospital Stay"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, admit-inpatient, IMP, in-progress, true) 
* insert createMessage(SLHJ, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, discharge-inpatient-home, IMP, finished, revision, messageHeaderid-STIN, 2, episodeOfCareID-STIN)
* insert createMessage(AN-SLHJ, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, cancel-discharge-inpatient-home, IMP, in-progress, revision, messageHeaderid-SLHJ, 3, episodeOfCareID-SLHJ)


//AN_SLHJ - EMER
Instance: HospitalNotification-TestScript-AN_SLHJ-emer
InstanceOf: TestScript
* insert Metadata
* id = "hospitalmotification-an-slhj-emer"
* name = "Cancellation discharge acute ambulant patient to Home/Primary sector"
* title = "Cancellation discharge acute ambulant patient to Home/Primary sector - AN_SLHJ"
* description = "Testing correct use of cancellation of End hospital Stay"
* insert createInitialMessage(STAA, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, admit-emergency, EMER, in-progress, true)
* insert createMessage(SLHJ, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, discharge-emergency-home, EMER, finished, revision, messageHeaderid-STAA, 2, episodeOfCareID-STAA)
* insert createMessage(AN-SLHJ, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, cancel-discharge-emergency-home, EMER, in-progress, revision, messageHeaderid-SLHJ, 3, episodeOfCareID-SLHJ)


//AN_MORS
Instance: HospitalNotification-TestScript-AN_MORS
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-an-mors"
* name = "Cancellationof deceased inpatient before arrival at the hospital"
* title = "Cancellation of deceased inpatient before arrival at the hospital - MORS"
* description = "Testing correct use of cancellation of deceased inpatient before arrival at the hospital - deceased"
* insert createInitialMessageDeceased(MORS, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, admit-inpatient, IMP, in-progress, false, true) 
* insert createMessageDeceased(AN-MORS, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, admit-inpatient, IMP, in-progress, revision, false, messageHeaderid-MORS, 2, episodeOfCareID-MORS)


 //AN_MORS - EMER
Instance: HospitalNotification-TestScript-AN_MORS-emer
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-an-mors-emer"
* name = "Cancellation Acute ambulant patient, deceased during hospital stay"
* title = "Cancellation Acute ambulant patient, deceased during hospital stay - AN_MORS"
* description = "Testing correct use of cancellation of End hospital Stay - deceased"
* insert createInitialMessage(STAA, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, admit-emergency, EMER, in-progress, true)
* insert createMessageDeceased(MORS, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, admit-emergency, EMER, finished, revision, true, messageHeaderid-STAA, 2, episodeOfCareID-STAA)
* insert createMessageDeceased(AN-MORS, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, admit-emergency, EMER, in-progress, revision, false, messageHeaderid-MORS, 3, episodeOfCareID-MORS)


 //AN_MORS - IMP
Instance: HospitalNotification-TestScript-AN_MORS-STOR
InstanceOf: TestScript
* insert Metadata
* id = "hospitalmotification-an-mors-stor"
* name = "Cancellation Inpatient deceased during a period of leave"
* title = "Cancellation Inpatient deceased during a period of leave - AN_MORS"
* description = "Testing correct use of cancellation of deceased during a period of leave - deceased"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, admit-inpatient, IMP, in-progress, true)
* insert createMessage(STOR, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, start-leave-inpatient, IMP, onleave, revision, messageHeaderid-STIN, 2, episodeOfCareID-STIN)
* insert createMessageDeceased(MORS, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, start-leave-inpatient, IMP, finished, revision, true, messageHeaderid-STOR, 3, episodeOfCareID-STOR)
* insert createMessageDeceased(AN-MORS, 04, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, start-leave-inpatient, IMP, onleave, revision, false, messageHeaderid-MORS, 4, episodeOfCareID-MORS)

 //AN_MORS - STOR
Instance: HospitalNotification-TestScript-AN_MORS-IMP
InstanceOf: TestScript
* insert Metadata
* id = "hospitalmotification-an-mors-imp"
* name = "Cancellation Inpatient deceased during admission"
* title = "Cancellation Inpatient deceased during admission - AN_MORS"
* description = "Testing correct use of cancellation of End hospital Stay - deceased"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, admit-inpatient, IMP, in-progress, true)
* insert createMessageDeceased(MORS, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, admit-inpatient, IMP, finished, revision, true, messageHeaderid-STIN, 2, episodeOfCareID-STIN)
* insert createMessageDeceased(AN-MORS, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, admit-inpatient, IMP, in-progress, revision, false, messageHeaderid-MORS, 3, episodeOfCareID-MORS)
