  //PF-send-imp-03 - MORS - SLOR
Instance: HospitalNotification-TestScript-PF-send-imp-03
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-PF-send-imp-03"
* name = "Inpatient deceased after a period of leave"
* title = "Inpatient deceased after a period of leave - PF-send-imp-03"
* description = "Testing correct use of End hospital Stay - deseased"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, admit-inpatient, IMP, in-progress, true)
* insert createMessage(STOR, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, start-leave-inpatient, IMP, onleave, revision, messageHeaderid-STIN, 2, episodeOfCareID-STIN)
* insert createMessage(SLOR, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, end-leave-inpatient, IMP, in-progress, revision, messageHeaderid-STOR, 3, episodeOfCareID-STOR)
* insert createMessageDeceased(MORS, 04, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotification.xml, end-leave-inpatient, IMP, finished, revision, true, messageHeaderid-SLOR, 4, episodeOfCareID-SLOR)

/* //AN_STIN - wrong patient
Instance: HospitalNotification-AN_STIN-patient
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-an-stin-patient"
* name = "Cancellation of start hospital stay admission, due to wrong patient"
* title = "Cancellation of start hospital stay admission send - AN_STIN"
* description = "Testing correct use of status Update of Cancellation of start hospital stay admission"
* insert createMessageSetup(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotificationSTIN.xml)
* insert cancelMessage(AN-STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotificationAN-STIN.xml, cancel-admit-inpatient, IMP, entered-in-error, removal, messageHeaderid-01)

//AN_STIN - wrong type of admission
Instance: HospitalNotification-AN_STIN-type
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-an-stin-type"
* name = "Cancellation of start hospital stay admission, due to wrong type of admission"
* title = "Cancellation of start hospital stay admission send - AN_STIN"
* description = "Testing correct use of status Update of Cancellation of start hospital stay admission"
* insert createMessageSetup(STAA, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotificationSTIN.xml)
* insert cancelMessage(AN-STAA, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotificationAN-STIN.xml, cancel-admit-inpatient, IMP, entered-in-error, removal, messageHeaderid-01)
 */


/* //PatientStory-01
Instance: HospitalNotification-PatientStory-01
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-patientstory-01"
* name = "Inpatient admission - discharged to home."
* title = "Inpatient admission - discharged to home - PatientStory-01"
* description = "Testing correct use codes and identifiers"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotificationSTIN.xml, admit-inpatient, IMP, in-progress, false) 
* insert createMessage(SLHJ, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotificationSLHJ-IMP.xml, discharge-inpatient-home, IMP, finished, revision, messageHeaderid-01)

//PatientStory-02
Instance: HospitalNotification-PatientStory-02
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-patientstory-02"
* name = "Inpatient admission - cancellation of admission."
* title = "Inpatient admission - cancellation of admission - PatientStory-02"
* description = "Testing correct use codes and identifiers"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotificationSTIN.xml, admit-inpatient, IMP, in-progress, false) 
* insert cancelMessage(AN_STIN, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotificationAN-STIN.xml, cancel-admit-inpatient, IMP, entered-in-error, removal, messageHeaderid-01)

//PatientStory-02
Instance: HospitalNotification-PatientStory-03
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-patientstory-03"
* name = "Inpatient admission - corrected."
* title = "Inpatient admission - corrected - PatientStory-03"
* description = "Testing correct use codes and identifiers"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotificationSTIN.xml, admit-inpatient, IMP, in-progress, false) 
* insert updateMessage(RE-STIN, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotificationRE-STIN.xml, revise-admit-inpatient, IMP, in-progress, revision, messageHeaderid-01)

//PatientStory-04
Instance: HospitalNotification-PatientStory-04
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-patientstory-04"
* name = "Inpatient admission - discharged to home."
* title = "Inpatient admission - discharged to home - PatientStory-04"
* description = "Testing correct use codes and identifiers"
* insert createInitialMessage(STAA, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotificationSTAA.xml, admit-emergency, EMER, in-progress, true) 
* insert createMessage(SLHJ, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotificationSLHJ-EMER.xml, discharge-emergency-home, EMER, finished, revision, messageHeaderid-01)
 */