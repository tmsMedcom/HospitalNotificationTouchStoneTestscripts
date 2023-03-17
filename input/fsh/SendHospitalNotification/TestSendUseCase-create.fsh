//STIN.A1
Instance: HospitalNotification-TestScript-STIN-A1
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-stin-a1"
* name = "Start admission of an inpatient, withou request for a report of admission."
* title = "Create a HospitalNotification message - STIN.A1"
* description = "Testing correct use of status inpatient"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, admit-inpatient, IMP, in-progress, false) 

//STIN
Instance: HospitalNotification-TestScript-STIN
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-stin"
* name = "Start admission of an inpatient."
* title = "Create a HospitalNotification message - STIN"
* description = "Testing correct use of status inpatient"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, admit-inpatient, IMP, in-progress, true) 

//STAA
Instance: HospitalNotification-TestScript-STAA
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-staa"
* name = "Start admission of an acute ambulant patient."
* title = "Create a HospitalNotification message - STAA"
* description = "Testing correct use of status acute-ambulant"
* insert createInitialMessage(STAA, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, admit-emergency, EMER, in-progress, true) 

//STOR
Instance: HospitalNotification-TestScript-STOR
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-stor"
* name = "Start leave of hospital stay admission"
* title = "Start leave of hospital stay admission - STOR"
* description = "Testing correct use of status Start leave"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, admit-inpatient, IMP, in-progress, true)
* insert createMessage(STOR, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, start-leave-inpatient, IMP, onleave, revision, messageHeaderid-STIN, 2, episodeOfCareID-STIN)

//SLOR
Instance: HospitalNotification-TestScript-SLOR
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-slor"
* name = "End leave of hospital stay admission"
* title = "End leave of hospital stay admission - SLOR"
* description = "Testing correct use of status End leave"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, admit-inpatient, IMP, in-progress, true)
* insert createMessage(STOR, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, start-leave-inpatient, IMP, onleave, revision, messageHeaderid-STIN, 2, episodeOfCareID-STIN)
* insert createMessage(SLOR, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, end-leave-inpatient, IMP, in-progress, revision, messageHeaderid-STOR, 3, episodeOfCareID-STOR)

//SLHJ - IMP
Instance: HospitalNotification-TestScript-SLHJ-imp
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-slhj-imp"
* name = "Discharge inpatient to home"
* title = "Discharge inpatient to home - SLHJ-imp"
* description = "Testing correct use of End hospital Stay- patient discharged to home/primary sector"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, admit-inpatient, IMP, in-progress, true)
* insert createMessage(SLHJ, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, discharge-inpatient-home, IMP, finished, revision, messageHeaderid-STIN, 2, episodeOfCareID-STIN)

 //SLHJ - EMER
Instance: HospitalNotification-TestScript-SLHJ-EMER
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-slhj-emer"
* name = "Discharge acute ambulant patient to home"
* title = "Discharge acute ambulant patient to home - SLHJ-EMER"
* description = "Testing correct use of End hospital Stay - patient discharged to home/primary sector"
* insert createInitialMessage(STAA, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, admit-emergency, EMER, in-progress, true)
* insert createMessage(SLHJ, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, discharge-emergency-home, EMER, finished, revision, messageHeaderid-STAA, 2, episodeOfCareID-STAA)

//STIN
Instance: HospitalNotification-TestScript-MORS
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-mors"
* name = "Start admission of an inpatient."
* title = "Create a HospitalNotification message - MORS"
* description = "Testing correct use of status inpatient"
* insert createInitialMessageDeceased(MORS, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, admit-inpatient, IMP, in-progress, false, true) 

//MORS - EMER
Instance: HospitalNotification-TestScript-MORS-EMER
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-mors-emer"
* name = "Acute ambulant patient, deceased during hospital stay"
* title = "Acute ambulant patient, deceased during hospital stay - MORS-EMER"
* description = "Testing correct use of End hospital Stay-deseased"
* insert createInitialMessage(STAA, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, admit-emergency, EMER, in-progress, true)
* insert createMessageDeceased(MORS, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, admit-emergency, EMER, finished, revision, true, messageHeaderid-STAA, 2, episodeOfCareID-STAA)
 
 //MORS - STOR
Instance: HospitalNotification-TestScript-MORS-STOR
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-mors-stor"
* name = "Inpatient deceased during a period of leave"
* title = "Inpatient deceased during period of leave - MORS-STOR"
* description = "Testing correct use of End hospital Stay - deseased"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, admit-inpatient, IMP, in-progress, true)
* insert createMessage(STOR, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, start-leave-inpatient, IMP, onleave, revision, messageHeaderid-STIN, 2, episodeOfCareID-STIN)
* insert createMessageDeceased(MORS, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, start-leave-inpatient, IMP, finished, revision, true, messageHeaderid-STOR, 3, episodeOfCareID-STOR)
 
 //MORS - IMP
Instance: HospitalNotification-TestScript-MORS-IMP
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-mors-imp"
* name = "Inpatient deceased during admission"
* title = "Inpatient deceased during admission - MORS-IMP"
* description = "Testing correct use of End hospital Stay - deseased"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, admit-inpatient, IMP, in-progress, true)
* insert createMessageDeceased(MORS, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, admit-inpatient, IMP, finished, revision, true, messageHeaderid-STIN, 2, episodeOfCareID-STIN)
 

//SLHJ - IMP
Instance: HospitalNotification-TestScript-SLHJ-imp-timestamptest
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-slhj-imp-timestamptest"
* name = "Discharge inpatient to home"
* title = "Discharge inpatient to home - SLHJ-imp-timestamptest"
* description = "Testing correct use of End hospital Stay- patient discharged to home/primary sector"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, admit-inpatient, IMP, in-progress, true)
* insert createMessage(SLHJ, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, discharge-inpatient-home, IMP, finished, revision, messageHeaderid-STIN, 2, episodeOfCareID-STIN)
