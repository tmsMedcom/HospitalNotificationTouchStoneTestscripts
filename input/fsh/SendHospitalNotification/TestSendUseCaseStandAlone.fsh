//STAA
Instance: HospitalNotification-STAA
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-staa"
* name = "Start admission of an acute ambulant patient."
* title = "Create a HospitalNotification message - STAA"
* description = "Testing correct use of status acute-ambulant"
//params createMessage(type, number, fixture, activityCode, encounterClass, encounterStatus)
* insert createInitialMessage(STAA, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotificationSTAA.xml, admit-emergency, EMER, in-progress, true) 

//RE_STAA
Instance: HospitalNotification-RE_STAA
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-re-staa"
* name = "Update of start hospital stay-acute ambulant"
* title = "Update of start hospital stay-acute ambulant - RE_STAA"
* description = "Testing correct use of status stay-acute ambulant"
* insert createMessageSetup(STAA, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotificationSTAA.xml)
* insert updateMessage(RE-STAA, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotificationRE-STAA.xml, revise-admit-emergency, EMER, in-progress, revision)

//AN_STAA
Instance: HospitalNotification-AN_STAA
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-an-staa"
* name = "Cancellation of start hospital stayacute ambulant"
* title = "Cancellation of start hospital stay acute ambulant send - AN_STAA"
* description = "Testing correct use of status stay-acute ambulant"

* insert createMessageSetup(STAA, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotificationSTAA.xml)
* insert cancelMessage(AN-STAA, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotificationAN-STAA.xml, cancel-admit-emergency, EMER, entered-in-error, removal)

//STIN
Instance: HospitalNotification-STIN
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-stin"
* name = "Start admission of an inpatient."
* title = "Create a HospitalNotification message - STIN"
* description = "Testing correct use of status inpatient"

* insert createInitialMessage(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotificationSTIN.xml, admit-inpatient, IMP, in-progress, false) 

//RE_STIN
Instance: HospitalNotification-RE_STIN
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-re-stin"
* name = "Update of start hospital stay-admission"
* title = "Update of start hospital stay-admission - RE_STIN"
* description = "Testing correct use of status Update of start hospital stay-admission"

* insert createMessageSetup(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotificationSTIN.xml)
* insert updateMessage(RE-STIN, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotificationRE-STIN.xml, revise-admit-inpatient, IMP, in-progress, revision)


//AN_STIN
Instance: HospitalNotification-AN_STIN
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-an-stin"
* name = "Cancellation of start hospital stayadmission"
* title = "Cancellation of start hospital stayadmission send - AN_STIN"
* description = "Testing correct use of status Update of Cancellation of start hospital stayadmission"

* insert createMessageSetup(STAA, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotificationSTIN.xml)
* insert cancelMessage(AN-STAA, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotificationAN-STIN.xml, cancel-admit-inpatient, IMP, entered-in-error, removal)


//STOR
Instance: HospitalNotification-STOR
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-stor"
* name = "Start leave of hospital stayadmission"
* title = "Start leave of hospital stayadmission - STOR"
* description = "Testing correct use of status Start leave"

* insert createMessageSetup(STAA, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotificationSTIN.xml)
* insert createMessage(STOR, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotificationSTOR.xml, start-leave-inpatient, IMP, onleave, revision)


/* //RE_STOR
Instance: HN-send-revise-start-leave-inpatient
InstanceOf: TestScript
* insert Metadata
* id = "HN-revise-start-leave-inpatient"
* name = "Update of Start leave"
* title = "Update of Start leave send"
* description = "Testing correct use of Update of Start leave"

* insert createMessage(RE-STOR, 01, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-RE_STOR.xml,
 revise-start-leave-inpatient, IMP, on-leave, NA, source)


//AN_STOR
Instance: HN-send-cancel-start-leave-inpatient
InstanceOf: TestScript
* insert Metadata
* id = "HN-cancel-start-leave-inpatient"
* name = "Update of Start leave"
* title = "Update of Start leave send"
* description = "Testing correct use of Update of Start leave"

* insert createMessage(AN-STOR, 01, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-AN_STOR.xml,
 cancel-start-leave-inpatient, IMP, in-progress, NA, source)
 */
//SLOR
Instance: HospitalNotification-SLOR
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-slor"
* name = "End leave of hospital stayadmission"
* title = "End leave of hospital stayadmission - SLOR"
* description = "Testing correct use of status End leave"
* insert createMessageSetup(STOR, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotificationSTOR.xml)
* insert createMessage(STOR, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotificationSLOR.xml, end-leave-inpatient, IMP, in-progress, revision)

/*  //RE_SLOR
Instance: HN-send-revise-end-leave-inpatient
InstanceOf: TestScript
* insert Metadata
* id = "HN-revise-end-leave-inpatient"
* name = "revise-end-leave-inpatient"
* title = "revise-end-leave-inpatient"
* description = "Testing correct use of revise-end-leave-inpatient"

* insert createMessage(RE-SLOR, 01, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-RE_SLOR.xml,
 revise-end-leave-inpatient, IMP, in-progress, NA, source)

  //AN_SLOR
Instance: HN-send-cancel-end-leave-inpatient
InstanceOf: TestScript
* insert Metadata
* id = "HN-cancel-end-leave-inpatient"
* name = "cancel-end-leave-inpatient"
* title = "cancel-end-leave-inpatient"
* description = "Testing correct use of cancel-end-leave-inpatient"

* insert createMessage(AN-SLOR, 01, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-AN_SLOR.xml,
 cancel-end-leave-inpatient, IMP, on-leave, NA, source)
 */
//SLHJ - IMP
Instance: HospitalNotification-SLHJ-IMP
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-slhj-imp"
* name = "Discharge inpatient to home"
* title = "Discharge inpatient to home - SLHJ-IMP"
* description = "Testing correct use of End hospital Stay- patient discharged to home/primary sector"
* insert createMessageSetup(STAA, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotificationSTIN.xml)
* insert createMessage(SLHJ, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotificationSLHJ-IMP.xml, discharge-inpatient-home, IMP, finished, revision)

/* //RE_SLHJ - IMP
Instance: HN-send-revise-discharge-inpatient-home
InstanceOf: TestScript
* insert Metadata
* id = "HN-revise-discharge-inpatient-home"
* name = "revise-discharge-inpatient-home"
* title = "revise-discharge-inpatient-home"
* description = "Testing correct use of Update of End hospital Stay"

* insert createMessage(RE-SLHJ-IMP, 01, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-RE_SLHJ.xml,
 revise-discharge-inpatient-home, IMP, finished, NA, source)

 //AN_SLHJ - IMP
Instance: HN-send-cancel-discharge-inpatient-home
InstanceOf: TestScript
* insert Metadata
* id = "HN-cancel-discharge-inpatient-home"
* name = "cancel-discharge-inpatient-home"
* title = "cancel-discharge-inpatient-home"
* description = "Testing correct use of Cancellation of End hospital Stay"

* insert createMessage(AN-SLHJ-IMP, 01, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-AN-SLHJ.xml,
 cancel-discharge-inpatient-home, IMP, in-progress, NA, source)
 */
   //SLHJ - EMER
Instance: HospitalNotification-SLHJ-EMER
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-slhj-emer"
* name = "Discharge acute ambulant patient to home"
* title = "Discharge acute ambulant patient to home - SLHJ-EMER"
* description = "Testing correct use of End hospital Stay - patient discharged to home/primary sector"
* insert createMessageSetup(STAA, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotificationSTIN.xml)
* insert createMessage(SLHJ-EMER, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotificationSLHJ-EMER.xml, discharge-emergency-home, EMER, finished, revision)

/*  //RE_SLHJ - EMER
Instance: HN-send-revise-discharge-emergency-home
InstanceOf: TestScript
* insert Metadata
* id = "HN-revise-discharge-emergency-home"
* name = "revise-discharge-emergency-home"
* title = "revise-discharge-emergency-home"
* description = "Testing correct use of Update of End hospital Stay"

* insert createMessage(RE-SLHJ-EMER, 01, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-RE_SLHJ.xml,
 revise-discharge-emergency-home, EMER, finished, NA, source)

 //AN_SLHJ - EMER
Instance: HN-send-cancel-discharge-emergency-home
InstanceOf: TestScript
* insert Metadata
* id = "HN-cancel-discharge-emergency-home"
* name = "cancel-discharge-emergency-home"
* title = "cancel-discharge-emergency-home"
* description = "Testing correct use of Cancellation of End hospital Stay"

* insert createMessage(AN-SLHJ-EMER, 01, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-AN-SLHJ.xml,
 cancel-discharge-emergency-home, EMER, in-progress, NA, source)
 */

//MORS - EMER
Instance: HospitalNotification-MORS-EMER
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-mors-emer"
* name = "Acute ambulant patient, deceased during hospital stay"
* title = "Acute ambulant patient, deceased during hospital stay - MORS-EMER"
* description = "Testing correct use of End hospital Stay-deseased"
* insert createMessageSetup(STAA, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotificationSTAA.xml)
* insert createMessageDeceased(MORS-EMER, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotificationMORS-EMER.xml,
 admit-emergency, EMER, finished, revision, true)

 //MORS - IMP
Instance: HospitalNotification-MORS-IMP
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-mors-imp"
* name = "Inpatient deceased during hospital stay"
* title = "Inpatient deceased during hospital stay - MORS-IMP"
* description = "Testing correct use of End hospital Stay-deseased"
* insert createMessageSetup(STAA, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotificationSTIN.xml)
* insert createMessageDeceased(MORS-IMP, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotificationMORS-IMP.xml,
 admit-inpatient, IMP, finished, revision, true)

/*  //RE_MORS - EMER
Instance: HN-send-revise-discharge-emergency-home-mors
InstanceOf: TestScript
* insert Metadata
* id = "HN-revise-discharge-emergency-home-re-deseased"
* name = "revise-discharge-emergency-home-re-deseased"
* title = "Update of deseased"
* description = "Testing correct use of Update of End hospital Stay"

* insert createMessageDeceased(RE-SLHJ-EMER, 01, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-RE_MORS.xml,
 revise-discharge-emergency-home, EMER, finished, NA, source, true)

 //RE_MORS - IMP
Instance: HN-send-revise-discharge-inpatient-home-mors
InstanceOf: TestScript
* insert Metadata
* id = "HN-revise-discharge-inpatient-home-re-deseased"
* name = "revise-discharge-inpatient-home-re-deseased"
* title = "Update of deseased"
* description = "Testing correct use of Update of deseased"

* insert createMessageDeceased(RE-SLHJ-IMP, 01, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-RE_MORS.xml,
 revise-discharge-inpatient-home, IMP, finished, NA, source, true)
 */
/*   //AN_MORS - EMER
Instance: HN-send-cancel-discharge-emergency-home-an-mors
InstanceOf: TestScript
* insert Metadata
* id = "HN-Cancellation-of-deseased-emer"
* name = "Cancellation-of-deseased-emer"
* title = "Cancellation-of-deseased"
* description = "Testing correct use of Cancellation-of-deseased"

* insert createMessageDeceased(AN-SLHJ-EMER, 01, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-AN_MORS.xml,
 cancel-discharge-emergency-home, EMER, in-progress, NA, source, false)

 //AN_MORS - IMP
Instance: HN-send-cancel-discharge-inpatient-home-an-mors
InstanceOf: TestScript
* insert Metadata
* id = "HN-Cancellation-of-deseased-imp"
* name = "Cancellation-of-deseased-imp"
* title = "Cancellation-of-deseased-imp"
* description = "Testing correct use of Cancellation-of-deseased-imp"

* insert createMessageDeceased(AN-SLHJ-IMP, 01, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-AN_MORS.xml,
 cancel-discharge-inpatient-home, IMP, in-progress, NA, source, false) */
