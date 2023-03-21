/* //STIN.A1
Instance: HospitalNotification-TestScript-STIN-A1
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-send-stin-a1"
* name = "Send: Start hospital stay - admitted, without request for a reportOfAdmission."
* title = "Send: Start hospital stay - admitted - STIN.A1"
* description = "Testing correct use of status inpatient"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-inpatient, IMP, in-progress, false) 

//STIN
Instance: HospitalNotification-TestScript-STIN
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-send-stin"
* name = "Send: Start hospital stay - admitted."
* title = "Send: Start hospital stay - admitted - STIN"
* description = "Testing correct use of status inpatient"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-inpatient, IMP, in-progress, true) 

//STAA
Instance: HospitalNotification-TestScript-STAA
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-send-staa"
* name = "Send: Start hospital stay - acute ambulant."
* title = "Send: Start hospital stay - acute ambulant - STAA"
* description = "Testing correct use of status acute-ambulant"
* insert createInitialMessage(STAA, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-emergency, EMER, in-progress, true) 

//STOR
Instance: HospitalNotification-TestScript-STOR
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-send-stor"
* name = "Send: Start leave"
* title = "Send: Start leave - STOR"
* description = "Testing correct use of status Start leave"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-inpatient, IMP, in-progress, true)
* insert createMessage(STOR, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, start-leave-inpatient, IMP, onleave, revision, messageHeaderid-STIN, 2, episodeOfCareID-STIN)

//SLOR
Instance: HospitalNotification-TestScript-SLOR
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-send-slor"
* name = "Send: End leave"
* title = "Send: End leave - SLOR"
* description = "Testing correct use of status End leave"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-inpatient, IMP, in-progress, true)
* insert createMessage(STOR, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, start-leave-inpatient, IMP, onleave, revision, messageHeaderid-STIN, 2, episodeOfCareID-STIN)
* insert createMessage(SLOR, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, end-leave-inpatient, IMP, in-progress, revision, messageHeaderid-STOR, 3, episodeOfCareID-STOR)

//SLHJ - IMP
Instance: HospitalNotification-TestScript-SLHJ-imp
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-send-slhj-imp"
* name = "Send: End hospital stay - patient completed to home/primary sector"
* title = "Send: End hospital stay - patient completed to home/primary sector - SLHJ-imp"
* description = "Testing correct use of End hospital Stay- patient discharged to home/primary sector"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-inpatient, IMP, in-progress, true)
* insert createMessage(SLHJ, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, discharge-inpatient-home, IMP, finished, revision, messageHeaderid-STIN, 2, episodeOfCareID-STIN)

 //SLHJ - EMER
Instance: HospitalNotification-TestScript-SLHJ-EMER
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-send-slhj-emer"
* name = "Send: End hospital stay - patient completed to home/primary sector"
* title = "Send: End hospital stay - patient completed to home/primary sector - SLHJ-emer"
* description = "Testing correct use of End hospital Stay - patient discharged to home/primary sector"
* insert createInitialMessage(STAA, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-emergency, EMER, in-progress, true)
* insert createMessage(SLHJ, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, discharge-emergency-home, EMER, finished, revision, messageHeaderid-STAA, 2, episodeOfCareID-STAA)

//MORS
Instance: HospitalNotification-TestScript-MORS
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-send-mors"
* name = "Send: Deceased - dead at arrival to the hospital."
* title = "Send: Deceased - dead at arrival to the hospital - MORS"
* description = "Testing correct use of status inpatient"
* insert createInitialMessageDeceased(MORS, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-inpatient, IMP, in-progress, false, true) 

//MORS - EMER
Instance: HospitalNotification-TestScript-MORS-EMER
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-send-mors-emer"
* name = "Send: Deceased -  dies during hospital stay"
* title = "Send: Deceased -  dies during hospital stay - MORS-EMER"
* description = "Testing correct use of End hospital Stay-deseased"
* insert createInitialMessage(STAA, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-emergency, EMER, in-progress, true)
* insert createMessageDeceased(MORS, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-emergency, EMER, finished, revision, true, messageHeaderid-STAA, 2, episodeOfCareID-STAA)
 
 //MORS - STOR
Instance: HospitalNotification-TestScript-MORS-STOR
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-send-mors-stor"
* name = "Send: Deceased - dies during a period of leave"
* title = "Send: Deceased - dies during period of leave - MORS-STOR"
* description = "Testing correct use of End hospital Stay - deseased"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-inpatient, IMP, in-progress, true)
* insert createMessage(STOR, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, start-leave-inpatient, IMP, onleave, revision, messageHeaderid-STIN, 2, episodeOfCareID-STIN)
* insert createMessageDeceased(MORS, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, start-leave-inpatient, IMP, finished, revision, true, messageHeaderid-STOR, 3, episodeOfCareID-STOR)
 
 //MORS - IMP
Instance: HospitalNotification-TestScript-MORS-IMP
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-send-mors-imp"
* name = "Send: Deceased - deceased during admission"
* title = "Send: Deceased - deceased during admission - MORS-IMP"
* description = "Testing correct use of End hospital Stay - deseased"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-inpatient, IMP, in-progress, true)
* insert createMessageDeceased(MORS, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-inpatient, IMP, finished, revision, true, messageHeaderid-STIN, 2, episodeOfCareID-STIN)
 

//SLHJ - IMP
Instance: HospitalNotification-TestScript-SLHJ-imp-timestamptest
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-send-slhj-imp-timestamptest"
* name = "Send: End hospital stay - patient completed to home/primary sector"
* title = "Send: End hospital stay - patient completed to home/primary sector - SLHJ-imp-timestamptest"
* description = "Testing correct use of End hospital Stay- patient discharged to home/primary sector"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-inpatient, IMP, in-progress, true)
* insert createMessage(SLHJ, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, discharge-inpatient-home, IMP, finished, revision, messageHeaderid-STIN, 2, episodeOfCareID-STIN)
 */