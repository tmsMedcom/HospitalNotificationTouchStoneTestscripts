//STAA
Instance: HS-send-admit-emergency
InstanceOf: TestScript
* insert Metadata
* id = "HS-admit-emergency"
* name = "Start hospital admit-emergency"
* title = "hospitalNotification-message admit-emergency send"
* description = "Testing correct use of status admit-emergency"
//params createHNSendTest(type, number, fixture, activityCode, encounterClass, encounterStatus, whatRefference, role)
//Once per testscript whatRefference= first is NA efterwards preveious messageheader
* insert createHNSendTest(STAA, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-STAA.xml,
 admit-emergency, EMER, in-progress, NA, source) 

//RE_STAA
Instance: HS-send-revise-admit-emergency
InstanceOf: TestScript
* insert Metadata
* id = "HS-revise-admit-emergency"
* name = "Update of start hospital stay-acute ambulant"
* title = "hospitalNotification-message Update of start hospital stay-acute ambulant send"
* description = "Testing correct use of status stay-acute ambulant"
//params createHNSendTest(type, number, fixture, activityCode, encounterClass, encounterStatus, whatRefference, role)
//Once per testscript whatRefference= first is NA efterwards preveious messageheader
* insert createHNSendTest(RE-STAA, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-RE_STAA.xml,
 revise-admit-emergency, EMER, in-progress, NA, source)

//AN_STAA
Instance: HS-send-cancel-admit-emergency
InstanceOf: TestScript
* insert Metadata
* id = "HS-cancel-admit-emergency"
* name = "Cancellation of start hospital stayacute ambulant"
* title = "hospitalNotification-message Cancellation of start hospital stayacute ambulant send"
* description = "Testing correct use of status stay-acute ambulant"
//params createHNSendTest(type, number, fixture, activityCode, encounterClass, encounterStatus, whatRefference, role)
//Once per testscript whatRefference= first is NA efterwards preveious messageheader
* insert createHNSendTest(AN-STAA, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-AN_STAA.xml,
 cancel-admit-emergency, EMER, entered-in-error, NA, source)

//STIN
Instance: HS-send-admit-inpatient
InstanceOf: TestScript
* insert Metadata
* id = "HS-admit-inpatient"
* name = "Start hospital stay-admission"
* title = "hospitalNotification-message admit-inpatient send"
* description = "Testing correct use of status admit-inpatient"
//params createHNSendTest(type, number, fixture, activityCode, encounterClass, encounterStatus, whatRefference, role)
//Once per testscript whatRefference= first is NA efterwards preveious messageheader
* insert createHNSendTest(STIN, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-STIN-UF_H_V_1.xml,
 admit-inpatient, IMP, in-progress, NA, source) 


//RE_STIN
Instance: HS-send-revise-admit-inpatient
InstanceOf: TestScript
* insert Metadata
* id = "HS-revise-admit-inpatient"
* name = "Update of start hospital stay-admission"
* title = "hospitalNotification-message Update of start hospital stay-admission send"
* description = "Testing correct use of status Update of start hospital stay-admission"
//params createHNSendTest(type, number, fixture, activityCode, encounterClass, encounterStatus, whatRefference, role)
//Once per testscript whatRefference= first is NA efterwards preveious messageheader
* insert createHNSendTest(RE-STIN, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-RE_STIN.xml,
 revise-admit-inpatient, IMP, in-progress, NA, source)


//AN_STIN
Instance: HS-send-cancel-admit-inpatient
InstanceOf: TestScript
* insert Metadata
* id = "HS-cancel-admit-inpatient"
* name = "Cancellation of start hospital stayadmission"
* title = "hospitalNotification-message Cancellation of start hospital stayadmission send"
* description = "Testing correct use of status Update of Cancellation of start hospital stayadmission"
//params createHNSendTest(type, number, fixture, activityCode, encounterClass, encounterStatus, whatRefference, role)
//Once per testscript whatRefference= first is NA efterwards preveious messageheader
* insert createHNSendTest(AN-STIN, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-AN_STIN.xml,
 cancel-admit-inpatient, IMP, entered-in-error, NA, source)


//STOR
Instance: HS-send-start-leave-inpatient
InstanceOf: TestScript
* insert Metadata
* id = "HS-start-leave-inpatient"
* name = "Start leave"
* title = "hospitalNotification-message Cancellation of Start leave send"
* description = "Testing correct use of status Start leave"
//params createHNSendTest(type, number, fixture, activityCode, encounterClass, encounterStatus, whatRefference, role)
//Once per testscript whatRefference= first is NA efterwards preveious messageheader
* insert createHNSendTest(STOR, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-STOR.xml,
 start-leave-inpatient, IMP, on-leave, NA, source)


//RE_STOR
Instance: HS-send-revise-start-leave-inpatient
InstanceOf: TestScript
* insert Metadata
* id = "HS-revise-start-leave-inpatient"
* name = "Update of Start leave"
* title = "hospitalNotification-message Update of Start leave send"
* description = "Testing correct use of Update of Start leave"
//params createHNSendTest(type, number, fixture, activityCode, encounterClass, encounterStatus, whatRefference, role)
//Once per testscript whatRefference= first is NA efterwards preveious messageheader
* insert createHNSendTest(RE-STOR, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-RE_STOR.xml,
 revise-start-leave-inpatient, IMP, on-leave, NA, source)


//AN_STOR
Instance: HS-send-cancel-start-leave-inpatient
InstanceOf: TestScript
* insert Metadata
* id = "HS-cancel-start-leave-inpatient"
* name = "Update of Start leave"
* title = "hospitalNotification-message Update of Start leave send"
* description = "Testing correct use of Update of Start leave"
//params createHNSendTest(type, number, fixture, activityCode, encounterClass, encounterStatus, whatRefference, role)
//Once per testscript whatRefference= first is NA efterwards preveious messageheader
* insert createHNSendTest(AN-STOR, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-AN_STOR.xml,
 cancel-start-leave-inpatient, IMP, in-progress, NA, source)

//SLOR
Instance: HS-send-end-leave-inpatient
InstanceOf: TestScript
* insert Metadata
* id = "HS-end-leave-inpatient"
* name = "end-leave-inpatient"
* title = "hospitalNotification-message end-leave-inpatient"
* description = "Testing correct use of end-leave-inpatient"
//params createHNSendTest(type, number, fixture, activityCode, encounterClass, encounterStatus, whatRefference, role)
//Once per testscript whatRefference= first is NA efterwards preveious messageheader
* insert createHNSendTest(SLOR, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-SLOR.xml,
 end-leave-inpatient, IMP, in-progress, NA, source)

 //RE_SLOR
Instance: HS-send-revise-end-leave-inpatient
InstanceOf: TestScript
* insert Metadata
* id = "HS-revise-end-leave-inpatient"
* name = "revise-end-leave-inpatient"
* title = "hospitalNotification-message revise-end-leave-inpatient"
* description = "Testing correct use of revise-end-leave-inpatient"
//params createHNSendTest(type, number, fixture, activityCode, encounterClass, encounterStatus, whatRefference, role)
//Once per testscript whatRefference= first is NA efterwards preveious messageheader
* insert createHNSendTest(RE-SLOR, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-RE_SLOR.xml,
 revise-end-leave-inpatient, IMP, in-progress, NA, source)

  //AN_SLOR
Instance: HS-send-cancel-end-leave-inpatient
InstanceOf: TestScript
* insert Metadata
* id = "HS-cancel-end-leave-inpatient"
* name = "cancel-end-leave-inpatient"
* title = "hospitalNotification-message cancel-end-leave-inpatient"
* description = "Testing correct use of cancel-end-leave-inpatient"
//params createHNSendTest(type, number, fixture, activityCode, encounterClass, encounterStatus, whatRefference, role)
//Once per testscript whatRefference= first is NA efterwards preveious messageheader
* insert createHNSendTest(AN-SLOR, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-AN_SLOR.xml,
 cancel-end-leave-inpatient, IMP, on-leave, NA, source)

//SLHJ - IMP
Instance: HS-send-discharge-inpatient-home
InstanceOf: TestScript
* insert Metadata
* id = "HS-discharge-inpatient-home"
* name = "discharge-inpatient-home"
* title = "hospitalNotification-message discharge-inpatient-home"
* description = "Testing correct use of End hospital Stay- patient dischargedto home/primary sector"
//params createHNSendTest(type, number, fixture, activityCode, encounterClass, encounterStatus, whatRefference, role)
//Once per testscript whatRefference= first is NA efterwards preveious messageheader
* insert createHNSendTest(SLHJ-IMP, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-SLHJ.xml,
 discharge-inpatient-home, IMP, finished, NA, source)

//RE_SLHJ - IMP
Instance: HS-send-revise-discharge-inpatient-home
InstanceOf: TestScript
* insert Metadata
* id = "HS-revise-discharge-inpatient-home"
* name = "revise-discharge-inpatient-home"
* title = "hospitalNotification-message revise-discharge-inpatient-home"
* description = "Testing correct use of Update of End hospital Stay"
//params createHNSendTest(type, number, fixture, activityCode, encounterClass, encounterStatus, whatRefference, role)
//Once per testscript whatRefference= first is NA efterwards preveious messageheader
* insert createHNSendTest(RE-SLHJ-IMP, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-RE_SLHJ.xml,
 revise-discharge-inpatient-home, IMP, finished, NA, source)

 //AN_SLHJ - IMP
Instance: HS-send-cancel-discharge-inpatient-home
InstanceOf: TestScript
* insert Metadata
* id = "HS-cancel-discharge-inpatient-home"
* name = "cancel-discharge-inpatient-home"
* title = "hospitalNotification-message cancel-discharge-inpatient-home"
* description = "Testing correct use of Cancellation of End hospital Stay"
//params createHNSendTest(type, number, fixture, activityCode, encounterClass, encounterStatus, whatRefference, role)
//Once per testscript whatRefference= first is NA efterwards preveious messageheader
* insert createHNSendTest(AN-SLHJ-IMP, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-AN-SLHJ.xml,
 cancel-discharge-inpatient-home, IMP, in-progress, NA, source)




   //SLHJ - EMER
Instance: HS-send-discharge-emergency-home
InstanceOf: TestScript
* insert Metadata
* id = "HS-discharge-emergency-home"
* name = "discharge-emergency-home"
* title = "hospitalNotification-message discharge-emergency-home"
* description = "Testing correct use of End hospital Stay- patient dischargedto home/primary sector"
//params createHNSendTest(type, number, fixture, activityCode, encounterClass, encounterStatus, whatRefference, role)
//Once per testscript whatRefference= first is NA efterwards preveious messageheader
* insert createHNSendTest(SLHJ-IMP, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-SLHJ.xml,
 discharge-emergency-home, EMER, finished, NA, source)

 //RE_SLHJ - EMER
Instance: HS-send-revise-discharge-emergency-home
InstanceOf: TestScript
* insert Metadata
* id = "HS-revise-discharge-emergency-home"
* name = "revise-discharge-emergency-home"
* title = "hospitalNotification-message revise-discharge-emergency-home"
* description = "Testing correct use of Update of End hospital Stay"
//params createHNSendTest(type, number, fixture, activityCode, encounterClass, encounterStatus, whatRefference, role)
//Once per testscript whatRefference= first is NA efterwards preveious messageheader
* insert createHNSendTest(RE-SLHJ-EMER, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-RE_SLHJ.xml,
 revise-discharge-emergency-home, EMER, finished, NA, source)

 //AN_SLHJ - EMER
Instance: HS-send-cancel-discharge-emergency-home
InstanceOf: TestScript
* insert Metadata
* id = "HS-cancel-discharge-emergency-home"
* name = "cancel-discharge-emergency-home"
* title = "hospitalNotification-message cancel-discharge-emergency-home"
* description = "Testing correct use of Cancellation of End hospital Stay"
//params createHNSendTest(type, number, fixture, activityCode, encounterClass, encounterStatus, whatRefference, role)
//Once per testscript whatRefference= first is NA efterwards preveious messageheader
* insert createHNSendTest(AN-SLHJ-EMER, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-AN-SLHJ.xml,
 cancel-discharge-emergency-home, EMER, in-progress, NA, source)


//MORS - EMER
Instance: HS-send-cancel-discharge-emergency-home-mors
InstanceOf: TestScript
* insert Metadata
* id = "HS-cancel-discharge-emergency-home-deseased"
* name = "cancel-discharge-emergency-home-deseased"
* title = "hospitalNotification-message cancel-discharge-emergency-home-deseased"
* description = "Testing correct use of Cancellation of End hospital Stay-deseased"
//params createHNSendTest(type, number, fixture, activityCode, encounterClass, encounterStatus, whatRefference, role)
//Once per testscript whatRefference= first is NA efterwards preveious messageheader
* insert createHNSendTestDecased(AN-SLHJ-EMER-mors, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-MORS.xml,
 cancel-discharge-emergency-home, EMER, finished, NA, source,true)

 //MORS - IMP
Instance: HS-send-cancel-discharge-inpatient-home-mors
InstanceOf: TestScript
* insert Metadata
* id = "HS-cancel-discharge-inpatient-home-deseased"
* name = "cancel-discharge-inpatient-home-deseased"
* title = "hospitalNotification-message cancel-discharge-inpatient-home-deseased"
* description = "Testing correct use of Cancellation of End hospital Stay-deseased"
//params createHNSendTest(type, number, fixture, activityCode, encounterClass, encounterStatus, whatRefference, role)
//Once per testscript whatRefference= first is NA efterwards preveious messageheader
* insert createHNSendTestDecased(AN-SLHJ-IMP, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-MORS.xml,
 cancel-discharge-inpatient-home, IMP, finished, NA, source, true)

 //RE_MORS - EMER
Instance: HS-send-revise-discharge-emergency-home-mors
InstanceOf: TestScript
* insert Metadata
* id = "HS-revise-discharge-emergency-home-re-deseased"
* name = "revise-discharge-emergency-home-re-deseased"
* title = "hospitalNotification-message Update of deseased"
* description = "Testing correct use of Update of End hospital Stay"
//params createHNSendTest(type, number, fixture, activityCode, encounterClass, encounterStatus, whatRefference, role)
//Once per testscript whatRefference= first is NA efterwards preveious messageheader
* insert createHNSendTestDecased(RE-SLHJ-EMER, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-RE_MORS.xml,
 revise-discharge-emergency-home, EMER, finished, NA, source, true)

 //RE_MORS - IMP
Instance: HS-send-revise-discharge-inpatient-home-mors
InstanceOf: TestScript
* insert Metadata
* id = "HS-revise-discharge-inpatient-home-re-deseased"
* name = "revise-discharge-inpatient-home-re-deseased"
* title = "hospitalNotification-message Update of deseased"
* description = "Testing correct use of Update of deseased"
//params createHNSendTestDecased(type, number, fixture, activityCode, encounterClass, encounterStatus, whatRefference, role)
//Once per testscript whatRefference= first is NA efterwards preveious messageheader
* insert createHNSendTestDecased(RE-SLHJ-IMP, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-RE_MORS.xml,
 revise-discharge-inpatient-home, IMP, finished, NA, source, true)

  //AN_MORS - EMER
Instance: HS-send-cancel-discharge-emergency-home-an-mors
InstanceOf: TestScript
* insert Metadata
* id = "HS-Cancellation-of-deseased-emer"
* name = "Cancellation-of-deseased-emer"
* title = "hospitalNotification-message Cancellation-of-deseased"
* description = "Testing correct use of Cancellation-of-deseased"
//params createHNSendTest(type, number, fixture, activityCode, encounterClass, encounterStatus, whatRefference, role)
//Once per testscript whatRefference= first is NA efterwards preveious messageheader
* insert createHNSendTestDecased(AN-SLHJ-EMER, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-AN_MORS.xml,
 cancel-discharge-emergency-home, EMER, in-progress, NA, source, false)

 //AN_MORS - IMP
Instance: HS-send-cancel-discharge-inpatient-home-an-mors
InstanceOf: TestScript
* insert Metadata
* id = "HS-Cancellation-of-deseased-imp"
* name = "Cancellation-of-deseased-imp"
* title = "hospitalNotification-message Cancellation-of-deseased-imp"
* description = "Testing correct use of Cancellation-of-deseased-imp"
//params createHNSendTest(type, number, fixture, activityCode, encounterClass, encounterStatus, whatRefference, role)
//Once per testscript whatRefference= first is NA efterwards preveious messageheader
* insert createHNSendTestDecased(AN-SLHJ-IMP, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-AN_MORS.xml,
 cancel-discharge-inpatient-home, IMP, in-progress, NA, source, false)
