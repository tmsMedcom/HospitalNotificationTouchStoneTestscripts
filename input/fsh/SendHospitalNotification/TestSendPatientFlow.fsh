 //PF-send-imp-01 - STIN-STOR-SLOR-SLHJ
Instance: HospitalNotification-TestScript-PF-send-imp-01
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-PF-send-imp-01"
* name = "Send: Admit patient, register patient as being on leave, register patient as returned from leave, discharge patient."
* title = "Send: Admit patient, register patient as being on leave, register patient as returned from leave, discharge patient. - PF-send-imp-01"
* description = "Testing correct use of send HospitalNotification"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-inpatient, IMP, in-progress, true)
* insert createMessage(STOR, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, start-leave-inpatient, IMP, onleave, revision, messageHeaderid-STIN, 2, episodeOfCareID-STIN)
* insert createMessage(SLOR, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, end-leave-inpatient, IMP, in-progress, revision, messageHeaderid-STOR, 3, episodeOfCareID-STOR)
* insert createMessage(SLHJ, 04, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, discharge-patient-home, IMP, finished, revision, messageHeaderid-SLOR, 4, episodeOfCareID-SLOR)

 //PF-send-imp-02 - STIN-STOR-SLHJ
Instance: HospitalNotification-TestScript-PF-send-imp-02
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-PF-send-imp-02"
* name = "Send: Admit patient, register patient as being on leave, patient doesn’t return from leave, discharge patient."
* title = "Send: Admit patient, register patient as being on leave, patient doesn’t return from leave, discharge patient. - PF-send-imp-02"
* description = "Testing correct use of send HospitalNotification"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-inpatient, IMP, in-progress, true)
* insert createMessage(STOR, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, start-leave-inpatient, IMP, onleave, revision, messageHeaderid-STIN, 2, episodeOfCareID-STIN)
* insert createMessage(SLHJ, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, discharge-patient-home, IMP, finished, revision, messageHeaderid-STOR, 3, episodeOfCareID-STOR)

 //PF-send-imp-03 - MORS - SLOR
Instance: HospitalNotification-TestScript-PF-send-imp-03
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-PF-send-imp-03"
* name = "Send: Admit patient, register patient as being on leave, patient returns from leave, patient dies"
* title = "Send: Admit patient, register patient as being on leave, patient returns from leave, patient dies - PF-send-imp-03"
* description = "Testing correct use of send HospitalNotification - deceased"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-inpatient, IMP, in-progress, true)
* insert createMessage(STOR, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, start-leave-inpatient, IMP, onleave, revision, messageHeaderid-STIN, 2, episodeOfCareID-STIN)
* insert createMessage(SLOR, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, end-leave-inpatient, IMP, in-progress, revision, messageHeaderid-STOR, 3, episodeOfCareID-STOR)
* insert createMessageDeceased(MORS, 04, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, end-leave-inpatient, IMP, finished, revision, true, messageHeaderid-SLOR, 4, episodeOfCareID-SLOR)

 //PF-send-imp-04 - STIN-STOR-SLOR-STOR-SLOR-SLHJ
Instance: HospitalNotification-TestScript-PF-send-imp-04
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-PF-send-imp-04"
* name = "Send: Admit patient, *register patient as being on leave, patient returns from leave*, * to * x2 "
* title = "Send: Admit patient, *register patient as being on leave, patient returns from leave*, * to * x2 - PF-send-imp-04"
* description = "Testing correct use of send HospitalNotification"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-inpatient, IMP, in-progress, true)
* insert createMessage(STOR, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, start-leave-inpatient, IMP, onleave, revision, messageHeaderid-STIN, 2, episodeOfCareID-STIN)
* insert createMessage(SLOR, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, end-leave-inpatient, IMP, in-progress, revision, messageHeaderid-STOR, 3, episodeOfCareID-STOR)
* insert createMessage(STOR, 04, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, start-leave-inpatient, IMP, onleave, revision, messageHeaderid-STIN, 4, episodeOfCareID-STIN)
* insert createMessage(SLOR, 05, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, end-leave-inpatient, IMP, in-progress, revision, messageHeaderid-STOR, 5, episodeOfCareID-STOR)

 //PF-send-imp-05 - STIN-RE_STIN
Instance: HospitalNotification-TestScript-PF-send-imp-05
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-PF-send-imp-05"
* name = "Send: Admit patient, correct message due to incorrect hospital department. Evaluation is based on GLN number."
* title = "Send: Admit patient, correct message due to incorrect hospital department. Evaluation is based on GLN number.- PF-send-imp-02"
* description = "Testing correct use of send HospitalNotification"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, admit-inpatient, IMP, in-progress, true)
* insert variableHospitalGLN(STIN)
* insert createMessage(RE-STIN, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture.xml, revise-admit-inpatient, IMP, in-progress, revision, messageHeaderid-STIN, 2, episodeOfCareID-STIN)
* insert assertHospitalGLN(hospitalGLN-STIN)


/* //AN_STIN - wrong patient
Instance: HospitalNotification-AN_STIN-patient
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-an-stin-patient"
* name = "Cancellation of start hospital stay admission, due to wrong patient"
* title = "Cancellation of start hospital stay admission send - AN_STIN"
* description = "Testing correct use of status Update of Cancellation of start hospital stay admission"
* insert createMessageSetup(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixtureSTIN.xml)
* insert cancelMessage(AN-STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixtureAN-STIN.xml, cancel-admit-inpatient, IMP, entered-in-error, removal, messageHeaderid-01)

//AN_STIN - wrong type of admission
Instance: HospitalNotification-AN_STIN-type
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-an-stin-type"
* name = "Cancellation of start hospital stay admission, due to wrong type of admission"
* title = "Cancellation of start hospital stay admission send - AN_STIN"
* description = "Testing correct use of status Update of Cancellation of start hospital stay admission"
* insert createMessageSetup(STAA, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixtureSTIN.xml)
* insert cancelMessage(AN-STAA, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixtureAN-STIN.xml, cancel-admit-inpatient, IMP, entered-in-error, removal, messageHeaderid-01)
 */


/* //PatientStory-01
Instance: HospitalNotification-PatientStory-01
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-patientstory-01"
* name = "Inpatient admission - discharged to home."
* title = "Inpatient admission - discharged to home - PatientStory-01"
* description = "Testing correct use codes and identifiers"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixtureSTIN.xml, admit-inpatient, IMP, in-progress, false) 
* insert createMessage(SLHJ, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixtureSLHJ-IMP.xml, discharge-inpatient-home, IMP, finished, revision, messageHeaderid-01)

//PatientStory-02
Instance: HospitalNotification-PatientStory-02
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-patientstory-02"
* name = "Inpatient admission - cancellation of admission."
* title = "Inpatient admission - cancellation of admission - PatientStory-02"
* description = "Testing correct use codes and identifiers"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixtureSTIN.xml, admit-inpatient, IMP, in-progress, false) 
* insert cancelMessage(AN_STIN, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixtureAN-STIN.xml, cancel-admit-inpatient, IMP, entered-in-error, removal, messageHeaderid-01)

//PatientStory-02
Instance: HospitalNotification-PatientStory-03
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-patientstory-03"
* name = "Inpatient admission - corrected."
* title = "Inpatient admission - corrected - PatientStory-03"
* description = "Testing correct use codes and identifiers"
* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixtureSTIN.xml, admit-inpatient, IMP, in-progress, false) 
* insert updateMessage(RE-STIN, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixtureRE-STIN.xml, revise-admit-inpatient, IMP, in-progress, revision, messageHeaderid-01)

//PatientStory-04
Instance: HospitalNotification-PatientStory-04
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-patientstory-04"
* name = "Inpatient admission - discharged to home."
* title = "Inpatient admission - discharged to home - PatientStory-04"
* description = "Testing correct use codes and identifiers"
* insert createInitialMessage(STAA, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixtureSTAA.xml, admit-emergency, EMER, in-progress, true) 
* insert createMessage(SLHJ, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixtureSLHJ-EMER.xml, discharge-emergency-home, EMER, finished, revision, messageHeaderid-01)
 */