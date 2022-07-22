//PatientStory-01
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
